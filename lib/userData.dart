import 'package:RESP2/databaseHelper.dart';
import 'package:sqflite/sqlite_api.dart';

// Interfaces with database.

void createUser(String name, String id) async {
  final db = DatabaseHelper();
  await db.createUser(name, id);
}

Future<Map<String, int>> getStatistics() {
  final db = DatabaseHelper();
  /* for most correct and incorrect diagnosed:
  0 - CHF
  1 - COPD
  2 - PNUEMONIA
  */
  return db.getStats();
}

void updateStatistics(
    String diagnosisAnswer, String difficultyLevel, bool correctVal) {
  final db = DatabaseHelper();
  db.updateStats(diagnosisAnswer, difficultyLevel, correctVal);
}

Future<int> spendPoints(int amount) {
  final db = DatabaseHelper();
  return db.spendPoints(amount);
}

Future<int> getStorePoints() {
  final db = DatabaseHelper();
  return db.storePoints;
}

Future<String> changeName(String newName) async {
  // Get a reference to the database.
  final db = DatabaseHelper();
  db.updateName(newName);
  return newName;
}

Future<String> getName() async {
  final db = DatabaseHelper();
  return db.name;
}
