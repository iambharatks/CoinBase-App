import 'package:coinbase/data/model/dto/coins_dto.dart';
import 'package:coinbase/data/repository/coins_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement DevelopmentController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCoinsList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  RxList coinsList = List<CoinsDTO>.empty().obs;

  getCoinsList() async {
    try {
      List<CoinsDTO> response =
          await CoinsRepository().getCoinsList();
      response.forEach((element) {
        print(element);
      });
      coinsList.assignAll(response);
    } on Exception catch (_) {
      print("Never Reached");
    }
  }
}
