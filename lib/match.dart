import 'package:file_type/common.dart' show getBytes;
import 'package:file_type/types/mod.dart';

class Match {
  late final List<AbsType> matchers = [];
  Match() {
    matchers.addAll([
      // application
      Wasm(),
      // archive
      // audio
      // document
      // font
      Woff(),
      Woff2(),
      // image
      Jpeg(),
      Jpx(),
      Apng(),
      Png(),
      // isobmff
      // video
      Mp4(),
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
