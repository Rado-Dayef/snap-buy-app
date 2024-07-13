import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/controllers/services/firebase_services.dart';
import 'package:snap_buy/models/book_model.dart';
import 'package:snap_buy/views/widgets/custom_snackbar.dart';
import 'package:snap_buy/views/widgets/err_widget.dart';
import 'package:snap_buy/views/widgets/hero_widget.dart';
import 'package:snap_buy/views/widgets/loading_widget.dart';

class BookWidget extends StatelessWidget {
  final bool? noFav;
  final bool? noCart;
  final BookModel book;

  const BookWidget(
    this.book, {
    this.noFav,
    this.noCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Strings.bookDetailsRoute,
        arguments: book,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.themeWhite,
          borderRadius: 15.borderRadiusAll,
          border: Border.all(
            color: ThemeColors.themeBlue,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: ThemeColors.themeBlue.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: 10.edgeInsetsAll,
          tileColor: ThemeColors.themeWhite,
          leading: ClipRRect(
            borderRadius: 5.borderRadiusAll,
            child: HeroWidget(
              tag: book.image + book.id,
              child: CachedNetworkImage(
                width: 40,
                height: 100,
                imageUrl: book.image,
                fit: BoxFit.cover,
                errorWidget: (BuildContext context, String url, Object error) {
                  return const ErrWidget();
                },
                placeholder: (BuildContext context, String url) {
                  return const LoadingWidget();
                },
              ),
            ),
          ),
          title: HeroWidget(
            tag: book.title + book.id,
            child: Text(
              book.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ThemeFonts.textStyleBlue20TimesBold,
            ),
          ),
          subtitle: Text(
            Strings.priceText + Strings.colonSign + Strings.spaceSign + book.price.toString() + Strings.dollarSign,
            style: ThemeFonts.textStyleBlue16TimesNormal,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              noFav ?? false
                  ? 0.gap
                  : GetBuilder<NavbarController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: controller.isGuest
                              ? () {
                                  controller.saveAction = () async {
                                    BookModel bookFromList = controller.booksList.firstWhere((element) => element.id == book.id);
                                    bool isFav = bookFromList.isFav;
                                    bookFromList.isFav = !bookFromList.isFav;
                                    controller.update();
                                    dynamic updateFavListResponse = await FirebaseServices().updateUserFavList(book.id);
                                    if (updateFavListResponse is String) {
                                      updateFavListResponse.showToast;
                                      bookFromList.isFav = isFav;
                                      controller.update();
                                    }
                                  };
                                  controller.update();
                                  customSnackbar();
                                }
                              : () async {
                                  BookModel bookFromList = controller.booksList.firstWhere((element) => element.id == book.id);
                                  bool isFav = bookFromList.isFav;
                                  bookFromList.isFav = !bookFromList.isFav;
                                  controller.update();
                                  dynamic updateFavListResponse = await FirebaseServices().updateUserFavList(book.id);
                                  if (updateFavListResponse is String) {
                                    updateFavListResponse.showToast;
                                    bookFromList.isFav = isFav;
                                    controller.update();
                                  }
                                },
                          child: AnimatedSwitcher(
                            duration: 250.durationInMilliseconds,
                            child: Icon(
                              book.isFav ? Icons.favorite : Icons.favorite_border,
                              color: ThemeColors.themeBlue,
                              key: ValueKey<bool>(book.isFav),
                            ),
                          ),
                        );
                      },
                    ),
              noCart ?? false
                  ? 0.gap
                  : GetBuilder<NavbarController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: controller.isGuest
                              ? () {
                                  controller.saveAction = () async {
                                    BookModel bookFromList = controller.booksList.firstWhere((element) => element.id == book.id);
                                    bool isCart = bookFromList.isCart;
                                    bookFromList.isCart = !bookFromList.isCart;
                                    controller.update();
                                    dynamic updateCartListResponse = await FirebaseServices().updateUserCartList(book.id);
                                    if (updateCartListResponse is String) {
                                      updateCartListResponse.showToast;
                                      bookFromList.isCart = isCart;
                                      controller.update();
                                    }
                                  };
                                  controller.update();
                                  customSnackbar();
                                }
                              : () async {
                                  BookModel bookFromList = controller.booksList.firstWhere((element) => element.id == book.id);
                                  bool isCart = bookFromList.isCart;
                                  bookFromList.isCart = !bookFromList.isCart;
                                  controller.update();
                                  dynamic updateCartListResponse = await FirebaseServices().updateUserCartList(book.id);
                                  if (updateCartListResponse is String) {
                                    updateCartListResponse.showToast;
                                    bookFromList.isCart = isCart;
                                    controller.update();
                                  }
                                },
                          child: AnimatedSwitcher(
                            duration: 250.durationInMilliseconds,
                            child: Icon(
                              book.isCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                              color: ThemeColors.themeBlue,
                              key: ValueKey<bool>(book.isCart),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
