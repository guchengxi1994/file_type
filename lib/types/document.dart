import 'dart:convert';

import 'package:file_type/types/type.dart';

abstract class ZippedDocumentBase extends AbsType {
  ZippedDocumentBase({required String MIME, required String EXTENSION})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    return matchDocument(buf);
  }

  bool matchDocument(List<int> buf);

  bool compareBytes(List<int> buf, List<int> subslice, int startOffset) {
    int sl = subslice.length;
    if (startOffset + sl > buf.length) {
      return false;
    }
    return listCompare(buf.sublist(startOffset, startOffset + sl), subslice);
  }

  int searchSignature(List<int> buf, int start, int rangeNum) {
    List<int> charCodes = const [0x03, 0x04];
    final signature = "PK" + String.fromCharCodes(charCodes);
    final length = len(buf);

    int end = start + rangeNum;
    if (end > length) {
      end = length;
    }
    if (start >= end) {
      return -1;
    }

    String bufStr = String.fromCharCodes(buf);

    return bufStr.indexOf(signature, start);
  }
}

class OpenDocument extends ZippedDocumentBase {
  OpenDocument({required this.MIME, required this.EXTENSION})
      : super(EXTENSION: EXTENSION, MIME: MIME);

  final String MIME;
  final String EXTENSION;

  @override
  bool matchDocument(List<int> buf) {
    if (!compareBytes(buf, "mimetype".codeUnits, 0x1E)) {
      return false;
    }

    return compareBytes(buf, MIME.codeUnits, 0x26);
  }
}

class OfficeOpenXml extends ZippedDocumentBase {
  OfficeOpenXml({required this.MIME, required this.EXTENSION})
      : super(EXTENSION: EXTENSION, MIME: MIME);

  final String MIME;
  final String EXTENSION;

  @override
  bool matchDocument(List<int> buf) {
    var ft = matchFilename(buf, 0x1E);
    if (ft) {
      return ft;
    }
    if (!compareBytes(buf, "[Content_Types].xml".codeUnits, 0x1E) &&
        !compareBytes(buf, "_rels/.rels".codeUnits, 0x1E) &&
        !compareBytes(buf, "docProps".codeUnits, 0x1E)) {
      return false;
    }

    int idx = 0;
    for (int i = 0; i < 4; i++) {
      idx = searchSignature(buf, idx + 4, 6000);
      if (idx == -1) {
        return false;
      }
      ft = matchFilename(buf, idx + 30);
      if (ft) {
        return ft;
      }
    }
    return false;
  }

  bool matchFilename(List<int> buf, int offset) {
    if (compareBytes(buf, "word/".codeUnits, offset)) {
      return MIME ==
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
    }

    if (compareBytes(buf, "ppt/".codeUnits, offset)) {
      return MIME ==
          "application/vnd.openxmlformats-officedocument.presentationml.presentation";
    }

    if (compareBytes(buf, "xl/".codeUnits, offset)) {
      return MIME ==
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    }
    return false;
  }
}

class OfficeFiles extends AbsType {
  OfficeFiles(
      {String MIME =
          "application/msword | application/vnd.ms-excel | application/vnd.ms-powerpoint",
      String EXTENSION = 'doc|xls|ppt'})
      : super(extension: EXTENSION, mime: MIME);

  @override
  bool match(List<int> buf) {
    if (listCompare(
        buf.sublist(0, 8), [0xD0, 0xCF, 0x11, 0xE0, 0xA1, 0xB1, 0x1A, 0xE1])) {
      return true;
    }
    return false;
  }
}

class Docx extends OfficeOpenXml {
  Docx(
      {String MIME =
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      String EXTENSION = 'docx'})
      : super(EXTENSION: EXTENSION, MIME: MIME);
}

class Odt extends OfficeOpenXml {
  Odt(
      {String MIME = "application/vnd.oasis.opendocument.text",
      String EXTENSION = 'odt'})
      : super(EXTENSION: EXTENSION, MIME: MIME);
}

class Xlsx extends OfficeOpenXml {
  Xlsx(
      {String MIME =
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      String EXTENSION = 'xlsx'})
      : super(EXTENSION: EXTENSION, MIME: MIME);
}

class Ods extends OpenDocument {
  Ods(
      {String MIME = "application/vnd.oasis.opendocument.spreadsheet",
      String EXTENSION = 'ods'})
      : super(EXTENSION: EXTENSION, MIME: MIME);
}

class Pptx extends OfficeOpenXml {
  Pptx(
      {String MIME =
          "application/vnd.openxmlformats-officedocument.presentationml.presentation",
      String EXTENSION = 'pptx'})
      : super(EXTENSION: EXTENSION, MIME: MIME);
}

class Odp extends OpenDocument {
  Odp(
      {String MIME = "application/vnd.oasis.opendocument.presentation",
      String EXTENSION = 'odp'})
      : super(EXTENSION: EXTENSION, MIME: MIME);
}
