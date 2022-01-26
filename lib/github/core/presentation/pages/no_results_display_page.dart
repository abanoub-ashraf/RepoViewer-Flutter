import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoResultsDisplayPage extends StatelessWidget {
    final String message;

    const NoResultsDisplayPage({
        Key? key, 
        required this.message
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    const Icon(MdiIcons.emoticonPoop, size: 100),
                    Text(
                        message,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                    ),
                ]
            )
        );
    }
}