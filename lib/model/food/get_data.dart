
class getFood {
  String? type;
  String? name;
  String? description;
  String? price;
  String? image;
  String? id;

  getFood(
      {this.type,
        this.name,
        this.description,
        this.price,
        this.image,
        this.id});

  getFood.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
