import 'package:papaya/papaya.dart';
import 'package:unittest/unittest.dart';

main(){
  test('Null object have null hashcode', () {
    int hashcode = Objects.hashcode(null);
    expect(hashcode, 0);
  });  
  test('Empty object have null hashcode', () {
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
}

