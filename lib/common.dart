import 'dart:io';

const NUM_SIGNATURE_BYTES = 8192;

Future<List<int>?> getSignatureBytes({required String filePath}) async {
  File f = File(filePath);
  if (!f.existsSync()) {
    return null;
  }
  List<int> result = [];
  try {
    Stream<List<int>> lines = f.openRead(0, NUM_SIGNATURE_BYTES);
    await for (final i in lines) {
      result.addAll(i);
    }
  } catch (e) {
    print('Error: $e');
  }
  return result;
}

List<int> signature(List<int> array) {
  final length = array.length;
  final index;
  if (NUM_SIGNATURE_BYTES > length) {
    index = length;
  } else {
    index = NUM_SIGNATURE_BYTES;
  }
  return array.sublist(0, index);
}

Future<List<int>?> getBytes(dynamic obj) async {
  if (obj is List<int>) {
    return signature(obj);
  }

  if (obj is String) {
    return getSignatureBytes(filePath: obj);
  }

  return null;
}

String bytesToHexString(List<int> bytes, {bool upperCase = false}) {
  StringBuffer buffer = StringBuffer();
  for (int part in bytes) {
    if (part & 0xff != part) {
      throw FormatException("Non-byte integer found");
    }
    buffer.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
  }
  if (upperCase) {
    return buffer.toString().toUpperCase();
  }
  return buffer.toString();
}
