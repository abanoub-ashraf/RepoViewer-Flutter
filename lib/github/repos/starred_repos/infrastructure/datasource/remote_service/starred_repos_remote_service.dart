import 'package:dio/dio.dart';
import '../../../../../core/infrastructure/config/pagination_config.dart';

import '../../../../../../core/infrastructure/datasource/remote_service/remote_service_response.dart';
import '../../../../../../core/infrastructure/networking/dio_extensions.dart';
import '../../../../../../core/infrastructure/networking/rest_api_exception.dart';
import '../../../../../core/infrastructure/datasource/local_service/github_headers_cache.dart';
import '../../../../../core/infrastructure/dtos/github_headers/github_headers_dto.dart';
import '../../../../../core/infrastructure/dtos/github_repo/github_repo_dto.dart';

///
/// this class will make http request to the github server 
/// to get starred repos data
///
class StarredReposRemoteService {
    final Dio _dio;
    final GithubHeadersCache _githubHeadersCache;

    StarredReposRemoteService(
        this._dio, 
        this._githubHeadersCache
    );

    ///
    /// - this function makes the http request that gets the starred repos data from the server
    /// 
    /// - the data we get from this http request will communicate with the repository
    ///   that's why we need to return this response instead of the dto direct
    ///
    Future<RemoteServiceResponse<List<GithubRepoDTO>>> getStarredReposPage(int page) async {
        ///
        /// this is the full request url with the endpoint and the query param 
        /// which is the current page number that will be passed to this infrastructure
        /// from another layer
        ///
        final requestUri = Uri.https(
            'api.github.com', 
            '/user/starred',
            { 
                'page': '$page', 
                'per_page': PaginationConfig.itemsPerPage.toString(),
            }
        );

        ///
        /// to get the etag from the previous request in case the app is not running
        /// for the first time and that etag will be used to determine wether the saved
        /// data is up to date or not when we use it in the request we're going to make
        ///
        final previousHeaders = await _githubHeadersCache.getHeaders(requestUri);
        
        ///
        /// make the http request passing the token and the accept to the header
        /// of the request
        ///
        try {
            final response = await _dio.getUri(
                requestUri,
                options: Options(
                    headers: {
                        ///
                        /// if the etag in case the app is running for the first time
                        /// we will get 200 response with the data just fine
                        ///
                        'If-None-Match': previousHeaders?.etag ?? '',
                    },
                ),
            );

            ///
            /// - if the status code is 304 then the data we got from the request is the same
            ///   as the one we already have saved in the local database 
            ///
            /// - if the status code is 200 then we either got new data because we didn't 
            ///   include etag in the request at all or because we did include one but 
            ///   the data we got was outdated so we got new one instead, bu we got new data
            ///   so we will get the headers from the response and save them in the local database
            ///   and return the data as list of dto to be converted into entities in the repository
            ///
            if (response.statusCode == 304) {
                return RemoteServiceResponse.notModified(
                    ///
                    /// use the old max page of the old header in this not modified case
                    ///
                    maxPage: previousHeaders?.link?.maxPage ?? 0
                );
            } else if (response.statusCode == 200) {
                ///
                /// parse the headers json of the response into headers object 
                /// then save them
                ///
                final headers = GithubHeadersDTO.parse(response);

                ///
                /// save the header we get from the response of the request
                ///
                await _githubHeadersCache.saveHeaders(requestUri, headers);

                ///
                /// make a list of github repo dto object and send them to the with data
                /// response case 
                ///
                final convertedData = (response.data as List<dynamic>)
                    .map(
                        (element) => GithubRepoDTO.fromJson(
                            element as Map<String, dynamic>
                        )
                    )
                    .toList();

                ///
                /// send the new data we got from the response
                /// with the max page, if the max page is not exit cause the link is
                /// not exist in the case if the user has few stars repos then
                /// in that case return default max page to be 1
                ///
                return RemoteServiceResponse.withNewData(
                    convertedData,
                    maxPage: headers.link?.maxPage ?? 1
                );
            } else {
                throw RestApiException(response.statusCode);
            }
        } on DioError catch (error) {
            if (error.isNoConnectionError) {
                ///
                /// this no connection remote response will come from the error
                /// that happens here in this remote data source
                ///
                return const RemoteServiceResponse.noConnection();
            } else if (error.response!= null) {
                throw RestApiException(
                    error.response?.statusCode
                );
            } else {
                rethrow;
            }
        }
    }
}