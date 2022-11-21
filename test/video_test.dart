import 'package:file_type/match.dart';

void main() async {
  final videoPath =
      r"C:\Users\xiaoshuyui\Desktop\不常用的东西\新建文件夹 (2)\Asian woman.mp4";
  Match match = Match();
  final matcher = await match.match(videoPath);
  print(matcher);
}
