import 'package:freezed_annotation/freezed_annotation.dart';

part 'repo_owner_entity.freezed.dart';

///
/// we need to know the name and the avatar url of the user (the owner of the repo)
///
@freezed
class RepoOwnerEntity with _$RepoOwnerEntity {
    const RepoOwnerEntity._();

    const factory RepoOwnerEntity({
        required String name,
        required String avatarUrl,
    }) = _RepoOwnerEntity;
}