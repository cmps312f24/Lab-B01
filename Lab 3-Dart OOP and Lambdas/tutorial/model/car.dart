import 'bike.dart';

class Car extends Vehicle with Break {
  Car(name, brand, color) : super(name, brand, color);

  // Car(String brand)

  Car.small(name, brand) : this(name, brand, 'black');

  @override
  void drive() {
    // TODO: implement drive
    applyBreak();
  }
}
