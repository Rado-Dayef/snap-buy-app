import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/models/book_model.dart';
import 'package:snap_buy/views/widgets/book_widget.dart';
import 'package:snap_buy/views/widgets/guest_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (navbarController) {
        return navbarController.isGuest
            ? Center(
                child: SingleChildScrollView(
                  padding: 10.edgeInsetsAll,
                  physics: const BouncingScrollPhysics(),
                  child: const GuestWidget(),
                ),
              )
            : GetBuilder<NavbarController>(
                builder: (_) {
                  List<BookModel> cartBooksList = navbarController.booksList.where((element) => element.isCart == true).toList();
                  return cartBooksList.isEmpty
                      ? const Center(
                          child: Text(
                            Strings.noBooksAtYourCartYetText,
                            style: ThemeFonts.textStyleBlue20TimesBold,
                          ),
                        )
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                padding: 10.edgeInsetsAll,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cartBooksList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  BookModel book = cartBooksList[index];
                                  return BookWidget(
                                    book,
                                    noFav: true,
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return 10.gap;
                                },
                              ),
                              10.gap,
                              GetBuilder<NavbarController>(
                                builder: (context) {
                                  int totalAmount = 0;
                                  List<int> booksPrice = navbarController.booksList.where((element) => element.isCart == true).map((element) => element.price).toList();
                                  for (int index = 0; index < booksPrice.length; index++) {
                                    totalAmount = totalAmount + booksPrice[index];
                                  }
                                  return Text(
                                    Strings.totalAmountText + Strings.colonSign + Strings.spaceSign + totalAmount.toString() + Strings.dollarSign,
                                    style: ThemeFonts.textStyleBlue20TimesBold,
                                  );
                                },
                              ),
                              10.gap,
                              InkWell(
                                onTap: () => Strings.opsThisFeaturesIsNotAvailableYetText.showToast,
                                child: Container(
                                  width: 200,
                                  padding: 15.edgeInsetsVertical,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ThemeColors.themeBlue,
                                    borderRadius: 15.borderRadiusAll,
                                  ),
                                  child: const Text(
                                    Strings.buyText,
                                    style: ThemeFonts.textStyleWhite16TimesBold,
                                  ),
                                ),
                              ),
                              10.gap,
                            ],
                          ),
                        );
                },
              );
      },
    );
  }
}
