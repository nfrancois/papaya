import 'package:papaya/papaya.dart';

main() {
  var john = new Person("John", 25);
  var unknown = new Person(null, 37);
  
  // 1495571744
  print(john.hashCode);
  // 998
  print(unknown.hashCode);
 
  // Person{name=John, age=25}
  print(john);
  // Person{name=null, age=37}
  print(unknown);
  // Person{age=37}
  print(unknown.alternativeToString());
  
  // false
  print(john == unknown);
}



class Person {
  
  String name;
  int age;
  
  Person(this.name, this.age);
  
  int get hashCode => hashcode([name, age]);
  
  bool operator==(other) => equal(name, other.name) && equal(age, other.age);
  
  String toString() => toStringHelper(this.runtimeType).add("name", name).add("age", age).toString();
  
  String alternativeToString() => 
    toStringHelper(this.runtimeType).omitNullValues().add("name", name).add("age", age).toString();
  
}