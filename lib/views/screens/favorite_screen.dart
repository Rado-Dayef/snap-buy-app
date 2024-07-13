import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/models/book_model.dart';
import 'package:snap_buy/views/widgets/book_widget.dart';
import 'package:snap_buy/views/widgets/guest_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                  List<BookModel> favoriteBooksList = navbarController.booksList.where((element) => element.isFav == true).toList();
                  return favoriteBooksList.isEmpty
                      ? const Center(
                          child: Text(
                            Strings.noFavoriteBooksYetText,
                            style: ThemeFonts.textStyleBlue20TimesBold,
                          ),
                        )
                      : ListView.separated(
                          padding: 10.edgeInsetsAll,
                          physics: const BouncingScrollPhysics(),
                          itemCount: favoriteBooksList.length,
                          itemBuilder: (BuildContext context, int index) {
                            BookModel book = favoriteBooksList[index];
                            return BookWidget(
                              book,
                              noCart: true,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 10.gap;
                          },
                        );
                },
              );
      },
    );
  }
}
