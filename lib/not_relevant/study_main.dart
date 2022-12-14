import 'package:quizly_app/not_relevant/person.dart';



void main() {
  print('inheritamce study');
  
  Person man = Person(name: 'nuri'); // injecting an instance of another class

  print(man.name); // accessing the parameter of another class

  man.speak();
  man.walk(); // accessing the method of another class

  print('------------');


  Hero child = Hero('kid');

  print(child.name);

  child.walk();

  child.speak();

  child.fly();

  child.walk();

  print('----');

  Person child2 = Hero('kid2');

  child2.speak();
  child2.walk();

  print('---------');

  speakName(man);
  speakName(child);
  speakName(child2);

}

void speakName(Person person) {
  print('name: ${person.name}');
}