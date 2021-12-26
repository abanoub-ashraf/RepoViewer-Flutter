import 'package:print_color/print_color.dart';

void printAccessToken(String token) {
    Print.green('================================');
    Print.green('the device access token: $token');
    Print.green('================================');
}

void printTokenIsNotRevoked() {
    Print.red('===============================================');
    Print.red('Token is not Revoked!');
    Print.red('===============================================');
}