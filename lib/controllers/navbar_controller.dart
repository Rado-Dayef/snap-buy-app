import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/services/auth_service/firebase_auth_service.dart';
import 'package:snap_buy/controllers/services/firebase_services.dart';
import 'package:snap_buy/controllers/services/locale_storage_services.dart';
import 'package:snap_buy/models/book_model.dart';
import 'package:snap_buy/models/navbar_model.dart';
import 'package:snap_buy/models/user_model.dart';
import 'package:snap_buy/views/screens/cart_screen.dart';
import 'package:snap_buy/views/screens/favorite_screen.dart';
import 'package:snap_buy/views/screens/home_screen.dart';
import 'package:snap_buy/views/screens/profile_screen.dart';

class NavbarController extends GetxController {
  bool isLoading = false;
  bool isNoBooks = false;
  int currentItemIndex = 0;
  List<BookModel> booksList = [];
  UserModel currentUser = Get.arguments;
  VoidCallback saveAction = () {};
  bool isGuest = LocaleStorageServices().getIsGuest();
  TextEditingController textEditingController = TextEditingController();
  final List<NavbarItemModel> navbarItemsList = [
    const NavbarItemModel(
      Strings.homeText,
      widget: HomeScreen(),
      darkIcon: Strings.homeDarkIcon,
      lightIcon: Strings.homeLightIcon,
    ),
    const NavbarItemModel(
      Strings.favoriteText,
      widget: FavoriteScreen(),
      darkIcon: Strings.favoriteDarkIcon,
      lightIcon: Strings.favoriteLightIcon,
    ),
    const NavbarItemModel(
      Strings.cartText,
      widget: CartScreen(),
      darkIcon: Strings.cartDarkIcon,
      lightIcon: Strings.cartLightIcon,
    ),
    const NavbarItemModel(
      Strings.profileText,
      widget: ProfileScreen(),
      darkIcon: Strings.profileDarkIcon,
      lightIcon: Strings.profileLightIcon,
    ),
  ];

  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  /// To change the index of the navbar.
  void changeIndex(int index) {
    currentItemIndex = index;
    update();
  }

  /// To get all books.
  void getBooks() async {
    dynamic books = await FirebaseServices().fetchBooks();
    if (books is List<BookModel>) {
      for (int index = 0; index < books.length; index++) {
        bool isFav = currentUser.fav.contains(books[index].id);
        bool isCart = currentUser.cart.contains(books[index].id);
        if (isFav) {
          books[index].isFav = true;
        }
        if (isCart) {
          books[index].isCart = true;
        }
        booksList.add(books[index]);
      }
    } else {
      isNoBooks = true;
    }
    update();
  }

  /// To logout from the current user account.
  Future<void> signOut() async {
    isLoading = true;
    update();
    String response = await FirebaseAuthService().signOut();
    if (response != Strings.signedOutText) {
      response.showToast;
    } else {
      SystemNavigator.pop();
    }
    isLoading = false;
    update();
  }
}
