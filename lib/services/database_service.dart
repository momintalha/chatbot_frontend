import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._();
  static final chatDb = DatabaseService._();

  Database? _db;
  Future<Database?> _getDb() async {
    return _db ??= await _createDb();
  }

  Future<Database?> _createDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.toString(), 'chatbot._db');

    final Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => _onCreate(db),
    );
    return db;
  }

  Future<void> _onCreate(Database db) async {
    await db.execute('''Create TABLE chat( 
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT, 
          created_at DATETIME, 
          updated_at DATETIME 
      )''');

    await db.execute('''Create TABLE message( 
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          chatid INT,
          role TEXT, 
          content TEXT,
          created_at DATETIME, 
          FOREIGN KEY (chatid) REFERENCES chat(id)
          ON DELETE CASCADE
      )''');
  }

  Future<int?> create({
    String? title,
    String? createdAt,
    String? updatedAt,
  }) async {
    final db = await _getDb();
    final int? id = await db?.rawInsert(
      '''INSERT INTO chat(title, created_at, updated_at)
      VALUES(?, ?, ?)''',
      [title, createdAt, updatedAt],
    );
    return id;
  }

  Future<void> insert({
    int? chatid,
    String? role,
    String? content,
    String? dateTime,
  }) async {
    final db = await _getDb();
    await db?.rawInsert(
      '''INSERT INTO message(chatid, role, content, created_at)
      VALUES(?, ?, ?, ?)''',
      [chatid, role, content, dateTime],
    );
  }

  Future<List<Map<String, dynamic>>?> fetchChats() async {
    final db = await _getDb();
    final data = await db?.rawQuery('''SELECT id, title FROM chat 
      ORDER BY id ASC''');
    return data;
  }

  Future<List<Map<String, dynamic>>?> fetchChat({required int? id}) async {
    final db = await _getDb();
    final data = await db?.rawQuery(
      '''SELECT * FROM message 
      WHERE chatid = ? 
      ORDER BY id ASC''',
      [id],
    );
    return data;
  }

  Future<int?> delete({required int? id}) async {
    final db = await _getDb();
    final int? count = await db?.rawDelete(
      '''DELETE FROM chat 
    WHERE id = ?''',
      [id],
    );
    return count;
  }
}
