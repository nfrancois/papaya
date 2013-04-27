part of papaya;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

/**
 * Generates a hash code for multiple values.
 *
 * <p>This is useful for implementing [Object#hashCode()]. For example,
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
 * <li>[true] if a and b are both null.
 * <li>[true] if a and b are both non-null and they are
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
 * Specification by example:
 * <pre>
 *   // Returns "ClassName{}"
 *   toStringHelper(this.runtimeType)
 *    .toString();
 * </pre>
 *
 * <pre>
 *   // Returns "ClassName{x=1}"
 *   toStringHelper(this.runtimeType)
 *    .add("x", 1)
 *    .toString();
 * </pre>
 * 
 * <pre>
 *   // Returns "MyObject{x=1}"
 *   toStringHelper(this.runtimeType)
 *    .add("x", 1)
 *    .toString();
 * </pre>
 * 
 * <pre>
 *   // Returns "ClassName{x=1, y=foo}"
 *   toStringHelper(this.runtimeType)
 *    .add("x", 1)
 *    .add("y", "foo")
 *    .toString();
 * </pre>
 * 
 * <pre>
 *   // Returns "ClassName{x=1}"
 *   toStringHelper(this.runtimeType)
 *    .omitNullValues().add("x", 1)
 *    .add("y", null)
 *    .toString();
 * </pre>
 * 
 * [runtimeType] the object type
 */
ToStringHelper toStringHelper(Type runtimeType) => new ToStringHelper(runtimeType);
  
/**
 * Support class for [toStringHelper].
*
 */
class ToStringHelper {

  final Type runtimeType;
  final LinkedHashMap<String, dynamic> _valueHolders;
  bool _omitNullValues = false;

  /**
   * Use [toStringHelper(runtimeType)] static method instead of this constructor.
   */
  ToStringHelper(this.runtimeType) : _valueHolders = new LinkedHashMap();

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
   * Returns a string in the format specified by [toStringHelper(runtimeType)].
  *
   * <p>After calling this method, you can keep adding more properties to later
   * call toString() again and get a more complete representation of the
   * same object; but properties cannot be removed, so this only allows
   * limited reuse of the helper instance. The helper allows duplication of
   * properties (multiple name/value pairs with the same name can be added).
   */  
  String toString(){
    var buffer = new StringBuffer("$runtimeType{");
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