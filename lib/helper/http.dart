import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:rider/helper/auth.dart';

getHttp(uri) async {
  try {
    var response = await get(Uri.parse(uri));
    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
}

getAuthHttp(uri) async {
  String token = await localGetToken();
  print(token);
  print(uri);
  try {
    var response = await get(Uri.parse(uri), headers: {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
}

postAuthHttp(uri, body) async {
  print(uri);
  String token = await localGetToken();

  try {
    var response = await post(Uri.parse(uri), body: jsonEncode(body), headers: {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    print(response.body);
    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
}

postHttp(uri, body) async {
  print(uri);
  try {
    var response = await post(Uri.parse(uri),
        body: body, headers: {"Accept": "application/json"});
    print(response.body);
    return jsonDecode(response.body);
  } catch (e) {
    return e;
  }
}

postWithImage(url, body, filepath, fileName) async {
  String token = await localGetToken();
  var request = MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll({
    'Authorization': 'Bearer $token',
    "Content-Type": "application/json",
    "Accept": "application/json"
  });

  request.fields.addAll(body);
  request.files.add(MultipartFile(fileName,
      File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
      filename: filepath.split("/").last));
  try {
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    return jsonDecode(respStr);
  } catch (e) {
    return e;
  }
}
