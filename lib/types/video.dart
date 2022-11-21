import 'package:file_type/types/isobmff.dart';
import 'package:tuple/tuple.dart';

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
