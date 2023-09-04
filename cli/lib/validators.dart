import 'package:dcli/dcli.dart';

class FeatureNameValidator extends AskValidator {
  const FeatureNameValidator();

  @override
  String validate(String line) {
    final finalline = line.trim().replaceAll(" ", "").replaceAll("_", "");

    // if (!isAlphanumeric(finalline)) {
    //   throw AskValidatorException(red('Alphanumerical characters, underbars, and/or spaces only.'));
    // }
    return line.trim();
  }
}
