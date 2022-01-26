import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/repo_owner/repo_owner_entity.dart';

///
/// - this is for the freezed package
/// 
/// - the snippet for it is --> ptf
///
part 'repo_owner_dto.freezed.dart';
///
/// - this is for the json serializable package
/// 
/// - the snippet for it is --> pts
///
part 'repo_owner_dto.g.dart';

///
/// - this is the user/owner dto of the repo
/// 
/// - the fields of the dto will be feed with data from the json response of the server
///
@freezed
class RepoOwnerDTO with _$RepoOwnerDTO {
    const RepoOwnerDTO._();

    ///
    /// - this constructor takes the fields that will represents the felids of 
    ///   the json response of the server
    /// 
    /// - only the owner json object from the response not the whole response
    ///
    const factory RepoOwnerDTO({
        ///
        /// - use this json key annotation to give these constructor fields the names of 
        ///   the json fields that we want the generated dart fields to be the same 
        /// 
        /// - if we didn't do that, then the generated fields will have the names of these fields
        ///   i defined here inside this constructor, and the json response has different names 
        ///   so these names will be wrong
        ///
        @JsonKey(name: 'login')      required String name,
        @JsonKey(name: 'avatar_url') required String avatarUrl,
    }) = _RepoOwnerDTO;

    ///
    /// - this is the manual way of converting the server json response into dro dart object
    ///
    /// - convert the json response object fields into dart object with its own dart fields
    ///   the manual way
    /// 
    /// - the other way is using json_serializable package and it will generate code for us
    ///   instead of typing it manually
    ///
    // factory RepoOwnerDTO.fromJson(Map<String, dynamic> json) {
    //     return RepoOwnerDTO(
    //         name: json['login'] as String, 
    //         avatarUrl: json['avatar_url'] as String,
    //     );
    // }

    ///
    /// instead of typing the fromJson() above ourselves we can use json_serializable package
    /// to generate that code for us
    /// 
    /// this package is used with normal classes not freezed ones 
    /// but we can integrate it with freeze by:
    ///     1- add freezed_annotation in the dependencies and json_serializable in the dev ones 
    ///     2- then add the pts statement inside this file (to include the file that will be generated)
    ///     3- then create this constructor using the fromJson snippet and give it the name of this class
    ///     4- then run the build runner or rerun it if it was already running
    ///
    factory RepoOwnerDTO.fromJson(Map<String, dynamic> json) => _$RepoOwnerDTOFromJson(json);

    ///
    /// - convert from entity [domain layer] to dto [infrastructure layer]
    /// 
    /// - the conversion from dto into entity will happen inside the dto class
    ///   like what we're doing right now in this factory constructor
    ///
    factory RepoOwnerDTO.fromDomain(RepoOwnerEntity repoOwnerEntity) {
        return RepoOwnerDTO(
            name: repoOwnerEntity.name, 
            avatarUrl: repoOwnerEntity.avatarUrl
        );
    }

    ///
    /// convert from dto [infrastructure layer] to entity [domain layer]
    ///
    RepoOwnerEntity toDomain() {
        return RepoOwnerEntity(
            name: name, 
            avatarUrl: avatarUrl
        );
    }
}