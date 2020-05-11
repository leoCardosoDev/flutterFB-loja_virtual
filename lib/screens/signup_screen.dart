import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crie uma conta'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Nome Completo',
              ),
              validator: ((text){
                if(text.isEmpty || text.length < 4) return "Nome inválido";

                return null;
              }),
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0,),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Senha',
              ),
              validator: ((text){
                if(text.isEmpty || text.length < 4) return "Senha inválida";

                return null;
              }),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Endereço',
              ),
              validator: ((text){
                if(text.isEmpty || text.length < 4) return "Endereço inválido";

                return null;
              }),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                onPressed: (){},
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Criar Conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
