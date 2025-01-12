
class FirebaseAuthentication {

  FirbaseAuth _firebaseAuth = FirbaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCardential = await  _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCardential.user;
    }
    on FirebaseAuthException  catch(e) {
      showToast(message: 'Error while creating user! maybe email already used');
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCardential = await  _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCardential.user;
    }
    on FirebaseAuthException  catch(e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password');
      }
      else {
        showToast(message: '${e.code}');
      }
    }

  }

}