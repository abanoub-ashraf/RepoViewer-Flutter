import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SplashPage extends StatelessWidget {
    const SplashPage({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 48
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        ///
                        /// MdiIcons comes from material design icons flutter package
                        ///
                        Icon(
                            MdiIcons.github, 
                            size: 150
                        ),
                        SizedBox(height: 16),
                        LinearProgressIndicator(),
                    ],
                ),
            ),
        );
    }
}