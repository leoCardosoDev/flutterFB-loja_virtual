import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtualapp/models/user_model.dart';
import 'package:lojavirtualapp/screens/login_screen.dart';
import 'package:lojavirtualapp/tiles/order_tile.dart';

class OrdersTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Color _primaryColor = Theme.of(context).primaryColor;

    if(UserModel.of(context).isLoggedIn()){
      
      String uid = UserModel.of(context).firebaseUser.uid;
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection('users')
            .document(uid)
            .collection('orders').getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else
            return ListView(
              children: snapshot.data.documents.map((doc) => OrderTile(doc.documentID)).toList()
                  .reversed.toList(),
            );
        },
      );
      
    }else{
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.view_list,
              size: 90.0,
              color: _primaryColor,
            ),
            SizedBox(height: 16.0),
            Text(
              "Faça login para acompanhar seus pedidos",
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
    }

  }
}
