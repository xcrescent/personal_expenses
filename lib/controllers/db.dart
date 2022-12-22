import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class DataBaseCon {
  Future<Database> initializedDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'db_userExpense.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        return await db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, accessToken TEXT NOT NULL, refreshToken TEXT NOT NULL)',
        );
      },
    );
  }

  Future<Database> initializedComDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'db_userExpenseBoolee.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        return await db.execute(
          'CREATE TABLE checkBoolee(id INTEGER PRIMARY KEY, boole INTEGER NOT NULL)',
        );
      },
    );
  }

// insert data
  Future<int> insertUser(User user) async {
    int result = 0;
    final Database db = await initializedDB();
    result = await db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> insertCom() async {
    int result = 0;
    BoolCom boolcom = BoolCom(
      id: 1,
      boole: 1,
    );
    final Database db = await initializedDB();
    result = await db.insert('checkBoolee', boolcom.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

// retrieve data
  Future<List<User>> retrieveUser() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('user');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  Future<List<BoolCom>> retrieveComUser() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('checkBoolee');
    return queryResult.map((e) => BoolCom.fromMap(e)).toList();
  }

// delete user
  Future<void> deleteUser(int id) async {
    final db = await initializedDB();
    await db.delete(
      'user',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteComUser(int id) async {
    final db = await initializedDB();
    await db.delete(
      'checkBoolee',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
