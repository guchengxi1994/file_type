import 'package:file_type/file_type.dart';

void main() async {
  final result = await FileType.getFileType(
      filepath: "C:\\Users\\xiaoshuyui\\Desktop\\20220715125314.jpg");

  print(result);
}
