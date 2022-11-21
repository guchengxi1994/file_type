import 'package:file_type/types/type.dart';

class Epub extends AbsType {
  Epub({String MIME = "application/epub+zip", String EXTENSION = 'epub'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return buf.length > 57 &&
        buf[0] == 0x50 &&
        buf[1] == 0x4B &&
        buf[2] == 0x3 &&
        buf[3] == 0x4 &&
        buf[30] == 0x6D &&
        buf[31] == 0x69 &&
        buf[32] == 0x6D &&
        buf[33] == 0x65 &&
        buf[34] == 0x74 &&
        buf[35] == 0x79 &&
        buf[36] == 0x70 &&
        buf[37] == 0x65 &&
        buf[38] == 0x61 &&
        buf[39] == 0x70 &&
        buf[40] == 0x70 &&
        buf[41] == 0x6C &&
        buf[42] == 0x69 &&
        buf[43] == 0x63 &&
        buf[44] == 0x61 &&
        buf[45] == 0x74 &&
        buf[46] == 0x69 &&
        buf[47] == 0x6F &&
        buf[48] == 0x6E &&
        buf[49] == 0x2F &&
        buf[50] == 0x65 &&
        buf[51] == 0x70 &&
        buf[52] == 0x75 &&
        buf[53] == 0x62 &&
        buf[54] == 0x2B &&
        buf[55] == 0x7A &&
        buf[56] == 0x69 &&
        buf[57] == 0x70;
  }
}

class Zip extends AbsType {
  Zip({String MIME = "application/zip", String EXTENSION = 'zip'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return buf.length > 3 &&
        buf[0] == 0x50 &&
        buf[1] == 0x4B &&
        (buf[2] == 0x3 || buf[2] == 0x5 || buf[2] == 0x7) &&
        (buf[3] == 0x4 || buf[3] == 0x6 || buf[3] == 0x8);
  }
}

class Tar extends AbsType {
  Tar({String MIME = "application/x-tar", String EXTENSION = 'tar'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (buf.length > 261 &&
        buf[257] == 0x75 &&
        buf[258] == 0x73 &&
        buf[259] == 0x74 &&
        buf[260] == 0x61 &&
        buf[261] == 0x72);
  }
}

class Rar extends AbsType {
  Rar({String MIME = "application/x-rar-compressed", String EXTENSION = 'rar'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (buf.length > 6 &&
        buf[0] == 0x52 &&
        buf[1] == 0x61 &&
        buf[2] == 0x72 &&
        buf[3] == 0x21 &&
        buf[4] == 0x1A &&
        buf[5] == 0x7 &&
        (buf[6] == 0x0 || buf[6] == 0x1));
  }
}

class Gz extends AbsType {
  Gz({String MIME = "application/gzip", String EXTENSION = 'gz'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 && buf[0] == 0x1F && buf[1] == 0x8B && buf[2] == 0x8);
  }
}

class Bz2 extends AbsType {
  Bz2({String MIME = "application/x-bzip2", String EXTENSION = 'bz2'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 && buf[0] == 0x42 && buf[1] == 0x5A && buf[2] == 0x68);
  }
}

class SevenZ extends AbsType {
  SevenZ({String MIME = "application/x-7z-compressed", String EXTENSION = '7z'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 5 &&
        buf[0] == 0x37 &&
        buf[1] == 0x7A &&
        buf[2] == 0xBC &&
        buf[3] == 0xAF &&
        buf[4] == 0x27 &&
        buf[5] == 0x1C);
  }
}

class Pdf extends AbsType {
  Pdf({String MIME = "application/pdf", String EXTENSION = 'pdf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    if (len(buf) > 3 && buf[0] == 0xEF && buf[1] == 0xBB && buf[2] == 0xBF) {
      buf = buf.sublist(3);
    }

    return (len(buf) > 3 &&
        buf[0] == 0x25 &&
        buf[1] == 0x50 &&
        buf[2] == 0x44 &&
        buf[3] == 0x46);
  }
}

class Exe extends AbsType {
  Exe({String MIME = "application/x-msdownload", String EXTENSION = 'exe'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 1 && buf[0] == 0x4D && buf[1] == 0x5A);
  }
}

class Swf extends AbsType {
  Swf({String MIME = "application/x-shockwave-flash", String EXTENSION = 'swf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 2 &&
        (buf[0] == 0x43 || buf[0] == 0x46) &&
        buf[1] == 0x57 &&
        buf[2] == 0x53);
  }
}

class Rtf extends AbsType {
  Rtf({String MIME = "application/rtf", String EXTENSION = 'rtf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 4 &&
        buf[0] == 0x7B &&
        buf[1] == 0x5C &&
        buf[2] == 0x72 &&
        buf[3] == 0x74 &&
        buf[4] == 0x66);
  }
}

class Nes extends AbsType {
  Nes(
      {String MIME = "application/x-nintendo-nes-rom",
      String EXTENSION = 'nes'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x4E &&
        buf[1] == 0x45 &&
        buf[2] == 0x53 &&
        buf[3] == 0x1A);
  }
}

class Crx extends AbsType {
  Crx(
      {String MIME = "application/x-google-chrome-extension",
      String EXTENSION = 'crx'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x43 &&
        buf[1] == 0x72 &&
        buf[2] == 0x32 &&
        buf[3] == 0x34);
  }
}

class Cab extends AbsType {
  Cab(
      {String MIME = "application/vnd.ms-cab-compressed",
      String EXTENSION = 'cab'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        ((buf[0] == 0x4D &&
                buf[1] == 0x53 &&
                buf[2] == 0x43 &&
                buf[3] == 0x46) ||
            (buf[0] == 0x49 &&
                buf[1] == 0x53 &&
                buf[2] == 0x63 &&
                buf[3] == 0x28)));
  }
}

class Eot extends AbsType {
  Eot({String MIME = "application/octet-stream", String EXTENSION = 'eot'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 35 &&
        buf[34] == 0x4C &&
        buf[35] == 0x50 &&
        ((buf[8] == 0x02 && buf[9] == 0x00 && buf[10] == 0x01) ||
            (buf[8] == 0x01 && buf[9] == 0x00 && buf[10] == 0x00) ||
            (buf[8] == 0x02 && buf[9] == 0x00 && buf[10] == 0x02)));
  }
}

class Ps extends AbsType {
  Ps({String MIME = "application/postscript", String EXTENSION = 'ps'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 1 && buf[0] == 0x25 && buf[1] == 0x21);
  }
}

class Xz extends AbsType {
  Xz({String MIME = "application/x-xz", String EXTENSION = 'xz'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 5 &&
        buf[0] == 0xFD &&
        buf[1] == 0x37 &&
        buf[2] == 0x7A &&
        buf[3] == 0x58 &&
        buf[4] == 0x5A &&
        buf[5] == 0x00);
  }
}

class Sqlite extends AbsType {
  Sqlite({String MIME = "application/x-sqlite3", String EXTENSION = 'sqlite'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x53 &&
        buf[1] == 0x51 &&
        buf[2] == 0x4C &&
        buf[3] == 0x69);
  }
}

class Deb extends AbsType {
  Deb({String MIME = "application/x-deb", String EXTENSION = 'deb'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 20 &&
        buf[0] == 0x21 &&
        buf[1] == 0x3C &&
        buf[2] == 0x61 &&
        buf[3] == 0x72 &&
        buf[4] == 0x63 &&
        buf[5] == 0x68 &&
        buf[6] == 0x3E &&
        buf[7] == 0x0A &&
        buf[8] == 0x64 &&
        buf[9] == 0x65 &&
        buf[10] == 0x62 &&
        buf[11] == 0x69 &&
        buf[12] == 0x61 &&
        buf[13] == 0x6E &&
        buf[14] == 0x2D &&
        buf[15] == 0x62 &&
        buf[16] == 0x69 &&
        buf[17] == 0x6E &&
        buf[18] == 0x61 &&
        buf[19] == 0x72 &&
        buf[20] == 0x79);
  }
}

class Ar extends AbsType {
  Ar({String MIME = "application/x-unix-archive", String EXTENSION = 'ar'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 6 &&
        buf[0] == 0x21 &&
        buf[1] == 0x3C &&
        buf[2] == 0x61 &&
        buf[3] == 0x72 &&
        buf[4] == 0x63 &&
        buf[5] == 0x68 &&
        buf[6] == 0x3E);
  }
}

class Z extends AbsType {
  Z({String MIME = "application/x-compress", String EXTENSION = 'Z'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 1 &&
        ((buf[0] == 0x1F && buf[1] == 0xA0) ||
            (buf[0] == 0x1F && buf[1] == 0x9D)));
  }
}

class Lzop extends AbsType {
  Lzop({String MIME = "application/x-lzop", String EXTENSION = 'lzo'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 7 &&
        buf[0] == 0x89 &&
        buf[1] == 0x4C &&
        buf[2] == 0x5A &&
        buf[3] == 0x4F &&
        buf[4] == 0x00 &&
        buf[5] == 0x0D &&
        buf[6] == 0x0A &&
        buf[7] == 0x1A);
  }
}

class Lz extends AbsType {
  Lz({String MIME = "application/x-lzip", String EXTENSION = 'lz'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x4C &&
        buf[1] == 0x5A &&
        buf[2] == 0x49 &&
        buf[3] == 0x50);
  }
}

class Elf extends AbsType {
  Elf({String MIME = "application/x-executable", String EXTENSION = 'elf'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 52 &&
        buf[0] == 0x7F &&
        buf[1] == 0x45 &&
        buf[2] == 0x4C &&
        buf[3] == 0x46);
  }
}

class Lz4 extends AbsType {
  Lz4({String MIME = "application/x-lz4", String EXTENSION = 'lz4'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return (len(buf) > 3 &&
        buf[0] == 0x04 &&
        buf[1] == 0x22 &&
        buf[2] == 0x4D &&
        buf[3] == 0x18);
  }
}

class Br extends AbsType {
  Br({String MIME = "application/x-brotli", String EXTENSION = 'br'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    // return buf.sublist(0, 4) == [0xce, 0xb2, 0xcf, 0x81];
    return listCompare(buf.sublist(0, 4), [0xce, 0xb2, 0xcf, 0x81]);
  }
}

class Dcm extends AbsType {
  Dcm({String MIME = "application/dicom", String EXTENSION = 'dcm'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return listCompare(buf.sublist(128, 132), [0x44, 0x49, 0x43, 0x4d]);
  }
}

class Rpm extends AbsType {
  Rpm({String MIME = "application/x-rpm", String EXTENSION = 'rpm'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return listCompare(buf.sublist(0, 4), [0xed, 0xab, 0xee, 0xdb]);
  }
}

class Zstd extends AbsType {
  Zstd({String MIME = "application/zstd", String EXTENSION = 'zst'})
      : super(extension: EXTENSION, mime: MIME);

  final MAGIC_SKIPPABLE_START = 0x184D2A50;
  final MAGIC_SKIPPABLE_MASK = 0xFFFFFFF0;

  @override
  bool match(List<int> buf) {
    /// TODO
    return false;
  }
}
