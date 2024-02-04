import "package:dio/dio.dart";
import "dart:developer";
import "package:shared_preferences/shared_preferences.dart";

class Repository {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "https://misbahreactprogrammer.000webhostapp.com/apiv2"));

  Future<bool> checkSession(String session) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String session = preferences.getString("session") ?? "";
    log("session ${session}");
    Map formDataMap = {"session_token": session};
    FormData formData = FormData();
    formData.fields
        .addAll(formDataMap.entries.map((e) => MapEntry(e.key, e.value)));
    try {
      final response = await dio.post("/get_session.php", data: formData);
      log("check session ${response}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        log("data session response : ${data}");
        return data['status'] == 200;
      }
    } catch (err) {
      print("error check session ${err}");
      // preferences.remove("session");
    }
    return false;
  }
}
