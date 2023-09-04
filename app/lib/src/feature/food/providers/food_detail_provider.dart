import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/food.dart';
import '../services/food_db_service.dart';

final foodDetailProvider = FutureProvider.family<Food?, String>(
  (ref, String uuid) => FoodDbService().retrieve(uuid: uuid),
);
