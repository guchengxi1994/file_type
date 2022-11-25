import 'package:file_type/file_type.dart';

void main() async {
  final docPath = r"C:\Users\xiaoshuyui\Desktop\一种通用文件特征提取及加密方法.doc";
  Match match = Match();
  final matcher = await match.match(docPath);
  print(matcher);
}
