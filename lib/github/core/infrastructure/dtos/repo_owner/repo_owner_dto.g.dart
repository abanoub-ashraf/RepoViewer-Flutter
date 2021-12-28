// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_owner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepoOwnerDTO _$$_RepoOwnerDTOFromJson(Map<String, dynamic> json) =>
    _$_RepoOwnerDTO(
      name: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$_RepoOwnerDTOToJson(_$_RepoOwnerDTO instance) =>
    <String, dynamic>{
      'login': instance.name,
      'avatar_url': instance.avatarUrl,
    };
