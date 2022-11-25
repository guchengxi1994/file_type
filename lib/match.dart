import 'package:file_type/common.dart' show getBytes;
import 'package:file_type/types/mod.dart';

class Match {
  late final List<AbsType> matchers = [];
  Match() {
    matchers.addAll([
      // application
      Wasm(),
      // archive
      Epub(),
      Zip(),
      Tar(),
      Rar(),
      Gz(),
      Bz2(),
      SevenZ(),
      Pdf(),
      Exe(),
      Swf(),
      Rtf(),
      Nes(),
      Crx(),
      Cab(),
      Eot(),
      Ps(),
      Xz(),
      Sqlite(),
      Deb(),
      Ar(),
      Z(),
      Lzop(),
      Lz(),
      Elf(),
      Lz4(),
      Br(),
      Dcm(),
      Rpm(),
      Zstd(),
      // audio
      Midi(),
      Mp3(),
      M4a(),
      Ogg(),
      Flac(),
      Wav(),
      Amr(),
      Aac(),
      Aiff(),
      // document
      OfficeFiles(),
      Docx(),
      Odt(),
      Xlsx(),
      Ods(),
      Pptx(),
      Odp(),
      // font
      Woff(),
      Woff2(),
      Ttf(),
      Otf(),
      // image
      Jpeg(),
      Jpx(),
      Apng(),
      Png(),
      Gif(),
      Webp(),
      Cr2(),
      Tiff(),
      Bmp(),
      Jxr(),
      Psd(),
      Ico(),
      Heic(),
      Dwg(),
      Xcf(),
      Avif(),
      // video
      Mp4(),
      M4v(),
      Mkv(),
      Webm(),
      Mov(),
      Avi(),
      Wmv(),
      Flv(),
      Mpeg(),
      M3gp()
    ]);
  }

  Future<AbsType?> match(dynamic obj) async {
    final buf = await getBytes(obj);
    if (buf == null) {
      return null;
    }

    for (final matcher in matchers) {
      if (matcher.match(buf)) {
        return matcher;
      }
    }
    return null;
  }
}
