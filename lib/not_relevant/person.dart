class Hero extends Person {
  Hero(String name) : super(name: name);

  void fly() {
    print('$name is flying');
  }

  @override
  void walk() {
    // super.walk();
    print('$name is walking in style');
  }

}

class Person {
  Person({required this.name});

  String? name;

  void speak() {
    print('Hi, I am $name');
  }

  void walk() {
    print('$name is walking');
  }
}