import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/shared/providers.dart';
import '../infrastructure/datasource/local_service/sembast_database.dart';

///
/// - this provider is for initializing the sembast local database to use its init method
/// 
/// - it's gonna be used from within the initialization provider above
///
final sembastDBProvider = Provider(
    (ref) => SembastDatabase()
);

///
/// this is a dio instance for all the feature of the app except the auth feature
/// it has its own dio instance
///
final dioProvider = Provider(
    (ref) => Dio()
);

///
/// - this provider will be used from within the root widget of the app
///
/// - A provider that asynchronously creates a single value.
///
/// - FutureProvider can be considered as a combination of Provider and FutureBuilder.
///   By using FutureProvider, the UI will be able to read the state of the future synchronously,
///   handle the loading/error states, and rebuild when the future completes.
/// 
/// - this provider will run just once to check and set the state of the auth notifier provider
/// 
/// - this provider is also like for solving the dependency injection problem
///
final initializationProvider = FutureProvider<Unit>(
    (ref) async {
        ///
        /// use this provider in her to initialize the local database
        ///
        await ref.read(sembastDBProvider).init();

        ///
        /// - use the dio provider instance we created in the core folder
        ///   cause it's gonna be used for all the features in the app except the auth one
        /// 
        /// - add the oauth2interceptor we created inside the auth feature's infrastructure
        ///   to the interceptors of this dio instance cause we wanna use that auth interceptor
        ///   in all the web requests we make through the app
        ///
        ref.read(dioProvider)..options = BaseOptions(
            ///
            /// include this header in all the web requests we make in the app
            ///
            headers: {
                'Accept': 'application/vnd.github.v3.html+json'
            }
        )..interceptors.add(
            ///
            /// - this interceptor adds the access token to the header of all the web requests
            /// 
            /// - handles the case when we make a request and get 401 unauthorized status code
            ///
            ref.read(oAuth2InterceptorProvider)
        );

        ///
        /// - this initialization provider will be used for checking if the user signed in or not
        ///   and we want this provider to only run once that's why we used read() instead of watch()
        /// 
        /// - if we used watch() instead of read() and if the provider changes then this 
        ///   initialization provider will run again
        /// 
        /// - read() will not cause a provider's state to be recreated when the provider obtained changes
        /// 
        /// - watch() obtains the state of a provider and cause the state to be re-evaluated when 
        ///   that provider emits a new value
        ///
        /// - .notifier to read the actual notifier of the provider not the state
        ///
        final authNotifier = ref.read(authNotifierProvider.notifier);

        ///
        /// checkAndUpdateAuthStatus() needs to run once to set the state
        /// inside the auth notifier to authenticated or not, that's why we need this
        /// initialization provider to run once without doing anything with its value
        /// and that happens inside the root provider listener inside the build method
        ///
        await authNotifier.checkAndUpdateAuthStatus();

        return unit;
    }
);