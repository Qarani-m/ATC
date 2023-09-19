import 'package:atc/src/features/authentication/model/user_model.dart';
import 'package:atc/src/features/authentication/repository/aux_functions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AuthDbHelper {
  static Database? db;
  static const int version = 2;
  static const String tablename = "user";

  static const String CREATE_TABLE = '''
    CREATE TABLE $tablename (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      phoneNumber TEXT,
      yearOfStudy TEXT,
      course TEXT,
      idNumber TEXT,
      studentId TEXT
    )
  ''';
  static Future<void> initDb() async {
    if (db != null) {
      print("already on");
      return;
    }
    try {
      String path = "${await getDatabasesPath()}${tablename}s.db";
      db = await openDatabase(path, version: version, onCreate: (db, version) {
        print("creating a new one");
        return db.execute(CREATE_TABLE);
      });
    } catch (e) {
      AuthAuxFunctons.showSnackBar("Sign up error", "An unknown error occured");
      AuthAuxFunctons.showSnackBar("Quick fix", "Contact 0704847676 for a fix");
    }
  }

  static Future<int> insertUser(UserModel model) async {
    await db!.delete(tablename);
    return await db?.insert(tablename, model.toJson()) ?? 0;
  }

  static Future<List<UserModel>> getStudentFromLocalDb() async {
    print("fetching");
    List<Map<String, dynamic>> taskMaps = await db!.query(
      tablename,
    );
    return taskMaps.map((data) => UserModel.fromJson(data)).toList();
  }
}
