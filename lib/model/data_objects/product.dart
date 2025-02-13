class Product {
  final String userId;
  final String id;
  final String title;
  final String body;

  Product({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
