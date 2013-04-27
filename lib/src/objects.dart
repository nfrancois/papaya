part of dart_commons;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

/**
 * Generates a hash code for multiple values.
*
 * <p>This is useful for implementing {@link Object#hashCode()}. For example,
 * in an object that has three properties : x, y, z, one could write:
 * <pre>
 * int hashCode() => hashcode([x, y, z]);
 * </pre>
*
 * <b>Warning</b>: When a single object is supplied, the returned hash code
 * does not equal the hash code of that object.
 */
int hashcode(List<Object> fields) =>
      (fields == null || fields.isEmpty) ? 0 : fields.fold(1, (int previous, Object e) => 31* previous + (e == null ? 0 : e.hashCode));
  
/**
 * Determines whether two possibly-null objects are equal. Returns:
*
 * <ul>
 * <li>[true] if {@code a} and {@code b} are both null.
 * <li>[true] if {@code a} and {@code b} are both non-null and they are
 *     equal according to ==
 * <li>[false] in all other situations.
 * </ul>
*
 * <p>This assumes that any non-null objects passed to this function conform
 * to the == contract.
 */  
bool equal(Object a, Object b) => a == b || (a != null && a == b);
  
/**
 * Creates an instance of [ToStringHelper].
 *
 * <p>This is helpful for implementing toString().
 * Specification by example: <pre>   {@code
 *   // Returns "ClassName{}"
 *   toStringHelper("ClassName")
 *       .toString();
 *
 *   // Returns "ClassName{x=1}"
 *   toStringHelper("ClassName")
 *       .add("x", 1)
 *       .toString();
 *
 *   // Returns "MyObject{x=1}"
 *   toStringHelper("MyObject")
 *       .add("x", 1)
 *       .toString();
 *
 *   // Returns "ClassName{x=1, y=foo}"
 *   toStringHelper("MyObject")
 *       .add("x", 1)
 *       .add("y", "foo")
 *       .toString();
 *   }}
 *
 *   // Returns "ClassName{x=1}"
 *   toStringHelper("ClassName")
 *       .omitNullValues()
 *       .add("x", 1)
 *       .add("y", null)
 *       .toString();
 *   }}</pre>
*
*
 * @param objectName the object class name
 */
ToStringHelper toStringHelper(String className) => new ToStringHelper(className);
  
/**
 * Support class for [toStringHelper].
*
 */
class ToStringHelper {

  final String className;
  final LinkedHashMap<String, dynamic> _valueHolders;
  bool _omitNullValues = false;

  ToStringHelper(this.className) : _valueHolders = new LinkedHashMap();

  /**
   * Configures the [ToStringHelper] so toString() will ignore
   * properties with null value. The order of calling this method, relative
   * to the add() method, is not significant.
   */  
  ToStringHelper omitNullValues() {
    _omitNullValues = true;
    return this;
  }
  
  /**
   * Adds a name/value pair to the formatted output.
   */  
  ToStringHelper add(String name, var value) {
    _valueHolders[name] = value;
    return this;
  }
  
  /**
   * Returns a string in the format specified by [toStringHelper(className)].
  *
   * <p>After calling this method, you can keep adding more properties to later
   * call toString() again and get a more complete representation of the
   * same object; but properties cannot be removed, so this only allows
   * limited reuse of the helper instance. The helper allows duplication of
   * properties (multiple name/value pairs with the same name can be added).
   */  
  String toString(){
    var buffer = new StringBuffer("$className{");
    var first = true;
    _valueHolders.forEach((String key, value) {
      if(!_omitNullValues || (_omitNullValues && value != null)){
        first? first = false : buffer.write(", ");
        buffer.write("$key=$value");
      }
    });
    buffer.write("}");
    return buffer.toString();
  }
 
  
}