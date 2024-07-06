class UpdateMedicine{
  UpdateMedicine({
    required this.name,
    required this.shape,
    required this.aftearMeal,
    required this.dosage,
    required this.hour,
    required this.minute,
    required this.system,
    required this.id,
});
  String name;
  String shape;
  bool aftearMeal;
  dynamic dosage;
  int hour;
  int minute;
  String system;
  String id;
}