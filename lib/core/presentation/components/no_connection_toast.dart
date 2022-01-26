import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

///
/// show a toast on the screen
///
Future<void> showNoConnectionToast(String message, BuildContext context) async {
    await showFlash(
        context: context, 
        ///
        /// make the toast automatically disappear after seconds
        ///
        duration: const Duration(seconds: 4),
        builder: (context, controller) {
            return Flash.dialog(
                controller: controller, 
                backgroundColor: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        message,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                        )
                    ),
                )
            );
        }
    );
}