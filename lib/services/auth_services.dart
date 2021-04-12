part of 'services.dart';

class AuthServices {

  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;

  static Future<String> signUp(Users users) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String msg = "";
    String token = "";
    String uid = "";

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: users.email, password: users.password);
    uid = userCredential.user.uid;
    token = await userCredential.user.getIdToken();

    return msg;

  }

}