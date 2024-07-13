import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/models/book_model.dart';
import 'package:snap_buy/models/user_model.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// To upload new user to users collection.
  Future<dynamic> uploadUser(UserModel user) async {
    try {
      await _firestore.collection(Strings.usersCollection).doc(user.email).set(user.toJson());
      return user;
    } catch (error) {
      return error.toString();
    }
  }

  /// To fetch the current user date.
  Future<dynamic> fetchCurrentUser() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc = await _firestore.collection(Strings.usersCollection).doc(currentUser.email).get();
        if (userDoc.exists) {
          UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
          return user;
        } else {
          return Strings.unknownErrorText;
        }
      } catch (error) {
        return error.toString();
      }
    } else {
      UserModel user = UserModel(
        Strings.guestText,
        fav: [],
        cart: [],
        email: Strings.guestText,
      );
      return user;
    }
  }

  /// To fetch all books.
  Future<dynamic> fetchBooks() async {
    CollectionReference analysisLabPreparationsNecessaryForTheTestsCollection = _firestore.collection(Strings.booksCollection);
    QuerySnapshot querySnapshot = await analysisLabPreparationsNecessaryForTheTestsCollection.get();
    if (querySnapshot.docs.isEmpty) {
      return Strings.noBooksFoundText;
    } else {
      return querySnapshot.docs.map((document) => BookModel.fromJson(document.data() as Map<String, dynamic>, document.id)).toList();
    }
  }

  /// To update the user fav list.
  Future<dynamic> updateUserFavList(String id) async {
    User? currentUser = _firebaseAuth.currentUser;
    try {
      DocumentReference userRef = _firestore.collection(Strings.usersCollection).doc(currentUser!.email);
      DocumentSnapshot userDoc = await userRef.get();
      if (userDoc.exists) {
        UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        if (user.fav.contains(id)) {
          user.fav.remove(id);
        } else {
          user.fav.add(id);
        }
        await userRef.update(user.toJson());
        return true;
      } else {
        return Strings.unknownErrorText;
      }
    } catch (error) {
      return error.toString();
    }
  }

  /// To update the user cart list.
  Future<dynamic> updateUserCartList(String id) async {
    User? currentUser = _firebaseAuth.currentUser;
    try {
      DocumentReference userRef = _firestore.collection(Strings.usersCollection).doc(currentUser!.email);
      DocumentSnapshot userDoc = await userRef.get();
      if (userDoc.exists) {
        UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        if (user.cart.contains(id)) {
          user.cart.remove(id);
        } else {
          user.cart.add(id);
        }
        await userRef.update(user.toJson());
        return true;
      } else {
        return Strings.unknownErrorText;
      }
    } catch (error) {
      return error.toString();
    }
  }
}
