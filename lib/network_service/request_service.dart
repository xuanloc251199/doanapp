import 'dart:async';

import 'package:daoan6/data/network/network_config.dart';
import 'package:daoan6/ui/home/model/product.dart';
import 'package:daoan6/ui/user/model/user_profile.dart';
import 'package:http/http.dart' as http;

class RequestService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProduct() async {
    var reponse = await client.get(Uri.parse(NetworkConfig.API_ALL_PRODUCT));

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<UserProfile?> fetchUserProfile() async {
    var reponse = await client.get(Uri.parse(NetworkConfig.API_USER_PROFILE));

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return userProfileFromJson(jsonString);
    } else {
      return null;
    }
  }
  // static fetchProductByShop({
  //   required id,
  // }) async {
  //   var reponse = await client.post(
  //     Uri.parse(NetworkConfig.API_PRODUCT_BY_SHOP + "?id_shop="),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(<String, String>{
  //       "id_shop": id,
  //     }),
  //   );

  //   if (reponse.statusCode == 200) {
  //     var jsonString = reponse.body;
  //     var products = productFromJson(jsonString);
  //     return products;
  //   } else {
  //     return null;
  //   }
  // }
}
