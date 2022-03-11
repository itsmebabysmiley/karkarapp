class Product {
  final String image, name, city;
  final double price;
  final int id;
  final String? description;

  Product(
    {
    required this.id,
    required this.image,
    required this.name,
    required this.city,
    required this.price,
    this.description = '',
    });

}

List<Product> recommend_products = [
  Product(id: 1, image: "assets/images/candy_1.png", name: "Candy 1", city: "Bangkok", price: 10.00),
  Product(id: 2, image: "assets/images/candy_2.png", name: "Candy 2", city: "Bangkok", price: 20.00),
  Product(id: 3, image: "assets/images/capcake.png", name: "Capcake", city: "Bangkok", price: 30.00),
];

List<Product> maylike_products = [
  Product(id: 1, image: "assets/images/candy_1.png", name: "Candy 1", city: "Bangkok", price: 10.00),
  Product(id: 2, image: "assets/images/candy_2.png", name: "Candy 2", city: "Bangkok", price: 20.00),
  Product(id: 3, image: "assets/images/capcake.png", name: "Capcake", city: "Bangkok", price: 30.00),
  Product(id: 4, image: "assets/images/candy_1.png", name: "Candy 1", city: "Bangkok", price: 10.00),
  Product(id: 5, image: "assets/images/candy_2.png", name: "Candy 2", city: "Bangkok", price: 20.00),
  Product(id: 6, image: "assets/images/capcake.png", name: "Capcake", city: "Bangkok", price: 30.00),
];


String des = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus.';
