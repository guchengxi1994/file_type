import 'package:file_type/types/type.dart';

class Midi extends AbsType {
  Midi({String MIME = "audio/midi", String EXTENSION = 'midi'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x4D &&
        buf[1] == 0x54 &&
        buf[2] == 0x68 &&
        buf[3] == 0x64);
  }
}

class Mp3 extends AbsType {
  Mp3({String MIME = "audio/mpeg", String EXTENSION = 'mp3'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 &&
        ((buf[0] == 0x49 && buf[1] == 0x44 && buf[2] == 0x33) ||
            (buf[0] == 0xFF && buf[1] == 0xF2) ||
            (buf[0] == 0xFF && buf[1] == 0xF3) ||
            (buf[0] == 0xFF && buf[1] == 0xFB)));
  }
}

class M4a extends AbsType {
  M4a({String MIME = "audio/mp4", String EXTENSION = 'm4a'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 10 &&
        ((buf[4] == 0x66 &&
                buf[5] == 0x74 &&
                buf[6] == 0x79 &&
                buf[7] == 0x70 &&
                buf[8] == 0x4D &&
                buf[9] == 0x34 &&
                buf[10] == 0x41) ||
            (buf[0] == 0x4D &&
                buf[1] == 0x34 &&
                buf[2] == 0x41 &&
                buf[3] == 0x20)));
  }
}

class Ogg extends AbsType {
  Ogg({String MIME = "audio/ogg", String EXTENSION = 'ogg'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x4F &&
        buf[1] == 0x67 &&
        buf[2] == 0x67 &&
        buf[3] == 0x53);
  }
}

class Flac extends AbsType {
  Flac({String MIME = "audio/x-flac", String EXTENSION = 'flac'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x66 &&
        buf[1] == 0x4C &&
        buf[2] == 0x61 &&
        buf[3] == 0x43);
  }
}

class Wav extends AbsType {
  Wav({String MIME = "audio/x-wav", String EXTENSION = 'wav'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 11 &&
        buf[0] == 0x52 &&
        buf[1] == 0x49 &&
        buf[2] == 0x46 &&
        buf[3] == 0x46 &&
        buf[8] == 0x57 &&
        buf[9] == 0x41 &&
        buf[10] == 0x56 &&
        buf[11] == 0x45);
  }
}

class Amr extends AbsType {
  Amr({String MIME = "audio/amr", String EXTENSION = 'amr'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 11 &&
        buf[0] == 0x23 &&
        buf[1] == 0x21 &&
        buf[2] == 0x41 &&
        buf[3] == 0x4D &&
        buf[4] == 0x52 &&
        buf[5] == 0x0A);
  }
}

class Aac extends AbsType {
  Aac({String MIME = "audio/aac", String EXTENSION = 'aac'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return listCompare(buf.sublist(0, 2), [0xff, 0xf1]) ||
        listCompare(buf.sublist(0, 2), [0xff, 0xf9]);
  }
}

class Aiff extends AbsType {
  Aiff({String MIME = "audio/x-aiff", String EXTENSION = 'aiff'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 11 &&
        buf[0] == 0x46 &&
        buf[1] == 0x4F &&
        buf[2] == 0x52 &&
        buf[3] == 0x4D &&
        buf[8] == 0x41 &&
        buf[9] == 0x49 &&
        buf[10] == 0x46 &&
        buf[11] == 0x46);
  }
}
