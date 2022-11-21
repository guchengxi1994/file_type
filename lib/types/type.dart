import 'package:collection/collection.dart';

abstract class AbsType {
  final String mime;
  final String extension;

  AbsType({required this.extension, required this.mime});

  bool match(List<int> buf);

  @override
  String toString() {
    return "MIME:$mime EXTENSION:$extension";
  }
}

int len(List<dynamic> array) {
  return array.length;
}

bool listCompare(List<dynamic> l1, List<dynamic> l2) {
  return ListEquality().equals(l1, l2);
}
