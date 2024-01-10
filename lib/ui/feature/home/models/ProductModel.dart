/// id : "037ab05d-053b-4923-9be9-ec9b0374aa3d"
/// name : "adidas Yeezy Foam RNR Stone Taupe"
/// image : "https://retailed.fra1.digitaloceanspaces.com/p/adidas-yeezy-foam-rnr-stone-taupe.webp"
/// releasedAt : "2023-08-30"
/// description : "Elevate your style with our chic and versatile shoe collection. From timeless classics to trendy designs, our shoes blend fashion and comfort seamlessly. Crafted with precision and attention to detail, each pair is a statement of sophistication. Step into confidence and make every stride a stylish one with "
/// isFav : false
/// sizing : "yeezy"
/// initialPrice : 90
/// colorway : "Stone Taupe/Stone Taupe/Stone Taupe"
/// sku : "ID4752"
/// createdAt : "2023-08-15T10:40:44.103999+00:00"
/// updatedAt : "2023-11-15T09:06:00.664678+00:00"
/// sizes : ["38","39","40","41","42","43","44","45","46"]
/// brand : {"id":"fc646ebb-9357-4b3f-ba0e-595db1b808ed","name":"Adidas"}

class ProductModel {
  ProductModel({
    String? id,
    String? name,
    String? image,
    String? releasedAt,
    String? description,
    bool? isFav,
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
    _description = description;
    _isFav = isFav;
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
    _description = json['description'];
    _isFav = json['isFav'];
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
  String? _description;
  bool? _isFav;
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
    String? description,
    bool? isFav,
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
        description: description ?? _description,
        isFav: isFav ?? _isFav,
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
  String? get description => _description;
  bool? get isFav => _isFav;
  String? get sizing => _sizing;
  num? get initialPrice => _initialPrice;
  String? get colorway => _colorway;
  String? get sku => _sku;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<String>? get sizes => _sizes;
  Brand? get brand => _brand;

  Map<String, dynamic> toJson(bool? isFav) {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['releasedAt'] = _releasedAt;
    map['description'] = _description;
    map['isFav'] = isFav;
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

/// id : "fc646ebb-9357-4b3f-ba0e-595db1b808ed"
/// name : "Adidas"

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
