import 'dart:io';

import 'model/car.dart';

void main(List<String> args) {
  Car car = Car('BMW', 'BMW', 'Black');
  print(car.name);

  Cat cat = Cat('Tom', 'Black');
  print(cat.name);

  cat.name = "Jerry";

  Map<String, dynamic> map = {
    'name': 'Tom',
    'color': 'black',
  };

  Cat cat2 = Cat.fromMap(map);
  print(cat2.name);

  File f = File('locatoon');

  // change it to String json
  
}

// a class with setters and getters
class Cat {
  late String _name;
  late String _color;

  Cat(this._name, this._color);

  String get name => _name;

  set name(String name) => this._name = name;

  // factory method
  factory Cat.fromMap(Map<String, dynamic> map) {
    return Cat(map['name'], map['color']);
  }
}
