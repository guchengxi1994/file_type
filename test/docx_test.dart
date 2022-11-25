import 'package:file_type/match.dart';

void main() async {
  print("word/".codeUnits);
  final docPath = r"C:\Users\xiaoshuyui\Desktop\一种通用文件特征提取及加密方法.docx";
  Match match = Match();
  final matcher = await match.match(docPath);
  print(matcher);
}
