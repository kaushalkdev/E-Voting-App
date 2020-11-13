import 'package:e_voting_app/source/index.dart';

class BiometricProvider extends ChangeNotifier {
  final LocalAuthentication _auth = LocalAuthentication();
  bool canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  Future<void> checkBiometrics() async {
    bool checkBiometrics;
    try {
      checkBiometrics = await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    canCheckBiometrics = checkBiometrics;
    notifyListeners();
  }

  Future<void> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    _availableBiometrics = availableBiometrics;
    notifyListeners();
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      notifyListeners();

      authenticated = await _auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);

      isAuthenticating = false;
      authorized = 'Authenticating';
      notifyListeners();
    } on PlatformException catch (e) {
      print(e);
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    authorized = message;
    notifyListeners();
  }

  void cancelAuthentication() {
    _auth.stopAuthentication();
  }
}
