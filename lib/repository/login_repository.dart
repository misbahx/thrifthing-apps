import "dart:developer";
import "package:dio/dio.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:thrifthing_app_kel4/repository/repository.dart";

class LoginRepository extends Repository {
  Future login({required String username, required String password}) async {
    Map formDataMap = {"username": username, "password": password};
    FormData formData = FormData();
    formData.fields
        .addAll(formDataMap.entries.map((e) => MapEntry(e.key, e.value)));

    try {
      final response = await dio.post("/login.php", data: formData);

      Map repoResponse = {"status": false, "data": Null};

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        repoResponse['status'] = true;
        repoResponse['data'] = data;
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        preferences.setString('session', data['session_token']);
      }
      return repoResponse;
    } catch (e) {
      log('error login ${e}');
    }
  }

  Future logout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String session = preferences.getString("session") ?? "";
    Map formDataMap = {"session_token": session};
    FormData formData = FormData();
    formData.fields
        .addAll(formDataMap.entries.map((e) => MapEntry(e.key, e.value)));

    try {
      final response = await dio.post("/logout.php", data: formData);
      log("error ${response}");
      preferences.remove("session");
    } catch (e) {
      log('error logout ${e}');
    }
  }
}
