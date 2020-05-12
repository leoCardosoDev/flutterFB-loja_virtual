import 'package:flutter/material.dart';
import 'package:lojavirtualapp/models/cart_model.dart';
import 'package:lojavirtualapp/models/user_model.dart';
import 'package:lojavirtualapp/screens/login_screen.dart';
import 'package:lojavirtualapp/tiles/cart_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu carrinho'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8.0),
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p <= 1 ? "ITEM" : "ITENS"} ",
                  style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_shopping_cart,
                    size: 90.0,
                    color: _primaryColor,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Faça login para adicionar produtos",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: _primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  RaisedButton(
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    color: _primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              ),
            );
          } else if (model.products == null || model.products.length == 0) {
            return Center(
              child: Text(
                "Carrinho vazio!",
                style: TextStyle(
                  fontSize: 18.0,
                  color: _primaryColor,
                ),
              ),
            );
          } else {
            return SafeArea(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: model.products.map((product){
                      return CartTile(product);
                    }).toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
