class item{
  final itemName;
  final brandName;
  final servingWeightGrams;
  final calories;
  final totalFat;
  final cholestrol;
  final sodium;
  final totalCarbohydrates;
  final protein;

  item({
    required this.itemName,
    required this.brandName,
    required this.servingWeightGrams,
    required this.calories,
    required this.totalFat,
    required this.cholestrol,
    required this.sodium,
    required this.totalCarbohydrates,
    required this.protein
  });

  factory item.fromJson(dynamic json) {
    return item(
      itemName: json["item_name"],
      brandName: json["brand_name"],
      servingWeightGrams: json["nf_serving_weight_grams"],
      calories: json["nf_calories"],
      totalFat: json["nf_total_fat"],
      cholestrol: json["nf_cholesterol"],
      sodium: json["nf_sodium"],
      totalCarbohydrates: json["nf_total_carbohydrate"],
      protein: json["nf_protein"],
    );
  }

  static List<item> itemsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return item.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Item {name: $itemName, brand: $brandName, size: $servingWeightGrams}';
  }
}