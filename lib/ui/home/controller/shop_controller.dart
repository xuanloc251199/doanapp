import 'package:daoan6/network_service/shop_services.dart';
import 'package:daoan6/ui/home/model/shop.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  var isLoading = true.obs;
  var shopList = <Shop>[].obs;

  @override
  void onInit() {
    fetchShop();
    super.onInit();
  }

  void fetchShop() async {
    try {
      isLoading(true);
      var shops = await ShopServices.fetchShop();
      if (shops != null) {
        shopList.value = shops;
      }
    } finally {
      isLoading(false);
    }
  }
}
