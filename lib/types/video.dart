import 'isobmff.dart';
import 'package:tuple/tuple.dart';

import 'type.dart';

class Mp4 extends IsoBmff {
  Mp4({String MIME = 'video/mp4', String EXTENSION = 'mp4'})
      : super(EXTENSION: EXTENSION, MIME: MIME);

  @override
  bool match(List<int> buf) {
    if (!isIsoBmff(buf)) {
      return false;
    }
    Tuple3 tuple = getType(buf);
    for (final brand in tuple.item3) {
      if (['mp41', 'mp42', 'isom'].contains(brand)) {
        return true;
      }
    }
    return ['mp41', 'mp42', 'isom'].contains(tuple.item1);
  }
}

class M4v extends AbsType {
  M4v({String MIME = "video/x-m4v", String EXTENSION = 'm4v'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 10 &&
        buf[0] == 0x0 &&
        buf[1] == 0x0 &&
        buf[2] == 0x0 &&
        buf[3] == 0x1C &&
        buf[4] == 0x66 &&
        buf[5] == 0x74 &&
        buf[6] == 0x79 &&
        buf[7] == 0x70 &&
        buf[8] == 0x4D &&
        buf[9] == 0x34 &&
        buf[10] == 0x56);
  }
}

class Mkv extends AbsType {
  Mkv({String MIME = "video/x-matroska", String EXTENSION = 'mkv'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    bool b1 = listCompare(buf.sublist(0, 4), [0x1A, 0x45, 0xDF, 0xA3]);
    List<int> charCodes = const [0x42, 0x82, 0x88];
    final subStr = String.fromCharCodes(charCodes) + "matroska";
    final allStr = String.fromCharCodes(buf);
    bool b2 = allStr.contains(subStr);
    return b1 && b2;
  }
}

class Webm extends AbsType {
  Webm({String MIME = "video/webm", String EXTENSION = 'webm'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    bool b1 = listCompare(buf.sublist(0, 4), [0x1A, 0x45, 0xDF, 0xA3]);
    List<int> charCodes = const [0x42, 0x82, 0x84];
    final subStr = String.fromCharCodes(charCodes) + "webm";
    final allStr = String.fromCharCodes(buf);
    bool b2 = allStr.contains(subStr);
    return b1 && b2;
  }
}

class Mov extends IsoBmff {
  Mov({String MIME = 'video/quicktime', String EXTENSION = 'mov'})
      : super(EXTENSION: EXTENSION, MIME: MIME);

  @override
  bool match(List<int> buf) {
    if (!isIsoBmff(buf)) {
      return false;
    }
    Tuple3 tuple = getType(buf);
    return tuple.item1 == 'qt  ';
  }
}

class Avi extends AbsType {
  Avi({String MIME = "video/x-msvideo", String EXTENSION = 'avi'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 11 &&
        buf[0] == 0x52 &&
        buf[1] == 0x49 &&
        buf[2] == 0x46 &&
        buf[3] == 0x46 &&
        buf[8] == 0x41 &&
        buf[9] == 0x56 &&
        buf[10] == 0x49 &&
        buf[11] == 0x20);
  }
}

class Wmv extends AbsType {
  Wmv({String MIME = "video/x-ms-wmv", String EXTENSION = 'wmv'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 9 &&
        buf[0] == 0x30 &&
        buf[1] == 0x26 &&
        buf[2] == 0xB2 &&
        buf[3] == 0x75 &&
        buf[4] == 0x8E &&
        buf[5] == 0x66 &&
        buf[6] == 0xCF &&
        buf[7] == 0x11 &&
        buf[8] == 0xA6 &&
        buf[9] == 0xD9);
  }
}

class Flv extends AbsType {
  Flv({String MIME = "video/x-flv", String EXTENSION = 'flv'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x46 &&
        buf[1] == 0x4C &&
        buf[2] == 0x56 &&
        buf[3] == 0x01);
  }
}

class Mpeg extends AbsType {
  Mpeg({String MIME = "video/mpeg", String EXTENSION = 'mpeg'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x0 &&
        buf[1] == 0x0 &&
        buf[2] == 0x1 &&
        buf[3] >= 0xb0 &&
        buf[3] <= 0xbf);
  }
}

class M3gp extends AbsType {
  M3gp({String MIME = "video/3gpp", String EXTENSION = '3gp'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return listCompare(
        buf.sublist(0, 7), [0x66, 0x74, 0x79, 0x70, 0x33, 0x67, 0x70]);
  }
}
