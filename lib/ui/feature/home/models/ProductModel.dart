/// id : "8b1d31d2-6e7b-4e0a-85c5-d3dd769237f7"
/// name : "Nike SB Dunk Low Gibson Guitar Case"
/// image : "https://retailed.fra1.digitaloceanspaces.com/p/nike-dunk-sb-low-gibson-guitar-case.webp"
/// releasedAt : "2007-01-01"
/// sizing : "man"
/// initialPrice : 100
/// colorway : "Light British Tan/Metallic Gold"
/// sku : "313170-271"
/// createdAt : "2022-12-24T11:28:29.519416+00:00"
/// updatedAt : "2023-11-20T19:48:00.754955+00:00"
/// sizes : ["38","39","40","41","42","43","44","45","46"]
/// brand : {"id":"2bd9a45a-683b-11ed-9022-0242ac120002","name":"Nike"}

class ProductModel {
  ProductModel({
    String? id,
    String? name,
    String? image,
    String? releasedAt,
    String? sizing,
    num? initialPrice,
    String? colorway,
    String? sku,
    String? createdAt,
    String? updatedAt,
    List<String>? sizes,
    Brand? brand,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _releasedAt = releasedAt;
    _sizing = sizing;
    _initialPrice = initialPrice;
    _colorway = colorway;
    _sku = sku;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _sizes = sizes;
    _brand = brand;
  }

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _releasedAt = json['releasedAt'];
    _sizing = json['sizing'];
    _initialPrice = json['initialPrice'];
    _colorway = json['colorway'];
    _sku = json['sku'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _sizes = json['sizes'] != null ? json['sizes'].cast<String>() : [];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }
  String? _id;
  String? _name;
  String? _image;
  String? _releasedAt;
  String? _sizing;
  num? _initialPrice;
  String? _colorway;
  String? _sku;
  String? _createdAt;
  String? _updatedAt;
  List<String>? _sizes;
  Brand? _brand;
  ProductModel copyWith({
    String? id,
    String? name,
    String? image,
    String? releasedAt,
    String? sizing,
    num? initialPrice,
    String? colorway,
    String? sku,
    String? createdAt,
    String? updatedAt,
    List<String>? sizes,
    Brand? brand,
  }) =>
      ProductModel(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        releasedAt: releasedAt ?? _releasedAt,
        sizing: sizing ?? _sizing,
        initialPrice: initialPrice ?? _initialPrice,
        colorway: colorway ?? _colorway,
        sku: sku ?? _sku,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        sizes: sizes ?? _sizes,
        brand: brand ?? _brand,
      );
  String? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get releasedAt => _releasedAt;
  String? get sizing => _sizing;
  num? get initialPrice => _initialPrice;
  String? get colorway => _colorway;
  String? get sku => _sku;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<String>? get sizes => _sizes;
  Brand? get brand => _brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['releasedAt'] = _releasedAt;
    map['sizing'] = _sizing;
    map['initialPrice'] = _initialPrice;
    map['colorway'] = _colorway;
    map['sku'] = _sku;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['sizes'] = _sizes;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    return map;
  }
}

/// id : "2bd9a45a-683b-11ed-9022-0242ac120002"
/// name : "Nike"

class Brand {
  Brand({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  Brand copyWith({
    String? id,
    String? name,
  }) =>
      Brand(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
