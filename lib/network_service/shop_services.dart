import 'package:daoan6/data/network/network_config.dart';
import 'package:daoan6/ui/home/model/shop.dart';
import 'package:http/http.dart' as http;

class ShopServices {
  static var client = http.Client();

  static Future<List<Shop>?> fetchShop() async {
    var reponse = await client.get(Uri.parse(NetworkConfig.API_SHOP));

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return shopFromJson(jsonString);
    } else {
      return null;
    }
  }
}
