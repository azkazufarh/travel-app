class Hotel {
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final String address;
  final int price;
  final double rating;
  final double discount;
  final List<String> facilities;

  Hotel({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.rating,
    required this.discount,
    required this.facilities,
  });

  double get discountPrice => price - (price * (discount / 100));

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is Hotel && other.id == id);
  }

  @override
  int get hashCode => id.hashCode;
}
