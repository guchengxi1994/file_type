import 'package:file_type/match.dart';

void main() async {
  final imagePath = r"C:\Users\xiaoshuyui\Desktop\我的图片 - 副本.png";
  Match match = Match();
  final matcher = await match.match(imagePath);
  print(matcher);
}
