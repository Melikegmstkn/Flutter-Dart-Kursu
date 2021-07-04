import 'package:flutter/material.dart';

class ImageOrnekleri extends StatelessWidget {
  const ImageOrnekleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _imgURL =
        'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg';
    String _logoURL =
        'https://cdn.pixabay.com/photo/2018/07/08/14/16/cat-3523992_960_720.jpg';
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            //yükseklik degerlerini sabitler
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red.shade300,
                    child: Image.asset(
                      'assets/images/kedi.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red.shade300,
                    child: Image.network(
                      _imgURL,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text(
                          'MG',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        backgroundImage: NetworkImage(_logoURL),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/images/load.gif',
                image: _imgURL),
          ),

          //Placeholder() 	-> boş alan oluşturru o alana bir foto gelcek ama şimdi değil demek
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(
              color: Colors.blue,
            ),
          )),
        ],
      ),
    );
  }
}
