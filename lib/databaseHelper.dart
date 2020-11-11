import 'dart:async';
import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  /* This syntax allows user to believe they are creating an instance of class 
  when in reality they are just accessing the persistent database object */
  static DatabaseHelper _instance;
  DatabaseHelper._privateConstructor();
  factory DatabaseHelper() {
    if (_instance == null) {
      _instance = DatabaseHelper._privateConstructor();
    }
    return _instance;
  }

  // We only want to allow a single open database connection.
  static Database _database;
  // Getter for database.
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  // Opens database.
  _initDatabase() async {
    openDatabase(join(await getDatabasesPath(), 'user_data.db'),
        onCreate: (db, version) {
      // Using + to make sqlite command more readable.
      return db.execute(
        "CREATE TABLE user_data(userName TEXT PRIMARY KEY UNIQUE, " +
            "numCorrect INTEGER, numAttempted INTEGER, numCHFMissed INTEGER, " +
            "numCOPDMissed INTEGER, numPneumMissedINTEGER, " +
            "numCHFCorrect INTEGER, numCOPDCorrect INTEGER, " +
            "numPneumCorrect INTEGER, longestStreak INTEGER,)",
      );
    }, version: 1);
  }

  /* raw version allow direct usage of SQLite syntax vs. using a map.
  Future<void> updateName(String oldName, String newName) async {
    await _database.rawUpdate();
  }*/

  Future<double> get accuracy async {
    List<Map> accuracyVars = await _database.query(
      'user_data',
      columns: [
        'numCorrect',
        'numAttempted',
      ],
    );
    // List should only have one Map. Sanity check.
    if (accuracyVars.length != 1) {
      return -1;
    }
    // Accuracy is total correct / total attempted.
    return accuracyVars.first[0] / accuracyVars.first[1];
  }

  Future<int> get attempted async {
    List<Map> attemptedVar = await _database.query(
      'user_data',
      columns: [
        'numAttempted',
      ],
    );
    // List should only have one Map. Sanity check.
    if (attemptedVar.length != 1) {
      return -1;
    }
    return attemptedVar.first[0];
  }

  Future<int> get misdiagnosed async {
    List<Map> missedVals = await _database.query(
      'user_data',
      columns: [
        'numCHFMissed',
        'numCOPDMissed',
        'numPneumMissed',
      ],
      limit: 1,
    );
    // List should only have one Map. Sanity check.
    if (missedVals.length != 1) {
      return -1;
    }
    List<int> missed = [
      missedVals[0][0],
      missedVals[1][0],
      missedVals[2][0],
    ];
    // Get highest miss value.
    return missed.reduce(max);
  }
}
