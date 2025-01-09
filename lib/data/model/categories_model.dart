class CategoriesModel {
  CategoriesModel({
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesImage,
    required this.categoriesDatatime,
  });

  final int? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesImage;
  final DateTime? categoriesDatatime;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json["categories_id"],
      categoriesName: json["categories_name"],
      categoriesNameAr: json["categories_name_ar"],
      categoriesImage: json["categories_image"],
      categoriesDatatime: DateTime.tryParse(json["categories_datatime"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "categories_id": categoriesId,
        "categories_name": categoriesName,
        "categories_name_ar": categoriesNameAr,
        "categories_image": categoriesImage,
        "categories_datatime": categoriesDatatime?.toIso8601String(),
      };
}
