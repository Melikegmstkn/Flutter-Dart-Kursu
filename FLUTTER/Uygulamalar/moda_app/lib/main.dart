import 'package:flutter/material.dart';

import 'detay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.transparent,
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.more,
                color: Colors.grey,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.grey,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.navigation,
                color: Colors.black,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.grey,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Moda Uygulaması",
          style: TextStyle(
              fontFamily: 'GenelYaziStili',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
            color: Colors.grey,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          ///Üst taraftaki Profil Listesi
          Container(
            height: 140,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                listeElemani(
                    'assets/images/bella.png', 'assets/images/pati.png'),
                SizedBox(width: 30),
                listeElemani(
                    'assets/images/calikusu.jpg', 'assets/images/pati.png'),
                SizedBox(width: 30),
                listeElemani(
                    'assets/images/kedi.jpg', 'assets/images/pati.png'),
                SizedBox(width: 30),
                listeElemani(
                    'assets/images/pati.png', 'assets/images/pati.png'),
                SizedBox(width: 30),
                listeElemani(
                    'assets/images/kedi.jpg', 'assets/images/pati.png'),
                SizedBox(width: 30),
                listeElemani(
                    'assets/images/kedi.jpg', 'assets/images/pati.png'),
              ],
            ),
          ),
          //Card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 4,
              //color: Colors.blue.shade300,
              child: Container(
                height: 600,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage('assets/images/calikusu.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: MediaQuery.of(context).size.width - 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Calıkusu",
                                style: TextStyle(
                                    fontFamily: 'GenelYaziStili',
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "30 mins ago",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.more_vert, color: Colors.black),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Bu elbiseler hem sık hem rahat. Denemeniz tavsiye edilir",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'GenelYaziStili',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Detay(
                                    imgPath: "assets/images/calikusuEtek.jpg"),
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'assets/images/calikusuEtek.jpg',
                            child: Container(
                              height: 300,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/calikusuSemsiye.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Detay(
                                        imgPath:
                                            "assets/images/calikusuTrenc.jpg"),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: "assets/images/calikusuTrenc.jpg",
                                child: Container(
                                  height: 150,
                                  width: (MediaQuery.of(context).size.width -
                                          100) /
                                      2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/calikusuTrenc.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Detay(
                                        imgPath:
                                            "assets/images/calikusuSapka.jpg"),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: "assets/images/calikusuSapka.jpg",
                                child: Container(
                                  height: 150,
                                  width: (MediaQuery.of(context).size.width -
                                          100) /
                                      2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/calikusuSapka.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              "# Calikusu",
                              style: TextStyle(
                                fontFamily: 'GenelYaziStili',
                                fontSize: 15,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 10),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              "# Fahriye Evcen",
                              style: TextStyle(
                                fontFamily: 'GenelYaziStili',
                                fontSize: 15,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    //Divider(),
                    //SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: Colors.brown.withOpacity(0.70),
                          size: 30,
                        ),
                        SizedBox(width: 3),
                        Text(
                          "1.7K",
                          style: TextStyle(
                            fontFamily: 'GenelYaziStili',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 30),
                        Icon(
                          Icons.comment,
                          color: Colors.brown.withOpacity(0.70),
                          size: 30,
                        ),
                        SizedBox(width: 3),
                        Text(
                          "325",
                          style: TextStyle(
                            fontFamily: 'GenelYaziStili',
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 235,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red.withOpacity(0.7),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "2.3K",
                                style: TextStyle(
                                  fontFamily: 'GenelYaziStili',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listeElemani(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  image: DecorationImage(
                      image: AssetImage(logoPath), fit: BoxFit.contain),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.brown),
          child: Center(
            child: Text(
              "Follow",
              style: TextStyle(
                  fontFamily: 'GenelYaziStili',
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
