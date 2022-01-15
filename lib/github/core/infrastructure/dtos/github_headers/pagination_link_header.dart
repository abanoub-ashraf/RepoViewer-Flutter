import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_link_header.freezed.dart';
///
/// this is for adding the to json and from json to this data class
/// cause we wanna store the properties of this class in sembast local database
/// and it only accept data in json format
///
part 'pagination_link_header.g.dart';

///
/// - we will parse the pagination link of the response's heder of the http request 
///   into this class
/// 
/// - this link contains the pagination information, we need to know the number of the last page
///
@freezed
class PaginationLinkHeader with _$PaginationLinkHeader {
    const PaginationLinkHeader._();

    const factory PaginationLinkHeader({
        required int maxPage,
    }) = _PaginationLinkHeader;

    ///
    /// - the headers of the response in dio are in a form of a list of strings
    ///   and we need only the number of the max pages 
    /// 
    /// - the request url is the url that makes the request and it might contain 
    ///   the number of the max pages 
    ///
    factory PaginationLinkHeader.parse(
        List<String> values, 
        { required String requestUrl }
    ) {
        return PaginationLinkHeader(
            ///
            /// - values param is the whole link and we will get from it only 
            ///   the second url which contains the max pages number
            /// 
            /// - look for the element that has the word [rel="last"] and pass it to this function to extract
            ///   the max pages number from it, if we couldn't find it then the url that has the max pages
            ///   number is the request url itself
            ///
            maxPage: _extractMaxPagesNumber(
                values.firstWhere(
                    (element) => element.contains('rel="last"'),
                    orElse: () => requestUrl,
                )
            )
        );
    }

    ///
    /// this is for adding the to json and from json to this data class
    /// cause we wanna store the properties of this class in sembast local database
    /// and it only accept data in json format
    ///
    factory PaginationLinkHeader.fromJson(Map<String, dynamic> json) => 
        _$PaginationLinkHeaderFromJson(json);

    /**
     Link: <https://api.github.com/user/starred?page=2>; rel="next", 
     <https://api.github.com/user/starred?page=8>; rel="last"

     Link: <https://api.github.com/user/starred?page=1>; rel="prev", 
     <https://api.github.com/user/starred?page=3>; rel="next", 
     <https://api.github.com/user/starred?page=3>; rel="last", 
     <https://api.github.com/user/starred?page=1>; rel="first"

     Link: <https://api.github.com/user/starred?page=2>; rel="next", 
     <https://api.github.com/user/starred?page=5>; rel="last"
     */

    ///
    /// - the function that will be called from a factory needs to be static
    /// 
    /// - the value parameter is only gonna be the part of the link which contains 
    ///   the [rel="last"] and the max number of pages and which is what we want to 
    ///   extract from that link
    /// 
    /// - this value param is this part from the link:
    ///   <https://api.github.com/user/starred?page=8>; rel="last"
    ///
    static int _extractMaxPagesNumber(String value) {
        ///
        /// we will extract the url that has the page query param 
        /// using this regular expression
        ///
        final uriString = RegExp(
            r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'
        ).stringMatch(value);

        ///
        /// - then parse that query param into an integer
        /// 
        /// - that integer will be passed to the maxPages property of 
        ///   the parse constructor
        ///
        return int.parse(
            Uri.parse(uriString!).queryParameters['page']!
        );
    }
}