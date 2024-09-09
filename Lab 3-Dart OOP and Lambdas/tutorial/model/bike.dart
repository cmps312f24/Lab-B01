mixin Break on Vehicle {
  void applyBreak() {
    print('Break applied');
    drive();
  }
}
mixin Break2 on Vehicle {
  void applyBreak() {
    print('Break applied');
    drive();
  }
}

abstract class Vehicle {
  late String name, brand, color;

  Vehicle(name, brand, color)
      : this.name = name,
        this.brand = brand,
        this.color = color;

  // Vehicle(String brand)
  void drive();
  Vehicle.small(name, brand) : this(name, brand, 'black');
}

class Bike {
  late String name, brand, color;

  Bike(name, brand, color)
      : this.name = name,
        this.brand = brand,
        this.color = color;

  // Bike(String brand)

  Bike.small(name, brand) : this(name, brand, 'black');
}

void main(List<String> args) {
  var bike = Bike('Pulsar', 'Bajaj', 'Red');
  print(bike.name);
  print(bike.brand);
  print(bike.color);

  var bike2 = Bike.small('Pulsar', 'Bajaj');
  print(bike2.name);
  print(bike2.brand);
  print(bike2.color);
}
