import 'package:coinbase/data/model/response_DTOs/home_page/coins_response.dart';

class CoinsDTO {
  late final String? name;
  late final String? symbol;
  late final int? id;

  CoinsDTO({
    this.id,
    this.name,
    this.symbol,
  });

  static CoinsDTO fromClass(Coins classResponse) => CoinsDTO(
      name: classResponse.name,
      symbol: classResponse.symbol,
      id: classResponse.id);
}
