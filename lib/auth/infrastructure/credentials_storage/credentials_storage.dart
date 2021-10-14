import 'package:oauth2/oauth2.dart';

///
/// - this is an interface cause we gonna have two different implementations 
///   for the methods inside of it
/// 
/// - one for the mobile devices and another one for the web
///
abstract class CredentialsStorage {
    Future<Credentials?> read();
    Future<void> save(Credentials credentials);
    Future<void> clear();
}