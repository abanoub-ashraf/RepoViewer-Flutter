import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repo_viewer/utils/app_constants.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

///
/// - we need path provider and path packages for this local database to work
/// 
/// - path provider will give us the directory path of where the application stored its data
/// 
/// - path will help us creating a path for the database file
///
class SembastDatabase {
    ///
    /// we will use this to read and write to the database
    ///
    late Database _instance;

    Database get instance => _instance;

    ///
    /// this safe guard for just in case the init method is called many times
    /// it will fail cause it can't open the database that's already open
    ///
    bool _hasBeenInitialized = false;

    Future<void> init() async {
        ///
        /// to stop the execution of this init method if it's going to be called again
        ///
        if (_hasBeenInitialized) return;

        _hasBeenInitialized = true;
        
        ///
        /// get the directory where the application place its data
        ///
        final dbDirectory = await getApplicationDocumentsDirectory();
        
        ///
        /// - sometimes the directory above is not created yet so we use this line 
        ///   with recursive true
        /// 
        /// - if [recursive] is false, only the last directory in the path is created,  
        ///   if [recursive] is true, all non-existing path components are created, 
        ///   if the directory already exists nothing is done.
        ///
        dbDirectory.create(recursive: true);
        
        ///
        /// create a path for the database file to be stored
        ///
        final dbPath = join(
            dbDirectory.path, 
            AppConstants.sembastDatabase
        );

        ///
        /// - now we will open the database with its path we made above
        ///
        /// - this database factory will save things on the device
        ///
        _instance = await databaseFactoryIo.openDatabase(dbPath);
    }
}