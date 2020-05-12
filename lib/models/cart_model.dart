import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtualapp/datas/Cart_Product.dart';
import 'package:lojavirtualapp/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  UserModel user;

  List<CartProduct> products = [];

  CartModel(this.user){
    if(user.isLoggedIn())
      _loadCartItens();
  }

  bool isLoading = false;

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .add(cartProduct.toMap())
        .then((cart) {
      cartProduct.cid = cart.documentID;
    });
    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct) {
    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .document(cartProduct.cid)
        .delete();

    products.remove(cartProduct);

    notifyListeners();
  }

  void itemDec(CartProduct cartProduct) {
    cartProduct.quantity--;
    _updateQuantity(cartProduct);
  }

  void itemInc(CartProduct cartProduct) {
    cartProduct.quantity++;
    _updateQuantity(cartProduct);
  }

  void _updateQuantity(CartProduct cartProduct) {

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();

  }

  void _loadCartItens() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart').getDocuments();

    products = querySnapshot.documents.map((doc) => CartProduct.fromDocument(doc)).toList();
    notifyListeners();
  }

}
