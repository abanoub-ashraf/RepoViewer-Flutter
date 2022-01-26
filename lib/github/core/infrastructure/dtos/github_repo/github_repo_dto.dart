import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/github_repo/github_repo_entity.dart';
import '../repo_owner/repo_owner_dto.dart';

part 'github_repo_dto.freezed.dart';
part 'github_repo_dto.g.dart';

///
/// this function is for handling a field in the json response of the server that 
/// came back as null
///
String _descriptionFromJson(Object? json) {
    return (json as String?) ?? '';
}

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
    const GithubRepoDTO._();

    ///
    /// this constructor takes the fields that will be in the json response
    /// and use JsonKey if the names was different
    ///
    const factory GithubRepoDTO({
        required RepoOwnerDTO owner,
        required String name,
        ///
        /// - everything i put in an annotation constructor needs to be constant
        /// 
        /// - the description field can be null in the json response so this function
        ///   is for returning an empty string in case this field is null
        ///
        @JsonKey(fromJson: _descriptionFromJson) required String description,
        @JsonKey(name: 'stargazers_count') required int stargazersCount,
    }) = _GithubRepoDTO;

    factory GithubRepoDTO.fromJson(Map<String, dynamic> json) => 
        _$GithubRepoDTOFromJson(json);

    factory GithubRepoDTO.fromDomain(GithubRepoEntity githubRepoEntity) {
        return GithubRepoDTO(
            owner: RepoOwnerDTO.fromDomain(githubRepoEntity.owner), 
            name: githubRepoEntity.name, 
            description: githubRepoEntity.description, 
            stargazersCount: githubRepoEntity.stargazersCount
        );
    }

    GithubRepoEntity toDomain() {
        return GithubRepoEntity(
            owner: owner.toDomain(), 
            name: name, 
            description: description, 
            stargazersCount: stargazersCount
        );
    }
}