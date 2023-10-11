class Product {
  final String name;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.price,
  });
  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ price.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product &&
            other.name == name &&
            other.description == description &&
            other.price == price);
  }
}