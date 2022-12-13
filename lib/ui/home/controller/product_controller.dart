import 'package:daoan6/Pages/detailproduct/detailproduct.dart';
import 'package:daoan6/network_service/request_service.dart';
import 'package:daoan6/ui/home/model/product.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await RequestService.fetchProduct();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
