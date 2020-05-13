import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtualapp/models/cart_model.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          'Cupom de Desconto',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        leading: Icon(Icons.card_giftcard),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu cupom',
              ),
              initialValue: CartModel.of(context).couponCode ?? "",
              onFieldSubmitted: (text){
                Firestore.instance
                    .collection('coupons')
                    .document(text).get()
                    .then((docSnap){
                      if(docSnap.data != null){
                        CartModel.of(context).setCoupom(text, docSnap.data['percent']);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Desconto de ${docSnap.data['percent']}% aplicado com sucesso!',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }else{
                        CartModel.of(context).setCoupom(null, 0);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Cupom não existe ou foi desativado!',
                            ),
                            backgroundColor: Colors.yellow,
                          ),
                        );
                      }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
