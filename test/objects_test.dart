import 'package:papaya/papaya.dart';
import 'package:unittest/unittest.dart';

main(){
  group('Hashcode', () {
    test('Null object have hashcode 0', () {
      int hashcode = Objects.hashcode(null);
      expect(hashcode, 0);
    });  
    test('Empty object have hashcode 0', () {
      int hashcode = Objects.hashcode([]);
      expect(hashcode, 0);
    });    
    test('Should have hascode', () {
      int hashcode = Objects.hashcode(["Hello"]);
      expect(hashcode, isNotNull);
    });
    test('Should have same hascode', () {
      int hashcode1 = Objects.hashcode(["Hello", "world"]);
      int hashcode2 = Objects.hashcode(["Hello", "world"]);
      expect(hashcode1, isNotNull);
      expect(hashcode2, isNotNull);
      expect(hashcode1, equals(hashcode2));
    });  
    test('Should have specific hascode', () {
      int hashcode = Objects.hashcode(["Hello", "World"]);
      expect(hashcode, isNotNull);
      expect(hashcode, equals(26697196704));
    });
  });
  
  group('Eauals', () {
    test('Null objects are equals', () {
      bool result = Objects.equal(null, null);
      expect(result, isTrue);
    });
    test('Object cannot be equals to nul', () {
      bool result1 = Objects.equal("Hello", null);
      bool result2 = Objects.equal(null, "Hello");
      expect(result1, isFalse);
      expect(result2, isFalse);
    });
    test('Are equals', () {
      bool result = Objects.equal("Hello", "Hello");
      expect(result, isTrue);
    }); 
    test('Are be different', () {
      bool result = Objects.equal("Hello", "hello");
      expect(result, isFalse);
    }); 
  });
  
  
}

