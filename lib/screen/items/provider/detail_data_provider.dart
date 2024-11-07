import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/screen/items/data/person.dart';

final detaildataProvider = StateProvider<Person>((ref) {
  Person person = Person(
    name: 'Name', 
    designation: 'Designation', 
    mobile: 'phone', 
    email: 'email'
  );
  
  return person;
});
