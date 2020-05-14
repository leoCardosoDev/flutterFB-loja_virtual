
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtualapp/datas/Produtct_Data.dart';

class CartProduct{
  String _cid;
  String _category;
  String _pid;
  String _size;
  int _quantity;
  ProductData _productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data['category'];
    pid = document.data['pid'];
    size = document.data['size'];
    quantity = document.data['quantity'];
  }

  Map<String, dynamic> toMap(){
    return {
      'category' : this.category,
      'pid' : this.pid,
      'size' : this.size,
      'quantity' : this.quantity,
      'product' : productData.toResumeData()
    };
  }

  String get cid => _cid;

  set cid(String value) {
    _cid = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  ProductData get productData => _productData;

  set productData(ProductData value) {
    _productData = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  String get size => _size;

  set size(String value) {
    _size = value;
  }

  String get pid => _pid;

  set pid(String value) {
    _pid = value;
  }


}
