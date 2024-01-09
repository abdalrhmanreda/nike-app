class ProductModel {
  String? id;
  String? description;
  String? name;
  String? image;
  String? releasedAt;
  String? sizing;
  int? initialPrice;
  String? colorway;
  String? sku;
  String? createdAt;
  String? updatedAt;
  List<String>? sizes;
  Brand? brand;

  ProductModel(
      {this.id,
      this.description,
      this.name,
      this.image,
      this.releasedAt,
      this.sizing,
      this.initialPrice,
      this.colorway,
      this.sku,
      this.createdAt,
      this.updatedAt,
      this.sizes,
      this.brand});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    name = json['name'];
    image = json['image'];
    releasedAt = json['releasedAt'];
    sizing = json['sizing'];
    initialPrice = json['initialPrice'];
    colorway = json['colorway'];
    sku = json['sku'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sizes = json['sizes'].cast<String>();
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['name'] = name;
    data['image'] = image;
    data['releasedAt'] = releasedAt;
    data['sizing'] = sizing;
    data['initialPrice'] = initialPrice;
    data['colorway'] = colorway;
    data['sku'] = sku;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['sizes'] = sizes;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class Brand {
  String? id;
  String? name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
