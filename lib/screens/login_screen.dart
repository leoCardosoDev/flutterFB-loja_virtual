import 'package:flutter/material.dart';
import 'package:lojavirtualapp/models/user_model.dart';
import 'package:lojavirtualapp/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scalffold = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scalffold,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Criar Conta',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                  ),
                  validator: ((text) {
                    if (text.isEmpty || !text.contains('@'))
                      return "E-mail inválido";

                    return null;
                  }),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                  ),
                  validator: ((text) {
                    if (text.isEmpty || text.length < 4)
                      return "Senha inválida";

                    return null;
                  }),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Esqueci minha senha',
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () {
                      if(_emailController.text.isEmpty) {
                        _onRecover();
                      }else {
                        _onRecoverConfirm();
                        model.recoverPass(_emailController.text);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('Entrar'),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        model.signIn(
                            email: _emailController.text,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail(){
    _scalffold.currentState.showSnackBar(
      SnackBar(
        content: Text("Erro ao tentar entrar"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onRecover(){
    _scalffold.currentState.showSnackBar(
      SnackBar(
        content: Text("Insira um e-mail para recupera a senha", style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.yellow,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onRecoverConfirm(){
    _scalffold.currentState.showSnackBar(
      SnackBar(
        content: Text("Foi enviado para seu s-mail um link de verificação!", style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 6),
      ),
    );
  }

}
