import 'package:daoan6/network_service/request_service.dart';
import 'package:daoan6/ui/user/model/user_profile.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userProfile = UserProfile;

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  void fetchUserProfile() async {
    try {
      isLoading(true);
      var userProfiles = await RequestService.fetchUserProfile();
      if (userProfiles != null) {
        userProfile = userProfiles as Type;
      }
    } finally {
      isLoading(false);
    }
  }
}
