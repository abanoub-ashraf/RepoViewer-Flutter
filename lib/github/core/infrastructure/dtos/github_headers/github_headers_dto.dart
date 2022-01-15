import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_link_header.dart';

part 'github_headers_dto.freezed.dart';
///
/// this is for adding the to json and from json to this data class
/// cause we wanna store the properties of this class in sembast local database
/// and it only accept data in json format
///
part 'github_headers_dto.g.dart';

///
/// - this headers dto data class will only be used from the infrastructure layer only
///   so there's no need to create an entity for it cause the presentation layer 
///   doesn't need to know about this headers
/// 
/// - we will map/parse the header of the response of the http request into this dto class
///
@freezed
class GithubHeadersDTO with _$GithubHeadersDTO {
    const GithubHeadersDTO._();

    const factory GithubHeadersDTO({
        ///
        /// this is nullable because not every api response may come with an etag
        /// and same as with the pagination link
        ///
        String? etag,
        PaginationLinkHeader? link,
    }) = _GithubHeadersDTO;

    ///
    /// create a dto object of the etag and the link out of the response we will get
    ///
    factory GithubHeadersDTO.parse(Response response) {
        ///
        /// this link could be null so we stored it in a variable, and if it's null
        /// then set the link down there to be null otherwise set it to its existing value
        ///
        final link = response.headers.map['Link']?[0];

        return GithubHeadersDTO(
            ///
            /// the [0] has the whole ETag tag out of the map
            ///
            etag: response.headers.map['ETag']?[0],
            ///
            /// the [0] has the whole Link tag out of the map, we need only the max pages number
            /// but that's already attached to one of the values of the link tag
            /// 
            /// parse() takes list of strings so split() gives us that list of the substrings
            /// is what we wanna give to the parse()
            ///
            link: link == null 
                ? null 
                : PaginationLinkHeader.parse(
                    link.split(','), 
                    requestUrl: response.requestOptions.uri.toString()
                ),
        );
    }

    ///
    /// this is for adding the to json and from json to this data class
    /// cause we wanna store the properties of this class in sembast local database
    /// and it only accept data in json format
    ///
    factory GithubHeadersDTO.fromJson(Map<String, dynamic> json) => 
        _$GithubHeadersDTOFromJson(json);
}