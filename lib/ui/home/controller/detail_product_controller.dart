import 'package:daoan6/network_service/request_service.dart';
import 'package:daoan6/ui/home/model/product.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  final storage = FlutterSecureStorage();

  void onInit() {
    // fetchProductByShop();
    super.onInit();
  }

  // void fetchProductByShop() async {
  //   try {
  //     isLoading(true);
  //     var products =
  //         await RequestService.fetchProductByShop(id: productList.value);
  //     if (products != null) {
  //       productList.value = products;
  //     }
  //   } finally {
  //     Get.snackbar("errorr", "false");
  //   }
  // }
}
