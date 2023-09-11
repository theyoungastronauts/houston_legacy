import 'dart:math';

String generateRandomString(int len, [String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890']) {
  var r = Random();
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

String getInitials(String name) => name.isNotEmpty ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join() : '';

String normalizePhoneNumber(String phoneNumber) {
  if (!phoneNumber.startsWith("+")) {
    phoneNumber = "+$phoneNumber";
  }

  phoneNumber.replaceAll("-", "");
  phoneNumber.replaceAll(" ", "");

  return phoneNumber;
}

String formatDuration(Duration duration) {
  return formatSeconds(duration.inSeconds);
}

String formatSeconds(int seconds) {
  if (seconds != 0) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }
    return "$hoursStr:$minutesStr:$secondsStr";
  } else {
    return "";
  }
}

String formatUrlForSave(String url) {
  if (url.isEmpty) return "";

  if (!url.contains("http://") && !url.contains("https://")) {
    return "https://$url";
  }

  return url;
}

String formatUrlForLabel(String url) {
  return url.replaceAll("https://", "").replaceAll("https://", "");
}

String formatNumberWithCommas(double number) {
  String price = "$number";
  String priceInText = "";
  int counter = 0;
  for (int i = (price.length - 1); i >= 0; i--) {
    counter++;
    String str = price[i];
    if ((counter % 3) != 0 && i != 0) {
      priceInText = "$str$priceInText";
    } else if (i == 0) {
      priceInText = "$str$priceInText";
    } else {
      priceInText = ",$str$priceInText";
    }
  }
  return priceInText.trim();
}

String truncate(String text, {int length = 32, omission = '...'}) {
  if (length >= text.length) {
    return text;
  }
  return text.replaceRange(length, text.length, omission);
}
