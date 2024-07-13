import 'package:snap_buy/constants/strings.dart';

class BookModel {
  double rate;
  int price, pages;
  bool isCart, isFav;
  String id, title, image, author, country, language, description, publicationYear;

  BookModel(
    this.id, {
    required this.rate,
    required this.title,
    required this.isFav,
    required this.price,
    required this.pages,
    required this.image,
    required this.isCart,
    required this.author,
    required this.country,
    required this.language,
    required this.description,
    required this.publicationYear,
  });

  factory BookModel.fromJson(Map<String, dynamic> json, String id) {
    return BookModel(
      id,
      isFav: false,
      isCart: false,
      rate: json[Strings.rateField],
      title: json[Strings.titleField],
      price: json[Strings.priceField],
      pages: json[Strings.pagesField],
      image: json[Strings.imageField],
      author: json[Strings.authorField],
      country: json[Strings.countryField],
      language: json[Strings.languageField],
      description: json[Strings.descriptionField],
      publicationYear: json[Strings.publicationYearField],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Strings.rateField: rate,
      Strings.titleField: title,
      Strings.priceField: price,
      Strings.pagesField: pages,
      Strings.imageField: image,
      Strings.authorField: author,
      Strings.countryField: country,
      Strings.languageField: language,
      Strings.descriptionField: description,
      Strings.publicationYearField: publicationYear,
    };
  }
}
