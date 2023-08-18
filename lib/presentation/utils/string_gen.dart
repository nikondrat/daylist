import 'dart:math';

class StringGenerator {
  static String generate({int length = 20}) {
    const String data =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    Random random = Random();
    String text = '';

    for (int i = 0; i < length; i++) {
      text += data[random.nextInt(data.length)];
    }
    return text;
  }
}
