import 'package:pizza_repository/src/entities/macros_entity.dart';

class Macros {
  int calories;
  int proteins;
  int fat;
  int carbs;

  Macros({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  MacrosEntity toEntity() {
    return MacrosEntity(
      calories: calories,
      proteins: proteins,
      fat: fat,
      carbs: carbs,
    );
  }

  static final empty = Macros(calories: 0, proteins: 0, fat: 0, carbs: 0);

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
        calories: entity.calories,
        proteins: entity.proteins,
        fat: entity.fat,
        carbs: entity.carbs);
  }
}
