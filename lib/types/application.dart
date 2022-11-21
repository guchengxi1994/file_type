import 'package:file_type/types/type.dart';

class Wasm extends AbsType {
  Wasm({String MIME = "application/wasm", String EXTENSION = 'wasm'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    // return buf.sublist(0, 8) ==
    //     [0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00];
    return listCompare(
        buf.sublist(0, 8), [0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]);
  }
}
