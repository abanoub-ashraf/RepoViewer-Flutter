import 'package:auto_route/auto_route.dart';
import 'package:repo_viewer/auth/presentation/sign_in_page.dart';
import 'package:repo_viewer/splash/presentation/splash_page_.dart';
import 'package:repo_viewer/starred_repos/presentation/starred_repos_page.dart';

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
        MaterialRoute(
            page: SplashPage, 
            initial: true
        ),
        MaterialRoute(
            page: SignInPage, 
            path: '/sign-in'
        ),
        MaterialRoute(
            page: StarredReposPage, 
            path: 'starred'
        ),
    ], 
    replaceInRouteName: 'Page,Route'
)
class $AppRouter {}