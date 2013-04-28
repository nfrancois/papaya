import 'package:papaya/papaya.dart';
import 'package:unittest/unittest.dart';

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

main(){
  group('Hashcode', () {
    test('Null object have hashcode 0', () {
      expect(hashcode(null), 0);
    });  
    test('Empty object have hashcode 0', () {
      expect(hashcode([]), 0);
    });    
    test('Should have hascode', () {
      expect(hashcode(["Hello", "world"]), isNotNull);
    });
    test('Should have same hascode', () {
      expect(hashcode(["Hello", "world"]), hashcode(["Hello", "world"]));
    });  
    test('Should have specific hascode', () {
      expect(hashcode(["Hello", "world"]), equals(182043961));
    });
    test('Null is a field value', () {
      expect(hashcode([1, 2, null]),  isNot(equals(hashcode([1, 2]))));
    });
   test('Not associative', (){
     expect(hashcode([1, 2, 3]), isNot(equals(hashcode([2, 3, 1])))); 
   });
  });
  
  group('Eauals', () {
    test('Null objects are equals', () {
      expect(equal(null, null), isTrue);
    });
    test('Object cannot be equals to nul', () {
      expect(equal("Hello", null), isFalse);
      expect(equal(null, "Hello"), isFalse);
    });
    test('Are equals', () {
      expect(equal("Hello", "Hello"), isTrue);
    }); 
    test('Are be different', () {
      expect(equal("Hello", "hello"), isFalse);
    }); 
  });
  
  group('toString', () {
   test('toString on dummy object', (){
     var dummy = new Dummy("Hello", 2);
     expect(dummy.toString(), equals("Dummy{first=Hello, second=2}"));
   });
   test('toString on dummy object with null value', (){
     var dummy = new Dummy(null, 2);
     expect(dummy.toString(), equals("Dummy{first=null, second=2}"));
   });
   test('toString on dummy object with  ommiting null value', (){
     var crazy = new Crazy(null, 2);
     expect(crazy.toString(), equals("Crazy{second=2}"));
   });   
  });
  
  
}

class Dummy {
  
  String first;
  int second;
  
  Dummy(this.first, this.second);
  
  String toString() => toStringHelper(this.runtimeType).add("first", first).add("second", second).toString();   
  
}


class Crazy {
  
  String first;
  int second;
  
  Crazy(this.first, this.second);
  
  String toString() => toStringHelper(this.runtimeType).omitNullValues().add("first", first).add("second", second).toString();   
  
}
