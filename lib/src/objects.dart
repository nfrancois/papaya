part of dart_commons;


class Objects {
  
  static int hashcode(List<Object> fields) =>
      (fields == null || fields.isEmpty) ? 0 : fields.fold(1, (int previous, Object e) => 31* previous + (e == null ? 0 : e.hashCode));
  
  
  static bool equal(Object a, Object b) => a == b || (a != null && a == b);
  
}


