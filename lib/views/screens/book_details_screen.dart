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

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavbarController navbarController = Get.find<NavbarController>();
    BookModel book = Get.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.themeBlue,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: ThemeColors.themeWhite,
            borderRadius: 15.borderRadiusTop,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: 13.borderRadiusAll,
                    child: HeroWidget(
                      tag: book.image + book.id,
                      child: CachedNetworkImage(
                        height: 600,
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
                ),
                Padding(
                  padding: 10.edgeInsetsAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      10.gap,
                      HeroWidget(
                        tag: book.title + book.id,
                        child: Text(
                          book.title + Strings.spaceSign + Strings.openingParenthesisSign + book.price.toString() + Strings.dollarSign + Strings.closingParenthesisSign,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: ThemeFonts.textStyleBlue24TimesBold,
                        ),
                      ),
                      10.gap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_border,
                                color: ThemeColors.themeBlue,
                              ),
                              5.gap,
                              Text(
                                book.rate.toString(),
                                style: ThemeFonts.textStyleBlue20TimesNormal,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.library_books_outlined,
                                color: ThemeColors.themeBlue,
                              ),
                              5.gap,
                              Text(
                                book.pages.toString(),
                                style: ThemeFonts.textStyleBlue20TimesNormal,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range_outlined,
                                color: ThemeColors.themeBlue,
                              ),
                              5.gap,
                              Text(
                                book.publicationYear,
                                style: ThemeFonts.textStyleBlue20TimesNormal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.gap,
                      Text(
                        book.description,
                        textAlign: TextAlign.justify,
                        style: ThemeFonts.textStyleBlue20TimesNormal,
                      ),
                      const Divider(
                        color: ThemeColors.themeBlue,
                        height: 25,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Text(
                        Strings.authorText + Strings.colonSign + Strings.spaceSign + book.author,
                        textAlign: TextAlign.justify,
                        style: ThemeFonts.textStyleBlue20TimesNormal,
                      ),
                      Text(
                        Strings.countryText + Strings.colonSign + Strings.spaceSign + book.country,
                        textAlign: TextAlign.justify,
                        style: ThemeFonts.textStyleBlue20TimesNormal,
                      ),
                      Text(
                        Strings.languageText + Strings.colonSign + Strings.spaceSign + book.language,
                        textAlign: TextAlign.justify,
                        style: ThemeFonts.textStyleBlue20TimesNormal,
                      ),
                      10.gap,
                      Padding(
                        padding: 15.edgeInsetsAll,
                        child: Row(
                          children: [
                            Expanded(
                              child: GetBuilder<NavbarController>(
                                builder: (_) {
                                  return InkWell(
                                    onTap: navbarController.isGuest
                                        ? () {
                                            navbarController.saveAction = () async {
                                              BookModel bookFromList = navbarController.booksList.firstWhere((element) => element.id == book.id);
                                              bookFromList.isFav = !bookFromList.isFav;
                                              navbarController.update();
                                              dynamic updateFavListResponse = await FirebaseServices().updateUserFavList(book.id);
                                              if (updateFavListResponse is String) {
                                                updateFavListResponse.showToast;
                                                bookFromList.isFav = bookFromList.isFav;
                                                navbarController.update();
                                              }
                                            };
                                            navbarController.update();
                                            customSnackbar();
                                          }
                                        : () async {
                                            BookModel bookFromList = navbarController.booksList.firstWhere((element) => element.id == book.id);
                                            bookFromList.isFav = !bookFromList.isFav;
                                            navbarController.update();
                                            dynamic updateFavListResponse = await FirebaseServices().updateUserFavList(book.id);
                                            if (updateFavListResponse is String) {
                                              updateFavListResponse.showToast;
                                              bookFromList.isFav = bookFromList.isFav;
                                              navbarController.update();
                                            }
                                          },
                                    child: Container(
                                      padding: 10.edgeInsetsAll,
                                      decoration: BoxDecoration(
                                        color: ThemeColors.themeBlue,
                                        borderRadius: 10.borderRadiusAll,
                                      ),
                                      child: AnimatedSwitcher(
                                        duration: 250.durationInMilliseconds,
                                        child: Icon(
                                          book.isFav ? Icons.favorite : Icons.favorite_border,
                                          color: ThemeColors.themeWhite,
                                          key: ValueKey<bool>(book.isFav),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            25.gap,
                            Expanded(
                              child: GetBuilder<NavbarController>(
                                builder: (_) {
                                  return InkWell(
                                    onTap: navbarController.isGuest
                                        ? () {
                                            navbarController.saveAction = () async {
                                              BookModel bookFromList = navbarController.booksList.firstWhere((element) => element.id == book.id);
                                              bookFromList.isCart = !bookFromList.isCart;
                                              navbarController.update();
                                              dynamic updateFavListResponse = await FirebaseServices().updateUserCartList(book.id);
                                              if (updateFavListResponse is String) {
                                                updateFavListResponse.showToast;
                                                bookFromList.isCart = bookFromList.isCart;
                                                navbarController.update();
                                              }
                                            };
                                            navbarController.update();
                                            customSnackbar();
                                          }
                                        : () async {
                                            BookModel bookFromList = navbarController.booksList.firstWhere((element) => element.id == book.id);
                                            bookFromList.isCart = !bookFromList.isCart;
                                            navbarController.update();
                                            dynamic updateFavListResponse = await FirebaseServices().updateUserCartList(book.id);
                                            if (updateFavListResponse is String) {
                                              updateFavListResponse.showToast;
                                              bookFromList.isCart = bookFromList.isCart;
                                              navbarController.update();
                                            }
                                          },
                                    child: Container(
                                      padding: 10.edgeInsetsAll,
                                      decoration: BoxDecoration(
                                        color: ThemeColors.themeBlue,
                                        borderRadius: 10.borderRadiusAll,
                                      ),
                                      child: AnimatedSwitcher(
                                        duration: 250.durationInMilliseconds,
                                        child: Icon(
                                          book.isCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                                          color: ThemeColors.themeWhite,
                                          key: ValueKey<bool>(book.isCart),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
