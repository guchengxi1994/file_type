import 'package:collection/collection.dart';

void main() {
  final l = [1, 2, 3, 4];
  print(l == [1, 2, 3, 4]);
  print(ListEquality().equals(l, [1, 2, 3, 4]));
}
