import 'dart:convert';

import 'package:file_type/types/type.dart';

class Jpeg extends AbsType {
  Jpeg({String MIME = "image/jpeg", String EXTENSION = 'jpg'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 && buf[0] == 0xFF && buf[1] == 0xD8 && buf[2] == 0xFF);
  }
}

class Jpx extends AbsType {
  Jpx({String MIME = "image/jpx", String EXTENSION = 'jpx'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 50 &&
        buf[0] == 0x00 &&
        buf[1] == 0x00 &&
        buf[2] == 0x00 &&
        buf[3] == 0x0C &&
        listCompare(buf.sublist(16, 24), utf8.encode("ftypjp2 ")));
  }
}

class Apng extends AbsType {
  Apng({String MIME = "image/apng", String EXTENSION = 'apng'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    if (len(buf) > 8 &&
        listCompare(buf.sublist(0, 8),
            [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a])) {
      int i = 8;

      /// TODO
      // while (len(buf) > i) {}
    }

    return false;
  }
}

class Png extends AbsType {
  Png({String MIME = "image/png", String EXTENSION = 'png'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x89 &&
        buf[1] == 0x50 &&
        buf[2] == 0x4E &&
        buf[3] == 0x47);
  }
}

class Gif extends AbsType {
  Gif({String MIME = "image/gif", String EXTENSION = 'gif'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 && buf[0] == 0x47 && buf[1] == 0x49 && buf[2] == 0x46);
  }
}

class Webp extends AbsType {
  Webp({String MIME = "image/webp", String EXTENSION = 'webp'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 13 &&
        buf[0] == 0x52 &&
        buf[1] == 0x49 &&
        buf[2] == 0x46 &&
        buf[3] == 0x46 &&
        buf[8] == 0x57 &&
        buf[9] == 0x45 &&
        buf[10] == 0x42 &&
        buf[11] == 0x50 &&
        buf[12] == 0x56 &&
        buf[13] == 0x50);
  }
}

class Cr2 extends AbsType {
  Cr2({String MIME = "image/x-canon-cr2", String EXTENSION = 'cr2'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 9 &&
        ((buf[0] == 0x49 &&
                buf[1] == 0x49 &&
                buf[2] == 0x2A &&
                buf[3] == 0x0) ||
            (buf[0] == 0x4D &&
                buf[1] == 0x4D &&
                buf[2] == 0x0 &&
                buf[3] == 0x2A)) &&
        buf[8] == 0x43 &&
        buf[9] == 0x52);
  }
}

class Tiff extends AbsType {
  Tiff({String MIME = "image/tiff", String EXTENSION = 'tiff'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 9 &&
        ((buf[0] == 0x49 &&
                buf[1] == 0x49 &&
                buf[2] == 0x2A &&
                buf[3] == 0x0) ||
            (buf[0] == 0x4D &&
                buf[1] == 0x4D &&
                buf[2] == 0x0 &&
                buf[3] == 0x2A)) &&
        !(buf[8] == 0x43 && buf[9] == 0x52));
  }
}

class Bmp extends AbsType {
  Bmp({String MIME = "image/bmp", String EXTENSION = 'bmp'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 1 && buf[0] == 0x42 && buf[1] == 0x4D);
  }
}

class Jxr extends AbsType {
  Jxr({String MIME = "image/vnd.ms-photo", String EXTENSION = 'jxr'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 && buf[0] == 0x49 && buf[1] == 0x49 && buf[2] == 0xBC);
  }
}

class Psd extends AbsType {
  Psd({String MIME = "image/vnd.adobe.photoshop", String EXTENSION = 'psd'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x38 &&
        buf[1] == 0x42 &&
        buf[2] == 0x50 &&
        buf[3] == 0x53);
  }
}

class Ico extends AbsType {
  Ico({String MIME = "image/x-icon", String EXTENSION = 'ico'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x00 &&
        buf[1] == 0x00 &&
        buf[2] == 0x01 &&
        buf[3] == 0x00);
  }
}

class Heic extends AbsType {
  Heic({String MIME = "image/heic", String EXTENSION = 'heic'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    /// TODO
    return false;
  }
}

class Dwg extends AbsType {
  Dwg({String MIME = "image/vnd.dwg", String EXTENSION = 'dwg'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return listCompare(buf.sublist(0, 4), [0x41, 0x43, 0x31, 0x30]);
  }
}

class Xcf extends AbsType {
  Xcf({String MIME = "image/x-xcf", String EXTENSION = 'xcf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return listCompare(buf.sublist(0, 10),
        [0x67, 0x69, 0x6d, 0x70, 0x20, 0x78, 0x63, 0x66, 0x20, 0x76]);
  }
}

class Avif extends AbsType {
  Avif({String MIME = "image/avif", String EXTENSION = 'avif'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    /// TODO
    return false;
  }
}
