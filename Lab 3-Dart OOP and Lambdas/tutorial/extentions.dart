extension on List<int> {
  void printElements() {
    this.forEach((a) => print(a));
  }
}

void main(List<String> args) {
  List<int> list = [1, 2, 3, 4, 5];
  list.printElements();
}
