import 'package:flutter/material.dart';
import 'package:lojavirtualapp/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SingupScreen()),
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'E-mail',
              ),
              validator: ((text){
                if(text.isEmpty || !text.contains('@')) return"E-mail inválido";

                return null;
              }),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Senha',
              ),
              validator: ((text){
                if(text.isEmpty || text.length < 4) return "Senha inválida";

                return null;
              }),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                child: Text('Esqueci minha senha',
                textAlign: TextAlign.end,),
              ),
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                onPressed: (){

                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
