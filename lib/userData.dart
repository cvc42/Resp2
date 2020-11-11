import 'databaseHelper.dart';

// Interfaces with database.

/* Future<String> changeName(String newName) async {
  // Get a reference to the database.
  final db = DatabaseHelper();
  db.updateName(userName, newName);
} */

double getAccuracy() {
  final db = DatabaseHelper();
  double accuracy;
  db.accuracy.then((value) => accuracy = value);
  return accuracy;
}

int getNumAttempted() {
  final db = DatabaseHelper();
  int attempted;
  db.attempted.then((value) => attempted = value);
  return attempted;
}

int getMostMisdiagnosed() {
  final db = DatabaseHelper();
  int mostMisdiagnosed;
  db.misdiagnosed.then((value) => mostMisdiagnosed = value);
  return mostMisdiagnosed;
}

int getMostCorrectlyDiagnosed() {}
void updateStats(String diagnosisAnswer, bool correct) {}

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
