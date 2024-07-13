import 'package:get_storage/get_storage.dart';
import 'package:snap_buy/constants/strings.dart';

class LocaleStorageServices {
  final GetStorage _box = GetStorage();

  /// To save is guest to the locale storage.
  void saveIsGuest(bool isGuest) {
    _box.write(Strings.isGuestField, isGuest);
  }

  /// To get is guest from the locale storage.
  bool getIsGuest() {
    bool isGuest = _box.read(Strings.isGuestField) ?? false;
    return isGuest;
  }
}
