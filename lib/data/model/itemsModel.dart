class ItemsModel {
  int? id;
  int? category_id;
  String? name;
  String? desc;
  String? image;
  int? count;
  int? active;
  int? price;
  int? discount;
  String? img_route;

  ItemsModel(
      {
        this.id,
        this.category_id,
        this.name,
        this.desc,
        this.image,
        this.discount,
        this.active,
        this.count,
        this.price,
        this.img_route
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_id = json['category_id'];
    name = json['name'];
    desc = json['desc'];
    image = json['image'];
    count = json['count'];
    active = json['active'];
    price = json['price'];
    discount = json['discount'];
    img_route = json['img_route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.category_id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['count'] = this.count;
    data['active'] = this.active;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['img_route'] = this.img_route;
    return data;
  }
}
