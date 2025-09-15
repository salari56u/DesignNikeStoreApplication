class Product {
  final String name;
  final String price;
  final String image;
  final List<String> gallery;
  Product(
      {required this.gallery,
      required this.name,
      required this.price,
      required this.image});
}

List<Product> productList = [
  Product(
    name: 'Air Jordan Blue',
    price: '\$89.75',
    image: 'assets/images/blue1.png',
    gallery: ['assets/images/blue1.png', 'assets/images/blue2.png'],
  ),
  Product(
      name: 'Air Jordan Black',
      price: '\$50.75',
      image: 'assets/images/black1.png',
      gallery: ['assets/images/black1.png', 'assets/images/black2.png']),
  Product(
      name: 'Air Jordan Yellow',
      price: '\$106.25',
      image: 'assets/images/yellow2.png',
      gallery: ['assets/images/yellow1.png', 'assets/images/yellow2.png']),
  Product(
      name: 'Air Jordan Orange',
      price: '\$90.50',
      image: 'assets/images/orange2.png',
      gallery: ['assets/images/orange1.png', 'assets/images/orange2.png']),
];
