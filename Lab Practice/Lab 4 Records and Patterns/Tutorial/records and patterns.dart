void main(List<String> args) {
  var (a, b) = (1, 3);

  var json = {'name': 'Abdulahi', 'age': 42};

  // destructuring
  var {'name': name, 'age': age} = json;

  print('name = $name');
  print('age = $age');

  print('a = $a');
  print('b = $b');

  var numbers = [1, 24, 36, -4, 5, 6];
  var [first, ...rest, last] = numbers;
  print('first = $first');
  print('last = $last');

  print('rest = $rest');

  // sort
  numbers.sort((a, b) => a - b);

  var [min, ...others, secondLargest, largest] = [-4, 1, 5, 6, 24, 36];
  print('min = $min');
  print('secondLargest = $secondLargest');
  print('largest = $largest');
  print('others = $others');

  print(numbers);

  // // var temp = a;
  // // a = b;
  // // b = temp;

  // (a, b) = (b, a);

  // var de = ({a: 1, b: 2});
  // print(de);

  // print('a = $a');
  // print('b = $b');

  var f = person();
  print(f.name);
  print(f.age);

  switch (f.age) {
    case > 18 && < 30:
      print('Young');
      break;
    default:
      print('OLD');
  }
  if (f.age case > 18 && < 30 when f.name == "Abdulahi") print('Young');
}

({String name, int age}) person() {
  return (name: 'Abdulahi', age: 42);
}
