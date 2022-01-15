// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_headers_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubHeadersDTO _$$_GithubHeadersDTOFromJson(Map<String, dynamic> json) =>
    _$_GithubHeadersDTO(
      etag: json['etag'] as String?,
      link: json['link'] == null
          ? null
          : PaginationLinkHeader.fromJson(json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GithubHeadersDTOToJson(_$_GithubHeadersDTO instance) =>
    <String, dynamic>{
      'etag': instance.etag,
      'link': instance.link,
    };
