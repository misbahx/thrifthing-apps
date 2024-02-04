import "dart:developer";
import "dart:io";
import "package:dio/dio.dart";
import "package:thrifthing_app_kel4/repository/repository.dart";

class ProductRepository extends Repository {
  Future addProduct({
    required String name,
    required String description,
    required String price,
    required File image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "description": description,
        "price": price,
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.split("/").last),
      });

      log('data buat create: ${formData}');

      Response response = await dio.post("/create_product.php", data: formData);
      log("response add product ${response}");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("failed to add product");
      }
    } catch (err) {
      log("Error ${err}");
    }
  }

  Future getListProduct(String keyword) async {
    try {
      final response = await dio.get('/get_product.php');
      log("Response list product: ${response.data}");
      Map<String, dynamic> responseData = response.data;
      List productsList = responseData["data"];
      return productsList;
    } catch (err) {
      log("Error getListProduct: ${err}");
      return [];
    }
  }
}
