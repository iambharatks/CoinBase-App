class Strings {
  static const title = "Coin Base";
}

class URLs {
  static get coinsInfo =>
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=200&convert=USD";

  static get coinInfo =>
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=";
}
