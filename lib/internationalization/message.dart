import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': "Hello"},
        'ar_DZ': {'hello': "السلام عليكم"},
        'fr_FR': {'hello': "Bonjour"}
      };
}
