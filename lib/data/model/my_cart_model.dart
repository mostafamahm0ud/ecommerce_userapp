class MyCartModel {
  num? itemsprice;
  num? countitems;
  num? cartId;
  num? cartUserid;
  num? cartItemid;
  num? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescribtion;
  String? itemsDescribtionAr;
  String? itemsImage;
  num? itemsCount;
  num? itemsActive;
  num? itemsPrice;
  num? itemsDiscount;
  String? itemsDatatime;
  num? itemsCategories;

  MyCartModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescribtion,
      this.itemsDescribtionAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatatime,
      this.itemsCategories});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescribtion = json['items_describtion'];
    itemsDescribtionAr = json['items_describtion_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatatime = json['items_datatime'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_describtion'] = itemsDescribtion;
    data['items_describtion_ar'] = itemsDescribtionAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datatime'] = itemsDatatime;
    data['items_categories'] = itemsCategories;
    return data;
  }
}
