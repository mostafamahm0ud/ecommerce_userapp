class ItemModel {
  ItemModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDescribtion,
    required this.itemsDescribtionAr,
    required this.itemsImage,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPrice,
    required this.itemsDiscount,
    required this.itemsDatatime,
    required this.itemsCategories,
  });

  final int? itemsId;
  final String? itemsName;
  final String? itemsNameAr;
  final String? itemsDescribtion;
  final String? itemsDescribtionAr;
  final String? itemsImage;
  final num? itemsCount;
  final num? itemsActive;
  final num? itemsPrice;
  final num? itemsDiscount;
  final DateTime? itemsDatatime;
  final num? itemsCategories;

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemsId: json["items_id"],
      itemsName: json["items_name"],
      itemsNameAr: json["items_name_ar"],
      itemsDescribtion: json["items_describtion"],
      itemsDescribtionAr: json["items_describtion_ar"],
      itemsImage: json["items_image"],
      itemsCount: json["items_count"],
      itemsActive: json["items_active"],
      itemsPrice: json["items_price"],
      itemsDiscount: json["items_discount"],
      itemsDatatime: DateTime.tryParse(json["items_datatime"] ?? ""),
      itemsCategories: json["items_categories"],
    );
  }

  Map<String, dynamic> toJson() => {
        "items_id": itemsId,
        "items_name": itemsName,
        "items_name_ar": itemsNameAr,
        "items_describtion": itemsDescribtion,
        "items_describtion_ar": itemsDescribtionAr,
        "items_image": itemsImage,
        "items_count": itemsCount,
        "items_active": itemsActive,
        "items_price": itemsPrice,
        "items_discount": itemsDiscount,
        "items_datatime": itemsDatatime?.toIso8601String(),
        "items_categories": itemsCategories,
      };
}
