library generators;

import 'package:build/build.dart';
import 'package:generators/src/card_generator.dart';
import 'package:generators/src/db_service_generator.dart';
import 'package:generators/src/detail_screen_generator.dart';
import 'package:generators/src/form_generator.dart';
import 'package:generators/src/form_provider_generator.dart';
import 'package:generators/src/list_generator.dart';
import 'package:generators/src/list_provider_generator.dart';
import 'package:generators/src/list_screen_generator.dart';
import 'package:generators/src/list_tile_generator.dart';
import 'package:generators/src/rest_service_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateRestService(BuilderOptions options) => SharedPartBuilder(
      [RestServiceGenerator()],
      'houston_rest_service',
    );

Builder generateDbService(BuilderOptions options) => SharedPartBuilder(
      [DbServiceGenerator()],
      'houston_db_service',
    );

Builder generateListProvider(BuilderOptions options) => SharedPartBuilder(
      [ListProviderGenerator()],
      'houston_list_provider',
    );

Builder generateFormProvider(BuilderOptions options) => SharedPartBuilder(
      [FormProviderGenerator()],
      'houston_form_provider',
    );

Builder generateListScreen(BuilderOptions options) => SharedPartBuilder(
      [ListScreenGenerator()],
      'houston_list_screen',
    );

Builder generateDetailScreen(BuilderOptions options) => SharedPartBuilder(
      [DetailScreenGenerator()],
      'houston_detail_screen',
    );

Builder generateCard(BuilderOptions options) => SharedPartBuilder(
      [CardGenerator()],
      'houston_card',
    );

Builder generateForm(BuilderOptions options) => SharedPartBuilder(
      [FormGenerator()],
      'houston_form',
    );

Builder generateListTile(BuilderOptions options) => SharedPartBuilder(
      [ListTileGenerator()],
      'houston_list_tile',
    );

Builder generateList(BuilderOptions options) => SharedPartBuilder(
      [ListGenerator()],
      'houston_list',
    );
