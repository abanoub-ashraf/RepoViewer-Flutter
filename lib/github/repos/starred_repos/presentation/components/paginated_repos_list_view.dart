import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/presentation/components/no_connection_toast.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../core/presentation/pages/no_results_display_page.dart';
import '../../../../core/shared/providers.dart';
import '../../application/starred_repos_state.dart';
import 'failure_repo_tile.dart';
import 'loading_repo_tile.dart';
import 'success_repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
    const PaginatedReposListView({ Key? key }) : super(key: key);

    @override
    State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
    ///
    /// - this variable is for loading the next page when the scroll position 
    ///   of the list view is close to the bottom of the screen
    /// 
    /// - we need the value of this variable so this whole widget is stateful
    ///
    bool canLoadNextPage = false;

    ///
    /// this variable is for showing a no connection toast to the user only once 
    /// when they are offline
    ///
    bool alreadyShownAnOfflineToast = false;

    @override
    Widget build(BuildContext context) {
        ///
        ///  - ConsumerWidget is a base-class for widgets that wants to listen to providers.
        /// 
        /// - we wanna listen to the starred repos notifier provider
        /// 
        /// - consumer allows us to get a value inside a provider and use that value
        ///   in the widget that need it
        ///
        return Consumer(
            builder: (context, watch, child) {
                ///
                /// - ref(starredReposNotifierProvider) to read the state of 
                ///   this notifier provider
                /// 
                /// - this state will has a value cause we called the getStarredReposPage()
                ///   of the notifier provider in the starred_repos_page file
                ///
                final state = watch(starredReposNotifierProvider);

                ///
                /// .builder() constructor is good for lists with huge amount of data
                ///
                return ProviderListener<StarredReposState>(
                    ///
                    /// we will use the bool variable to change its value
                    /// based on the state changing
                    ///
                    onChange: (context, state) {
                        ///
                        /// we wanna do something when the state change inside this block
                        /// and all we wanna do is change the bool value
                        ///
                        state.map(
                            initial: (initialState) => canLoadNextPage = true, 
                            loadInProgress: (loadingState) => canLoadNextPage = false, 
                            loadSuccess: (successState) {
                                ///
                                /// if the data we got is not fresh, and this flag is not true yet
                                ///
                                if (!successState.starredRepos.isFresh && !alreadyShownAnOfflineToast) {
                                    ///
                                    /// show the toast only once and never again when the user scroll
                                    /// to new pages,  he knew he already offline, there's no need
                                    /// to remind him every time he scroll to a new page
                                    ///
                                    alreadyShownAnOfflineToast = true;

                                    ///
                                    /// if the isFresh property of the repos we get from 
                                    /// the success state is not true then the data we got is 
                                    /// cached and the user is offline
                                    ///
                                    showNoConnectionToast(
                                        AppStrings.noConnectionString, 
                                        context,
                                    );
                                }

                                canLoadNextPage = successState.isNextPageAvailable;
                            }, 
                            loadFailure: (failureState) => canLoadNextPage = false
                        );
                    }, 
                    provider: starredReposNotifierProvider, 
                    ///
                    /// listen to the scrolling notification and do something upon it
                    /// which is loading the next page when the scrolling point 
                    /// is close to the bottom of the screen
                    ///
                    child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                            ///
                            /// includes the scrollable content and descriptions
                            ///
                            final metrics = notification.metrics;
                            
                            ///
                            /// this is the height of the whole list view including the hidden part
                            ///
                            final fullListViewHeight = metrics.maxScrollExtent;
                            
                            ///
                            /// this is only the visible height of the list view which is the screen height
                            ///
                            final visibleListViewHeight = metrics.viewportDimension;
                            
                            ///
                            /// this gives us the scrolling point at ( a bit less before the bottom)
                            /// 
                            final limit = fullListViewHeight - visibleListViewHeight / 3;
                            
                            ///
                            /// the height from the current bottom we currently at, to the ver top 
                            ///
                            final fromCurrentBottomToTopHeight = metrics.pixels;

                            ///
                            /// once we pass the limit we wanna get the next page
                            ///
                            if (canLoadNextPage && fromCurrentBottomToTopHeight >= limit) {
                                ///
                                /// set this to false to not load the next page twice
                                ///
                                canLoadNextPage = false;

                                context
                                    .read(starredReposNotifierProvider.notifier)
                                    .getNextStarredReposPage();
                            }

                            ///
                            /// - Return true to cancel the notification bubbling, 
                            ///   Return false to allow the notification to continue 
                            ///   to be dispatched to further ancestors
                            /// 
                            /// - if we have other notification listeners above this one
                            ///   and we return true from this one, then the notifications 
                            ///   will stop here and the ones above will not receive notifications
                            ///   so we always should return false unless we have a good not to
                            ///
                            return false;
                        },
                        ///
                        /// if we have list of github repos entity is empty show 
                        /// the no results data, else show the list view
                        ///
                        child: state.maybeWhen(
                            ///
                            /// if we are in the load success and the entity is empty, 
                            /// show the no result page (only in this condition)
                            ///
                            loadSuccess: (starredRepos, isNextPageAvailable) => starredRepos.entity.isEmpty,
                            ///
                            /// if we are in any other state we always wanna show a list view
                            ///
                            orElse: () => false,
                        )
                            ///
                            /// - the no result page shows up when there's no item but in the initial state
                            ///   there's no items too so we don't want that page to display in the initial state
                            /// 
                            /// - so we used maybe when to set the child that will be shown,
                            ///   if the entity is empty in the load success then only in this case
                            ///   show the no result page else show the list view
                            ///
                            ? const NoResultsDisplayPage(message: AppStrings.noResultsString)
                            : _PaginatedListView(state: state)
                    ),
                );
            },
        );
    }
}

class _PaginatedListView extends StatelessWidget {
    const _PaginatedListView({
        Key? key,
        required this.state,
    }) : super(key: key);

    final StarredReposState state;

    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            ///
            /// the state contains the starred repos that we wanna its count
            /// but there's 4 cases of the state so we need to map them all
            ///
            itemCount: state.map(
                ///
                /// in this initial state we have nothing to show yet 
                ///
                initial: (initialState) => 0, 
                ///
                /// in this state the count is gonna be the number of the items we already got
                /// then the number of the repos that is still loading 
                ///
                loadInProgress: (loadingState) => 
                    loadingState.starredRepos.entity.length + loadingState.itemsPerPage,
                ///
                /// in this state, the length is gonna be the number of the 
                /// successfully gotten repos we got in the fresh entity 
                /// that comes from the state
                ///
                loadSuccess: (successState) => successState.starredRepos.entity.length, 
                ///
                /// one additional item in the list view in this failure state
                /// because it's the red failure list tile that's gonna allow the user
                /// to try again to fetch the last page that has previously failed
                ///
                loadFailure: (failedState) => failedState.starredRepos.entity.length + 1
            ),
            ///
            /// display different list content based on each state we got from 
            /// the application layer
            ///
            itemBuilder: (context, index) {
                return state.map(
                    initial: (initialState) {
                        return SuccessRepoTile(
                            githubRepoEntity: initialState.starredRepos.entity[index],
                        );
                    }, 
                    ///
                    /// - if the index of the list view is less than the list of repos
                    ///   we got previously then display those repos in this success tile
                    ///   we used to present the success repos in the success state
                    /// 
                    /// - if the index is bigger, then we're in the numbers of 
                    ///   the list tiles that are currently loading 
                    ///
                    loadInProgress: (loadingState) {
                        if (index < loadingState.starredRepos.entity.length) {
                            return SuccessRepoTile(
                                githubRepoEntity: loadingState.starredRepos.entity[index],
                            );
                        } else { 
                            ///
                            /// this is the tile for the shimmer loading
                            ///
                            return const LoadingRepoTile(); 
                        }
                    }, 
                    ///
                    /// load the starred repos when we are in success state
                    ///
                    loadSuccess: (loadSuccessState) {
                        return SuccessRepoTile(
                            githubRepoEntity: loadSuccessState.starredRepos.entity[index],
                        );
                    },
                    ///
                    /// - if the index is less than the length then we are still in 
                    ///   the range of the successfully loaded repos
                    /// 
                    /// - if we are over the length then we are in the length + 1
                    ///   which is the failure 
                    ///
                    loadFailure: (loadFailureState) {
                        if (index < loadFailureState.starredRepos.entity.length) {
                            return SuccessRepoTile(
                                githubRepoEntity: loadFailureState.starredRepos.entity[index],
                            );
                        } else { 
                            return FailureRepoTile(
                                failure: loadFailureState.failure,
                            ); 
                        }
                    },
                );
            },
        );
    }
}