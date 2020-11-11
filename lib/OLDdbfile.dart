import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// This should only run once per new user.
void createDB(String name) async {
  // Avoids Flutter upgrade errors.
  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'user_data.db'), onCreate: (db, version) {
    // Using + to make sqlite command more readable.
    return db.execute(
      "CREATE TABLE user_data(userName TEXT PRIMARY KEY UNIQUE, " +
          "numCorrect INTEGER, numAttempted INTEGER, numCHFMissed INTEGER, " +
          "numCOPDMissed INTEGER, numPneumMissedINTEGER, " +
          "numCHFCorrect INTEGER, numCOPDCorrect INTEGER, " +
          "numPneumCorrect INTEGER, longestStreak INTEGER,)",
    );
  }, version: 1);

  // Get a reference to the database.
  final Database db = await database;

  UserData newUser = UserData(name);

  // Conflict Algorithm statement ensures overwrite if user already exists.
  await db.insert(
    'user_data',
    newUser.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

class UserData {
  String userName;
  int numCorrect;
  int numAttempted;
  int numCHFMissed;
  int numCOPDMissed;
  int numPneumMissed;
  int numCHFCorrect;
  int numCOPDCorrect;
  int numPneumCorrect;
  int longestStreak;

  UserData(this.userName);

  Map<String, dynamic> toMap() {
    return {
      'numCorrect': numCorrect,
      'numAttempted': numAttempted,
      'numCHFMissed': numCHFMissed,
      'numCOPDMissed': numCOPDMissed,
      'numPneumMissed': numPneumMissed,
      'numCHFCorrect': numCHFCorrect,
      'numCOPDCorrect': numCOPDCorrect,
      'numPneumCorrect': numPneumCorrect,
      'longestStreak': longestStreak,
    };
  }
}
