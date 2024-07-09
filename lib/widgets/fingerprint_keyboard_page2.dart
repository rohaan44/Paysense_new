import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:paysense/widgets/confirmation_modal_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FingerForRequest extends StatefulWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onPress;
  const FingerForRequest(
      {Key? key, required this.onKeyPressed, required this.onPress})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FingerForRequestState createState() => _FingerForRequestState();
}

class _FingerForRequestState extends State<FingerForRequest> {
  late final LocalAuthentication auth;
  bool _supportState = false;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(['1', '2', '3']),
        buildRow(['4', '5', '6']),
        buildRow(['7', '8', '9']),
        buildRow(['fingerprint', '0', '⌫'], special: true),
      ],
    );
  }

  Widget buildRow(List<String> keys, {bool special = false}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: keys.map((key) {
        if (special && key == 'fingerprint') {
          return Expanded(
            child: TextButton(
              onPressed: () {
                _authenticateAndNavigate(context);
              },
              child: Icon(
                Icons.fingerprint,
                size: 25.sp,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          );
        } else {
          return Expanded(
            child: TextButton(
              onPressed: () => widget.onKeyPressed(key),
              child: Text(key,
                  style: GoogleFonts.poppins(
                      fontSize: 25.sp,
                      color: isDarkMode ? Colors.white : Colors.black87,
                      height: 2.1,
                      fontWeight: FontWeight.w500)),
            ),
          );
        }
      }).toList(),
    );
  }

  Future<void> _authenticateAndNavigate(BuildContext context) async {
    try {
      bool authenticated = await _authenticate();

      if (authenticated) {
        Future.delayed(const Duration(milliseconds: 300), () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            )),
            builder: (BuildContext context) {
              return const BottomModal();
            },
          );
        });
        Get.toNamed("/DashBoardView");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication failed'),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<bool> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      return authenticated;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (kDebugMode) {
      print("List of availableBiometrics: $availableBiometrics");
    }
    if (!mounted) {
      return;
    }
  }
}
