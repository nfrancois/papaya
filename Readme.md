#Papaya

![Papaya](papaya.jpg)

Papaya is a commons librairies for Dart inspired (very) by Guava.
It provides help to write :
- hashcode / equals / toString methods


[![](https://drone.io/nfrancois/papaya/status.png)](https://drone.io/nfrancois/papaya/latest)

Papaya is distributed under the Apache 2.0 License.


## Getting Started
---------------
Create a Dart project and add a **pubspec.yaml** file to it

#### pub.dartlang.org

```
dependencies:
  papya: any
```

and run

```
pub install
```

## Samples
---------------

```dart
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
  print(unknown.alternativetoString());
  
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
  
  String toString() => toStringHelper("Person").add("name", name).add("age", age).toString();
  
  String alternativetoString() => toStringHelper("Person").omitNullValues().add("name", name).add("age", age).toString();
  
}
```

it print :

```
1495571744
998
Person{name=John, age=25}
Person{name=null, age=37}
Person{age=37}
false
```








