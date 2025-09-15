class CartModel {
  final String name;
  final String price;
  final String image;
  final int count;

  CartModel(
      {required this.name,
      required this.price,
      required this.image,
      required this.count});
}

List<CartModel> cartmodel = [];

double getTotalPrice() {
  return cartmodel.fold(
    0,
    (sum, item) =>
        sum +
        double.parse(
              item.price.replaceAll('\$', ''), // دلار حذف میشه
            ) *
            item.count,
  );
}
