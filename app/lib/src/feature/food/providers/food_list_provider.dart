import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/food.dart';
import '../services/food_db_service.dart';

part 'food_list_provider.g.dart';

@houstonListProvider
class FoodListProvider extends HoustonFoodListProvider {}

final foodListProvider = StateNotifierProvider<FoodListProvider, List<Food>>(
  (ref) => FoodListProvider(),
);
