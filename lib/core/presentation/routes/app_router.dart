import 'package:auto_route/auto_route.dart';

import '../../../auth/presentation/authorization_page.dart';
import '../../../auth/presentation/sign_in_page.dart';
import '../../../github/repos/starred_repos/presentation/starred_repos_page.dart';
import '../../../splash/presentation/splash_page.dart';

///
/// - this comes from the auto route package
/// 
/// - you define the routes like this MaterialRoute(page: , path: , initial: )
///     - page is the widget you wanna load on the screen
///     - path is the route that define that page
///     - initial is only for the starter route of the app
/// 
/// - replaceInRouteName: '' if you wanna replace the word Page in the generated routes 
///   with Routes for better naming
/// 
/// - after defining this app route class in this way, the routes will be auto generated
///   using the build runner command
/// 
/// - to use that route in the main widget of the app go to the AppWidget for more info
///
@MaterialAutoRouter(
    routes: [
        ///
        /// this is the starter page of the app
        ///
        MaterialRoute(
            page: SplashPage, 
            initial: true
        ),
        ///
        /// the path we define in each route here overrides the generated ones
        ///
        MaterialRoute(
            page: SignInPage, 
            path: '/sign-in'
        ),
        MaterialRoute(
            page: AuthorizationPage, 
            path: '/auth'
        ),
        MaterialRoute(
            page: StarredReposPage, 
            path: '/starred'
        ),
    ], 
    ///
    /// replace the 'page' with 'route' in the names of the generated routes
    ///
    replaceInRouteName: 'Page,Route'
)
///
/// - the auto route generator package is the opposite of freezed package:
///   the class we define has a dollar sign in the name and the generated one
///   doesn't have unlike the freezed package
/// 
/// - we don't need to define part statement like freezed cause the generated file
///   doesn't need to be part of this file we defined 
/// 
/// to use auto route generator package:
///     1- it needs the auto route generator dev package
///     2- we declare the name of this file with a dollar sign
///     3- annotate the class with MaterialAutoRouter()
///     4- inside the () put all the routes of the app
///     5- run the build runner command to generate the code
///
class $AppRouter {}