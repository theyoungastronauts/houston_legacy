import 'package:annotations/annotations.dart';
import 'package:app/src/core/models/db_list_response.dart';
import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/feature/food/models/food.dart';

part 'food_db_service.g.dart';

@houstonDbService
class FoodDbService extends HoustonFoodDbService {
  @override
  String get defaultSelect => "*,profile(*)";
}
