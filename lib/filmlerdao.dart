

import 'package:untitled51/kategoriler.dart';
import 'package:untitled51/yonetmenler.dart';

import 'VeritabaniYardimcisi.dart';
import 'filmler.dart';

class filmlerdao
{

  Future <List<filmler>> tumFilmler () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler, kategoriler, yonetmenler WHERE filmler.kategori_id=kategoriler.kategori_id AND filmler.yonetmen_id=yonetmenler.yonetmen_id ");
    
    return List.generate(maps.length, (index){

      var satir = maps[index];

      
      var k = kategoriler(satir["kategori_id"], satir["kategori_ad"] );
      var y = yonetmenler(satir["yonetmen_id"],satir["yonetmen_ad"] );
      
      return filmler(satir["film_id"],satir["film_ad"] , satir["film_yil"], satir["film_resim"],k , y);
    });
  }



}