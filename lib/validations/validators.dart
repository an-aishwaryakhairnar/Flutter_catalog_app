class RegularExpressions {
  static const Pattern emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const Pattern passwordPattern =
      r'^(?=.*[a-z])(?=.*[0-9])(?=.*[^\w\*])[^\s]{6,20}$';
  static const Pattern specialCharacterPattern = r"[$&+,:;=?@#|'<>.-^*()%!]";
  static const Pattern numberPattern = r"[0-9]";
}
