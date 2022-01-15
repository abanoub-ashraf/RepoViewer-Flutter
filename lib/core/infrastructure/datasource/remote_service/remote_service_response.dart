import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_service_response.freezed.dart';

///
/// - this is the response that we will get from the http request inside the 
///   starred repos remote service file
/// 
/// - this response has to be generic to be able to hold the different types of the data we get 
///   from the json response of the http server inside the starred repos remote service file
/// 
/// - it has all the cases that we might get from that http request
/// 
/// - if we have no connection at all, or the data we got is already up to date with 
///   the cached data in the local service, or a new data has been got from the server
///   that are different from the cached one
///
/// - the remote service will return this response instead of the type of the data dto 
///   to be able to do stuff in the repository like deciding what data to give out of 
///   the entire infrastructure layer
/// 
/// - what happens in the repository is that we combine the data from the remote services
///   and local services and decide if we should use the remote data or the local data
///   if the local data is updated (matches the remote one) then use the local one
///   but if it's outdated then use the remote one, or if we don't have any connection
///   then we will use the local one cause we wanna at least display something to the user
///   even tho they are not connected to the internet
/// 
/// - we will send the max page we get from the data source in this response cases and 
///   send it to the repository 
/// 
/// - so all those cases need to communicate with the repository
///
@freezed
class RemoteServiceResponse<T> with _$RemoteServiceResponse<T> {
    const RemoteServiceResponse._();

    ///
    /// in case the user has no connection
    ///
    const factory RemoteServiceResponse.noConnection({ 
        required int maxPage
    }) = _NoConnection<T>;
    
    ///
    /// in case the data we got from the server is the same as the cached one
    ///
    const factory RemoteServiceResponse.notModified({ 
        required int maxPage
    }) = _NotModified<T>;
    
    ///
    /// in case the local data is outdated cause the server gave us new data
    ///
    const factory RemoteServiceResponse.withNewData(
        T data, 
        { required int maxPage }
    ) = _WithNewData<T>;
}