import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

///
/// this [presentation layer] will use the functions of the [application layer]
///
class SignInPage extends StatelessWidget {
    const SignInPage({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Center(
                    child: Padding(
                        ///
                        /// wrap the column inside a padding to not make the button inside
                        /// the column stretch all the width and to be able to give it padding
                        ///
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                        ),
                        child: SingleChildScrollView(
                            ///
                            /// wrap the column inside a single child scroll view to make the column
                            /// scrollable in case the app is running on a small screen
                            ///
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                ///
                                /// this makes the widget inside of the column stretch all the way
                                /// from left to right taking the full width
                                ///
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    const Icon(
                                        MdiIcons.github, 
                                        size: 150,
                                    ),
                                    const SizedBox(
                                        height: 16,
                                    ),
                                    Text(
                                        'Welcome to\n Repo Viewer',
                                        style: Theme.of(context).textTheme.headline3,
                                        textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                        height: 20,
                                    ),
                                    ElevatedButton(
                                        child: const Text ('Sign In'),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.green),
                                        ),
                                        onPressed: () {
                                            /// TODO: display a web view
                                        },
                                    )
                                ],
                            ),
                        ),
                    ),
                ),
            )
        );
    }
}