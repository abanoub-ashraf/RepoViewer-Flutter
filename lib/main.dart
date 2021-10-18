import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/presentation/app_widget.dart';

void main() => runApp(
    ///
    /// the top level widget in the app must be wrapped in the provider scope widget
    ///
    ProviderScope(
        child: AppWidget()
    )
);