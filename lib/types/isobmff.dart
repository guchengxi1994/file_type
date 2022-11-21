import 'dart:convert';

import 'package:file_type/common.dart';
import 'package:file_type/types/type.dart';
import 'package:tuple/tuple.dart';

class IsoBmff extends AbsType {
  IsoBmff({required String MIME, required String EXTENSION})
      : super(extension: EXTENSION, mime: MIME);

  List<int> ftyp = utf8.encode("ftyp");

  @override
  @Deprecated("dont use this method in `IsoBmff`")
  bool match(List<int> buf) {
    return false;
  }

  bool isIsoBmff(List buf) {
    if (len(buf) < 16 || !listCompare(buf.sublist(4, 8), ftyp)) {
      return false;
    }
    final bytes = buf.sublist(0, 4) as List<int>;

    String byteLen = bytesToHexString(bytes);

    if (len(buf) < int.parse(byteLen, radix: 16)) {
      return false;
    }
    return true;
  }

  Tuple3<String, int, List<String>> getType(List<int> buf) {
    final bytes = buf.sublist(0, 4);
    String byteLen = bytesToHexString(bytes);
    final ftypLen = int.parse(byteLen, radix: 16);
    final mvBytes = buf.sublist(12, 16);
    String mvBytesLen = bytesToHexString(mvBytes);
    final minorVersion = int.parse(mvBytesLen, radix: 16);
    final majorBrand = utf8.decode(buf.sublist(8, 12));
    final compatibleBrands = <String>[];
    for (int i = 0; i < ftypLen; i = i + 4) {
      compatibleBrands.add(utf8.decode(buf.sublist(i, i + 4)));
    }
    return Tuple3(majorBrand, minorVersion, compatibleBrands);
  }
}
