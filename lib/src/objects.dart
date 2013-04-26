part of dart_commons;

int hashcode(List<Object> fields) =>
      (fields == null || fields.isEmpty) ? 0 : fields.fold(1, (int previous, Object e) => 31* previous + (e == null ? 0 : e.hashCode));
  
  
bool equal(Object a, Object b) => a == b || (a != null && a == b);
  
ToStringHelper toStringHelper(String objectName) => new ToStringHelper(objectName);
  

class ToStringHelper {

  final String objectName;
  final LinkedHashMap<String, dynamic> _valueHolders;
  
  ToStringHelper(this.objectName) : _valueHolders = new LinkedHashMap();
  
  ToStringHelper add(String name, var value) {
    _valueHolders[name] = value;
    return this;
  }
  
  String toString(){
    var buffer = new StringBuffer("$objectName{");
    var first = true;
    _valueHolders.forEach((String key, value) {
      first? first = false : buffer.write(", ");
      buffer.write("$key=$value");
    });
    buffer.write("}");
    return buffer.toString();
  }
 
  
}