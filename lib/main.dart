import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "GRID AND HERO", home: new Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperHero = [];

  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.jpg"},
    {"nama": "Batman", "gambar": "batman.jpg"},
    {"nama": "Captain Amerika", "gambar": "captain.jpg"},
    {"nama": "Catwoman", "gambar": "catwomen.jpg"},
    {"nama": "Flash", "gambar": "flash.jpg"},
    {"nama": "Hulk", "gambar": "hulk.jpg"},
    {"nama": "Iron Man", "gambar": "iron.jpg"},
    {"nama": "Spiderman", "gambar": "spiderman.jpg"},
    {"nama": "Venom", "gambar": "venom.jpg"},
    {"nama": "Superman", "gambar": "superman.jpg"},
  ];

  _buatList() async {
    for (var i = 0; i < karakter.length; i++) {
      final character = karakter[i];
      final String image = character["gambar"].toString();
      final name = character["nama"];
      daftarSuperHero.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              Expanded(child:
              new Hero(
                  tag: name.toString(),
                  child: Material(
                    child: new InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                    name: name.toString(),
                                    image: image,
                                  ))),
                      child: new Image.asset(
                        "img/$image",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new Text(
                    character["nama"].toString(),
                    style: new TextStyle(fontSize: 18.0),
                  )),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _buatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Super Hero",
          style: new TextStyle(color: Colors.blue),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({required this.name, required this.image});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
                tag: name,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$image",
                      // fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          new BagianNama(
            nama: name,
          ),
          new BagianIcon(),
          new Keterangan()
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({required this.nama});
  final String nama;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                )
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Row(
      children: <Widget>[
        new Icontext(
          icon: Icons.call,
          text: "Call",
        ),
        new Icontext(icon: Icons.message, text: "Message"),
        new Icontext(icon: Icons.photo, text: "Photo"),
      ],
    ));
  }
}

class Icontext extends StatelessWidget {
  Icontext({required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            text,
            style: new TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Card(
          child: new Padding(
        padding: EdgeInsets.all(10.0),
        child: new Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: new TextStyle(fontSize: 18.0),
          textAlign: TextAlign.justify,
        ),
      )),
    );
  }
}
