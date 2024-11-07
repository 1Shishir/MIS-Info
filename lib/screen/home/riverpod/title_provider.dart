import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = StateProvider<String>((ref) {
  return "";
});

final personCategoryProvider = StateProvider<String>((ref) {
  return "";
});

final batchIndexProvider = StateProvider<String>((ref) {
  return "1";
});