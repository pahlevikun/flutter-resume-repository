class StringUtils {
  static String formatPhoneNumber(String _phoneNumber) {
    if (_phoneNumber.isEmpty) {
      return "";
    } else {
      String temp = "+62";
      if (_phoneNumber.substring(0, 1) == "0") {
        temp += _phoneNumber.substring(1);
      } else {
        temp += _phoneNumber;
      }
      return temp;
    }
  }

  static bool isEmailValid(String _email) {
    return _email.isNotEmpty
        ? RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
            .hasMatch(_email)
        : false;
  }

  static String format(String template, List replacements) {
    var regExp = RegExp('(\{\{([a-zA-Z0-9]+)\}\})');
    assert(regExp.allMatches(template).length == replacements.length,
        "Template and Replacements length are incompatible");

    for (var replacement in replacements) {
      template = template.replaceFirst(regExp, replacement.toString());
    }

    return template;
  }
}
