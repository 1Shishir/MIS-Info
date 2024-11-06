import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/screen/home/riverpod/title_provider.dart';
import 'package:mis_info/screen/items/data/person.dart';

final teachersProvider =
    FutureProvider.family<List<Person>, String>((ref, node) async {
  DatabaseReference databaseReference;

  if (node == 'info') {
    databaseReference = FirebaseDatabase.instance
        .ref()
        .child("students")
        .child(ref.watch(batchIndexProvider))
        .child("info");
  } else {
    databaseReference = FirebaseDatabase.instance.ref().child(node);
  }

  DataSnapshot snapshot = await databaseReference.get();

  if (snapshot.exists) {
    final dynamic snapshotValue = snapshot.value;
    if (snapshotValue is Map &&
        snapshotValue.values.every((value) => value is Map)) {
      return snapshotValue.values
          .map((value) => Person.fromJson(value as Map))
          .toList();
    } else if (snapshotValue is List) {
      return snapshotValue
          .where((element) => element != null && element is Map)
          .map((value) => Person.fromJson(value as Map))
          .toList();
    } else if (snapshotValue is Map) {
      return [Person.fromJson(snapshotValue)];
    }
  }

  return [];
});
