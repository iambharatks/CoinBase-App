import 'package:coinbase/data/model/dto/coin_dto.dart';
import 'package:coinbase/data/repository/coin_repository.dart';
import 'package:get/get.dart';

class CoinController extends GetxController {
  final count = 0.obs;

  CoinController({this.symbol});

  @override
  void onInit() {
    super.onInit();
    getCoinData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? symbol;

  Rx<CoinDTO?> coinData = CoinDTO(percentChange24H: 0,marketCap: 0,price: 0,lastUpdated: "0:0:0").obs;

  getCoinData() async {
    try {
      CoinDTO? response = await CoinRepository().getCoinData(symbol);
      coinData.value = response;
    } on Exception catch (_) {
      print(_);
    }
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
