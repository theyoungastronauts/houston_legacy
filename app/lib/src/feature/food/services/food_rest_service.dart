import 'package:annotations/annotations.dart';
import 'package:app/src/core/services/rest_service.dart';
import 'package:app/src/core/models/paginated_response.dart';
import 'package:app/src/core/utils/debugger.dart';
import '../models/food.dart';

part 'food_rest_service.g.dart';

@houstonRestService
class FoodRestService extends HoustonFoodRestService {}
