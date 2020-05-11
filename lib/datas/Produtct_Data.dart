
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{
  String _category;
  String _id;
  String _description;
  String _title;
  double _price;
  List _images;
  List _sizes;


  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data['title'];
    description = snapshot.data['description'];
    price = snapshot.data['price'];
    images = snapshot.data['images'];
    sizes = snapshot.data['sizes'];
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get id => _id;

  List get sizes => _sizes;

  set sizes(List value) {
    _sizes = value;
  }

  List get images => _images;

  set images(List value) {
    _images = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set id(String value) {
    _id = value;
  }


}