bool isValidEmail(String email) {
  return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
}

bool isValidUrl(String url) {
  var urlPattern = r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$";
  return RegExp(urlPattern, caseSensitive: false).hasMatch(url);
}

bool isValidUsername(String username) {
  return RegExp(r'^(?!\s*$)[a-zA-Z0-9_-]{3,20}$').hasMatch(username);
}

bool isValidPassword(String password) {
  return password.length > 7;
}

bool isValidPhoneNumber(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (!regExp.hasMatch(value.replaceAll("+", ""))) {
    return false;
  }

  return true;
}

String? formValidatorEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email Required";
  }
  if (!isValidEmail(value)) {
    return "Invalid Email";
  }
  return null;
}

String? formValidatorUsername(String? value) {
  if (value == null || value.isEmpty) {
    return "Username Required";
  }

  if (!isValidUsername(value)) {
    return "Invalid Username";
  }

  return null;
}

String? formValidatorPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone Number Required";
  }
  if (!isValidPhoneNumber(value)) {
    return "Invalid Phone Number";
  }
  return null;
}

String? formValidatorPassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password Required";
  }

  if (!isValidPassword(value)) {
    return "Password Not Strong Enough";
  }

  return null;
}

String? formValidatorNotEmpty(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label Required";
  }

  return null;
}
