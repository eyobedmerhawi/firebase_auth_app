import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Listen for sign-in and sign-out changes.
  late final Stream<User?> authStateChanges = _auth.authStateChanges();

  // Get the currently signed-in user.
  User? get currentUser => _auth.currentUser;

  // Register a new account.
  Future<UserCredential> register(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  // Sign in with an existing account.
  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  // Sign out.
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Update the current user's password.
  Future<void> changePassword(String newPassword) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw StateError('No user is currently signed in.');
    }

    await user.updatePassword(newPassword);
  }

  // Reauthenticate if Firebase requires a recent login.
  Future<void> reauthenticate(String currentPassword) async {
    final user = _auth.currentUser;

    if (user == null || user.email == null) {
      throw StateError('No email account is signed in.');
    }

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);
  }
}
