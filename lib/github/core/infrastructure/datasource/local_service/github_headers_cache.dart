import 'package:sembast/sembast.dart';

import '../../../../../core/infrastructure/datasource/local_service/sembast_database.dart';
import '../../dtos/github_headers/github_headers_dto.dart';

///
/// read, save, and delete headers from the sembast local database
///
class GithubHeadersCache {
    final SembastDatabase _sembastDatabase;
    
    ///
    /// - sembast database deal with stores, each store is like a place to store
    ///   specific data
    /// 
    /// - we used string map store factory cause the key of the data we wanna save
    ///   is string
    ///
    final _store = stringMapStoreFactory.store('headers');
    
    GithubHeadersCache(
        this._sembastDatabase
    );

    ///
    /// save the headers dto object after we get it from the response of the http request
    /// that the remote services will make to get the starred repos
    /// 
    /// in order for the storing to happen it needs to store things with key to use that key
    /// for retrieving what we stored
    ///
    Future<void> saveHeaders(Uri uri, GithubHeadersDTO headers) async {
        await _store
            .record(uri.toString())
            .put(
                _sembastDatabase.instance, 
                headers.toJson()
            );
    }

    Future<GithubHeadersDTO?> getHeaders(Uri uri) async {
        final json = await _store
            .record(uri.toString())
            .get(_sembastDatabase.instance);
        
        return json == null 
            ? null 
            : GithubHeadersDTO.fromJson(json);
    }

    Future<void> deleteHeaders(Uri uri) async {
        await _store
            .record(uri.toString())
            .delete(_sembastDatabase.instance);
    }
}