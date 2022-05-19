// import 'package:path/path.dart';
// import 'package:pouchapp/models/mawb_data_model.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseHelper {
//   static final _databaseName = "MawbDatabase.db";
//   static final _databaseVersion = 1;
//   static final table = 'mawb_table';
//
//   // make this a singleton class
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   // only have a single app-wide reference to the database
//   static Database _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     // lazily instantiate the db the first time it is accessed
//     _database = await _initDatabase();
//     return _database;
//   }
//
//   // this opens the database (and creates it if it doesn't exist)
//   _initDatabase() async {
//     return await openDatabase(
//       // Set the path to the database. Note: Using the `join` function from the
//       // `path` package is best practice to ensure the path is correctly
//       // constructed for each platform.
//       join(await getDatabasesPath(), _databaseName),
//       // When the database is first created, create a table to store mawbs.
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE $table( mawbNumber TEXT PRIMARY KEY, filepath TEXT, uploadStatus INTEGER)",
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: _databaseVersion,
//     );
//   }
//
// // Helper methods
//
//   // Inserts a row in the database where each key in the Map is a column name
//   // and the value is the column value. The return value is the id of the
//   // inserted row.
//   Future<void> insert(Mawb mawb) async {
//     // Get a reference to the database.
//     final Database db = await instance.database;
//
//     // Insert the Mawb into the correct table. Also specify the
//     // `conflictAlgorithm`. In this case, if the same Mawb is inserted
//     // multiple times, it replaces the previous data.
//     await db.insert(
//       table,
//       mawb.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   // A method that retrieves all the dogs from the Mawb table.
//   Future<List<Mawb>> queryAllRows() async {
//     // Get a reference to the database.
//     final Database db = await instance.database;
//
//     // Query the table for all The Mawb.
//     final List<Map<String, dynamic>> maps = await db.query(table);
//
//     // Convert the List<Map<String, dynamic> into a List<Mawb>.
//     return List.generate(maps.length, (i) {
//       return Mawb(
//         mawbNumber: maps[i]['mawbNumber'],
//         filepath: maps[i]['filepath'],
//         uploadStatus: maps[i]['uploadStatus'],
//       );
//     });
//   }
//
//   // All of the methods (insert, query, update, delete) can also be done using
//   // raw SQL commands. This method uses a raw query to give the row count.
//   Future<int> queryRowCount() async {
//     Database db = await instance.database;
//     return Sqflite.firstIntValue(
//         await db.rawQuery('SELECT COUNT(*) FROM $table'));
//   }
//
//   //selecting the upload status
//   Future<int> getUploadStatus(String mawbNumber) async {
//     Database db = await instance.database;
//
//     //Be sure to use data binding using ? string replacements.
//     //This will guard against SQL injection attacks and is also necessary to get accurate values.
//     return Sqflite.firstIntValue(await db.rawQuery(
//         'SELECT uploadStatus FROM $table WHERE mawbNumber=?', [mawbNumber]));
//   }
//
//
//   // We are assuming here that the id column in the map is set. The other
//   // column values will be used to update the row.
//   Future<void> update(Mawb mawb) async {
//     Database db = await instance.database;
//
//     // Update the given Mawb.
//     await db.update(
//       table,
//       mawb.toMap(),
//       // Ensure that the Mawb has a matching Mawb number.
//       where: "mawbNumber = ?",
//       // Pass the Mawb number as a whereArg to prevent SQL injection.
//       whereArgs: [mawb.mawbNumber],
//     );
//   }
//
//   Future<void> deleteMawb(String mawbNumber) async {
//     // Get a reference to the database.
//     final db = await instance.database;
//
//     // Remove the Mawb from the database.
//     await db.delete(
//       table,
//       // Use a `where` clause to delete a specific Mawb.
//       where: "mawbNumber = ?",
//       // Pass the Mawb number as a whereArg to prevent SQL injection.
//       whereArgs: [mawbNumber],
//     );
//   }
// }
