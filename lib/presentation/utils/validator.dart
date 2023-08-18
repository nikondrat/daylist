import 'package:daylist/presentation/translations/translations.g.dart';

class Validator {
  static String? standart(String? v, {bool checkLen = true}) {
    if (v == null || v.isEmpty) {
      return t.auth.errors.empty;
    } else if (v.length < 8 && checkLen) {
      return t.auth.errors.short;
    }
    return null;
  }

  String? initials(String? v, {bool checkLen = true}) {
    if (standart(v, checkLen: checkLen) == null) {
      final RegExp regex = RegExp(r"\d");

      if (regex.hasMatch(v!)) return t.auth.errors.digits;
    } else {
      return standart(v);
    }
    return null;
  }

  String? email(String? v) {
    if (standart(v, checkLen: false) == null) {
      final RegExp regex = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-\=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

      if (!regex.hasMatch(v!)) return t.auth.errors.email;
    } else {
      return standart(v, checkLen: false);
    }
    return null;
  }
}
