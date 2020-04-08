import 'dart:async';
import 'dart:io';
import 'package:burc_rehberi/bolum24/model/ogrenci.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  //sütun adları string olarak tanımlanır bu tavsiye edilir sütun adı değiştirirseniz diye ileride değişkene atarız
  String _ogrenciTablo = 'ogrenci';
  String _columnID = 'id';
  String _columnIsim = 'isim';
  String _columnAktif = 'aktif';

  DatabaseHelper._internal(); //internal değişken adi istediğin ismi verebilirsin
  // her isteyen bundan nesne üretmesin diye private tanımladık

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      print("DATABASE HELPER NULL, OLUŞTURULACAK");
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    }else{
      print("DATABASE HELPER ZATEN OLUŞTURULMUŞ");
      return _databaseHelper;
    }

  }
  Future<Database> _getDatabase() async {
    if(_database == null){
      print("DATABASE NESNESİ NULL, OLUŞTURULACAK");
      _database = await _initializeDatabase();
      return _database;
    }else{
      print("DATABASE NESNESİ ZATEN OLUŞTURULMUŞ");
      return _database;
    }
  }

  _initializeDatabase() async{
    Directory klasor = await getApplicationDocumentsDirectory();
    String path = join(klasor.path,"ogrenci.db");
    print("Oluşan veritabanının tam yolu : $path");
    var ogrenciDB = await openDatabase(path, version: 1, onCreate: _createDB);
    return ogrenciDB;
  }

  Future _createDB(Database db, int version) async {
    print("CREATE DB METHODU ÇALIŞTI TABLO OLUŞTURULACAK");
    await db.execute("CREATE TABLE $_ogrenciTablo ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnIsim TEXT, $_columnAktif INTEGER )");

  }

  Future<int> ogrenciEkle(Ogrenci ogrenci) async{
    var db = await _getDatabase();
    var sonuc = db.insert(_ogrenciTablo, ogrenci.toMap());
    print("Ogrenci eklendi");
    return sonuc;
  }
  Future<List<Map<String, dynamic>>> tumOgrenciler() async{
    var db = await _getDatabase();
    var sonuc = db.query(_ogrenciTablo, orderBy: '$_columnID DESC');
    return sonuc;
  }
  Future<int> ogrenciGuncelle(Ogrenci ogrenci) async{ //BURADA GÜNCELLENECEK ÖĞRENCİNİN KENDİNİSİNİ YOLLUYORUZ
    var db = await _getDatabase();
    var sonuc = db.update(_ogrenciTablo, ogrenci.toMap(), where: '$_columnID = ?', whereArgs: [ogrenci.id]);
    return sonuc;
  }
  Future<int> ogrenciSil(int id) async{ //BURADA İSE SİLİNECEK ÖĞRENCİNİN İDSİNİ YOLLUYORUZ BU DAHA PRATİK GİBİ
    var db = await _getDatabase();
    var sonuc = db.delete(_ogrenciTablo, where: '$_columnID = ?', whereArgs: [id]);
    return sonuc;
  }
  Future<int> tumOgrenciTablosunuSil() async{ //BURADA TABLO SİLİNMİYOR İÇİ BOŞALTILIYOR
    var db = await _getDatabase();
    var sonuc = db.delete(_ogrenciTablo);
    return sonuc;
  }
}