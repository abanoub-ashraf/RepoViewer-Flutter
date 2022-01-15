import '../domain/entities/github_repo/github_repo_entity.dart';
import '../infrastructure/dtos/github_repo/github_repo_dto.dart';

///
/// convert list of github repo dto into list of github repo entity
///
extension DTOListToDomainList on List<GithubRepoDTO> {
    List<GithubRepoEntity> toDomain() {
        return map(
            (githubRepoDTOElement) => githubRepoDTOElement.toDomain()
        ).toList();
    }
}