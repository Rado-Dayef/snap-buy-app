import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/models/book_model.dart';
import 'package:snap_buy/views/widgets/book_widget.dart';
import 'package:snap_buy/views/widgets/loading_widget.dart';
import 'package:snap_buy/views/widgets/text_form_field_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavbarController navbarController = Get.find<NavbarController>();
    return SingleChildScrollView(
      padding: 10.edgeInsetsAll,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          TextFormFieldWidget(
            textController: navbarController.textEditingController,
            placeholder: Strings.searchText,
            prefixIcon: const Icon(
              Icons.search,
              color: ThemeColors.themeBlue,
            ),
            onChanged: (String? newValue) {
              navbarController.update();
            },
          ),
          10.gap,
          GetBuilder<NavbarController>(
            builder: (_) {
              if (navbarController.booksList.isEmpty && !navbarController.isNoBooks) {
                return const LoadingWidget();
              } else if (navbarController.booksList.isEmpty && navbarController.isNoBooks) {
                return const Center(
                  child: Text(
                    Strings.noBooksFoundText,
                    style: ThemeFonts.textStyleBlue20TimesNormal,
                  ),
                );
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: navbarController.booksList.where((element) => element.title.toLowerCase().contains(navbarController.textEditingController.text.toLowerCase())).toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    List<BookModel> filteredBooksList = navbarController.booksList.where((element) => element.title.toLowerCase().contains(navbarController.textEditingController.text.toLowerCase())).toList();
                    BookModel book = filteredBooksList[index];
                    return BookWidget(book);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.gap;
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
