import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh_data_entity.freezed.dart';

///
/// - this entity will be used from inside the infrastructure of the repos/starred_repos
///   to indicate if the data is outdated so we can use that to display a message in the ui
///   indicating that the data is outdated
/// 
/// - in case of the starred_repos the T is gonna be the list of github repo entity
///
@freezed
class FreshDataEntity<T> with _$FreshDataEntity<T> {
    const FreshDataEntity._();

    const factory FreshDataEntity({
        ///
        /// the type of entity this class will have
        ///
        required T entity,
        ///
        /// to tell us whether to display a message in the ui saying the data
        /// is outdated or not
        ///
        required bool isFresh,
        ///
        /// instead of sending the max page number to the application layer
        /// we will use this bool instead, if it's true then we will increase the page number
        /// in the state notifier of the application layer and get the next page next time 
        /// it's needed, if not available then we will stop getting the pages altogether
        ///
        bool? isNextPageAvailable,
    }) = _FreshDataEntity<T>;

    factory FreshDataEntity.yes(T entity, { bool? isNextPageAvailable }) => FreshDataEntity(
        entity: entity, 
        isFresh: true, 
        isNextPageAvailable: isNextPageAvailable
    );

    factory FreshDataEntity.no(T entity, { bool? isNextPageAvailable }) => FreshDataEntity(
        entity: entity, 
        isFresh: false, 
        isNextPageAvailable: isNextPageAvailable
    );
}