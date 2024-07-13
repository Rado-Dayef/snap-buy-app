class Strings {
  /// About App.
  static const String appTitle = "Snap Buy";
  static const String appSubTitle = "Shop Smart, Shop Fast";
  static const String appLogoDarkOutlined = "assets/images/appLogoDarkOutlined.png";
  static const String appLogoLightOutlined = "assets/images/appLogoLightOutlined.png";

  /// Route.
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String navbarRoute = "/navbar";
  static const String signUpRoute = "/signUp";
  static const String splashRoute = "/splash";
  static const String bookDetailsRoute = "/bookDetails";
  static const String resetPasswordRoute = "/resetPassword";

  /// Firebase Collection, Document, and Field name.
  static const String favField = "fav";
  static const String rateField = "rate";
  static const String nameField = "name";
  static const String cartField = "cart";
  static const String titleField = "title";
  static const String emailField = "email";
  static const String priceField = "price";
  static const String imageField = "image";
  static const String pagesField = "pages";
  static const String authorField = "author";
  static const String countryField = "country";
  static const String booksCollection = "books";
  static const String usersCollection = "users";
  static const String languageField = "language";
  static const String descriptionField = "description";
  static const String publicationYearField = "publicationYear";

  /// Local storage Field name.
  static const String isGuestField = "isGuest";

  /// Assets.
  static const String idDarkIcon = "assets/images/idDarkIcon.png";
  static const String idLightIcon = "assets/images/idLightIcon.png";
  static const String homeDarkIcon = "assets/images/homeDarkIcon.png";
  static const String cartDarkIcon = "assets/images/cartDarkIcon.png";
  static const String homeLightIcon = "assets/images/homeLightIcon.png";
  static const String cartLightIcon = "assets/images/cartLightIcon.png";
  static const String profileDarkIcon = "assets/images/profileDarkIcon.png";
  static const String profileLightIcon = "assets/images/profileLightIcon.png";
  static const String favoriteDarkIcon = "assets/images/favoriteDarkIcon.png";
  static const String favoriteLightIcon = "assets/images/favoriteLightIcon.png";

  /// Sign.
  static const String atSign = "@";
  static const String orSign = "|";
  static const String andSign = "&";
  static const String emptySign = "";
  static const String plusSign = "+";
  static const String bangSign = "!";
  static const String hashSign = "#";
  static const String doteSign = "•";
  static const String commaSign = ",";
  static const String caretSign = "^";
  static const String colonSign = ":";
  static const String spaceSign = " ";
  static const String scoreSign = "-";
  static const String dollarSign = "\$";
  static const String plusTwoSign = "+2";
  static const String asteriskSign = "*";
  static const String questionSign = "?";
  static const String newLineSign = "\n";
  static const String backSlashSign = "/";
  static const String emoticonSign = ":-";
  static const String emptyHourSign = "0";
  static const String percentageSign = "%";
  static const String underscoreSign = "_";
  static const String twoSpacesSign = "  ";
  static const String commaSpaceSign = ", ";
  static const String ellipsisSign = ".....";
  static const String closingCurlyBraceSign = "}";
  static const String openingCurlyBraceSign = "{";
  static const String closingParenthesisSign = ")";
  static const String openingParenthesisSign = "(";
  static const String closingSquareBracketSign = "]";
  static const String openingSquareBracketSign = "[";

  /// Tag.
  static const String iconTag = "icon";
  static const String logoTag = "logo";
  static const String emailTag = "email";
  static const String titleTag = "title";
  static const String buttonTag = "button";
  static const String subTitleTag = "subTitle";
  static const String passwordTag = "password";
  static const String bookImageTag = "bookImage";
  static const String textButtonTag = "textButton";
  static const String guestButtonTag = "guestButton";

  /// Validation.
  static const String isRequiredValidation = "is required";
  static const String invalidEmailValidation = "Invalid email";
  static const String lessThen4Validation = "Can't be less then 4 characters";
  static const String lessThen8Validation = "Can't be less then 8 characters";
  static const String emailDoesNotContainAtValidation = "Email doesn't contain @";
  static const String largerThen24Validation = "Can't be larger then 24 characters";

  /// Font.
  static const String eloraFont = "Elora";
  static const String timesFont = "Times";

  /// Error Code.
  static const String invalidEmailErrorCode = "invalid-email";
  static const String userNotFoundErrorCode = "user-not-found";
  static const String wrongPasswordErrorCode = "wrong-password";
  static const String invalidCredentialErrorCode = "invalid-credential";
  static const String emailAlreadyInUseErrorCode = "email-already-in-use";
  static const String networkRequestFailedErrorCode = "network-request-failed";

  /// Text.
  static const String buyText = "Buy";
  static const String nameText = "Name";
  static const String homeText = "Home";
  static const String cartText = "Cart";
  static const String priceText = "price";
  static const String guestText = "Guest";
  static const String emailText = "Email";
  static const String loginText = "Login";
  static const String logoutText = "logout";
  static const String searchText = "Search";
  static const String authorText = "Author";
  static const String signUpText = "Sign Up";
  static const String countryText = "Country";
  static const String profileText = "Profile";
  static const String languageText = "Language";
  static const String passwordText = "Password";
  static const String favoriteText = "Favorite";
  static const String goAsGuestText = "Go as Guest";
  static const String signedOutText = "Signed out.";
  static const String totalAmountText = "Total Amount";
  static const String unknownErrorText = "Unknown error.";
  static const String resetPasswordText = "Reset Password";
  static const String noBooksFoundText = "No books found.";
  static const String emailAlreadyInUseText = "Email already in use.";
  static const String doNotHaveAnAccountText = "Don't have an account";
  static const String alreadyHaveAnAccount = "Already have an account";
  static const String noFavoriteBooksYetText = "No favorite books yet!";
  static const String rememberedMyPasswordText = "Remembered my password";
  static const String guestMessage = "Only available for registered users";
  static const String authenticationRequiredText = "Authentication Required";
  static const String noBooksAtYourCartYetText = "No books at your cart yet!";
  static const String pleaseVerifyYourEmailFirstText = "Please verify your email first.";
  static const String opsThisFeaturesIsNotAvailableYetText = "Ops, This features is not available yet.";
  static const String wrongPasswordProvidedForThatUserText = "Wrong password provided for that user.";
  static const String pleaseCheckYourInternetConnectionText = "Please check your internet connection.";
  static const String guestSnackbarSubMessage = "Sign in or create an account to explore that feature!";
  static const String userNotFoundPleaseCheckYourEmailAddressText = "User not found. Please check your email address.";
  static const String passwordResetEmailSentPleaseCheckYourInboxText = "Password reset email sent. Please check your inbox.";
  static const String guestSubMessage = "Sign in or create an account to explore more features, save your favorite items, and stay connected!";
  static const String pleaseMakeSureThatYouHaveSignedUpWithThatEmailAndPasswordText = "Please make sure that you have signed up with that email, and password.";
}
