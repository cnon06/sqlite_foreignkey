import 'package:flutter/material.dart';
import 'package:untitled51/filmler.dart';
import 'package:untitled51/filmlerdao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future <void> filmleriGoster() async
  {
    var liste = await filmlerdao().tumFilmler();


    for(filmler k in liste)
    {
      print('Film Id: ${k.film_id} Film Adı: ${k.film_ad} Filmin resmi: ${k.film_resim} Yılı: ${k.film_yil} Kategori: ${k.kategori.kategori_ad} Yönetmen: ${k.yonetmen.yonetmen_ad}');
    }

    print('******************');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filmleriGoster();
    print('sdddfd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forein Key Project"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(onPressed: ()
                {
                  print('gghhglh');
                }, child: Text("Verileri Göster"))

          ],
        ),
      ),

    );
  }
}
