import 'package:file_type/types/type.dart';

class Woff extends AbsType {
  Woff({String MIME = "application/font-woff", String EXTENSION = 'woff'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 7 &&
        buf[0] == 0x77 &&
        buf[1] == 0x4F &&
        buf[2] == 0x46 &&
        buf[3] == 0x46 &&
        ((buf[4] == 0x00 &&
                buf[5] == 0x01 &&
                buf[6] == 0x00 &&
                buf[7] == 0x00) ||
            (buf[4] == 0x4F &&
                buf[5] == 0x54 &&
                buf[6] == 0x54 &&
                buf[7] == 0x4F) ||
            (buf[4] == 0x74 &&
                buf[5] == 0x72 &&
                buf[6] == 0x75 &&
                buf[7] == 0x65)));
  }
}

class Woff2 extends AbsType {
  Woff2({String MIME = "application/font-woff", String EXTENSION = 'Woff2'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 7 &&
        buf[0] == 0x77 &&
        buf[1] == 0x4F &&
        buf[2] == 0x46 &&
        buf[3] == 0x32 &&
        ((buf[4] == 0x00 &&
                buf[5] == 0x01 &&
                buf[6] == 0x00 &&
                buf[7] == 0x00) ||
            (buf[4] == 0x4F &&
                buf[5] == 0x54 &&
                buf[6] == 0x54 &&
                buf[7] == 0x4F) ||
            (buf[4] == 0x74 &&
                buf[5] == 0x72 &&
                buf[6] == 0x75 &&
                buf[7] == 0x65)));
  }
}

class Ttf extends AbsType {
  Ttf({String MIME = "application/font-sfnt", String EXTENSION = 'ttf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 4 &&
        buf[0] == 0x00 &&
        buf[1] == 0x01 &&
        buf[2] == 0x00 &&
        buf[3] == 0x00 &&
        buf[4] == 0x00);
  }
}

class Otf extends AbsType {
  Otf({String MIME = "application/font-sfnt", String EXTENSION = 'otf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 4 &&
        buf[0] == 0x4F &&
        buf[1] == 0x54 &&
        buf[2] == 0x54 &&
        buf[3] == 0x4F &&
        buf[4] == 0x00);
  }
}
