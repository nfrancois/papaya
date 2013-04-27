import 'package:papaya/papaya.dart';

main() {
  var john = new Person("John", 25);
  var unknown = new Person(null, 37);
  
  // hashCode
  print(john.hashCode);
  print(unknown.hashCode);
 
  // toString
  print(john.toString());
  print(unknown.toString());
  print(unknown.alternativeToString());
  
  // equals
  print(john == unknown);
}



class Person {
  
  String name;
  int age;
  
  Person(this.name, this.age);
  
  int get hashCode => hashcode([name, age]);
  
  bool operator==(other) {
    if (identical(other, this)) return true;
    return equal(name, other.name) && equal(age, other.name);
  }
  
  String toString() => toStringHelper(this.runtimeType).add("name", name).add("age", age).toString();
  
  String alternativeToString() => 
    toStringHelper(this.runtimeType).omitNullValues().add("name", name).add("age", age).toString();
  
}