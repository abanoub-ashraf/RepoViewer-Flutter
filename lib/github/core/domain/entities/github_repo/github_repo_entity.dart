import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/domain/entities/repo_owner/repo_owner_entity.dart';

part 'github_repo_entity.freezed.dart';

///
/// - this entity is gonna be clean dart data class using the freezed package
/// 
/// - this entity represents a single github repo
/// 
/// - it needs to know about its owner and its own data fields
///
@freezed
class GithubRepoEntity with _$GithubRepoEntity {
    const GithubRepoEntity._();

    const factory GithubRepoEntity({
        required RepoOwnerEntity owner,
        required String name,
        required String description,
        required int stargazersCount,
    }) = _GithubRepoEntity;

    ///
    /// - get the full name of the repo owner / the name of the repo
    /// 
    /// - that's the [ResoDev/cli] example of the star a repository endpoint in 
    ///   the starring_repositories.http file (line 7)
    /// 
    /// - this way encapsulates the structure of this entity file to the outside classes
    ///   if i called this ['${owner.name}/$name'] from outside, it will expose the structure
    ///   of this entity class and that violates the encapsulation principle
    ///
    String get fullName => '${owner.name}/$name';
}