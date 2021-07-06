import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  TextFieldIslemleri({Key? key, required this.title}) : super(key: key);

  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController; //late kullanımı dartta var
  late FocusNode _focusNode; //
  int maxLineCount = 1;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose(); //controller yapıları bellekten silinmez
    _focusNode.dispose(); //silmek için dispose kullanırız
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode, //
              controller: _emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maxLineCount,
              maxLength: 20,
              onChanged: (String deger) {
                if (deger.length > 3) {
                  setState(() {
                    _emailController.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(offset: deger.length),
                    );
                  });
                }
              },
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                labelText: 'Label text',
                hintText: 'Email giriniz',
                //icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_alarms_outlined),
                filled: true,
                fillColor: Colors.orange.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
              ),
              onSubmitted: (String deger) {
                print("submit " + deger);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = 'melikegmstkn@gmail.com';
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

/* //ilk ders
class TextFieldDesigner extends StatelessWidget {
  final String title;
  TextFieldDesigner({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textFieldDesigner();
  }

  Widget textFieldDesigner() {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number, // alınacak veri tipi
              textInputAction: TextInputAction.next, //klavye işareti
              autofocus: true, // burdan başlaması için true
              maxLines: 1,
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'lbl text',
                hintText: 'e-mail giriniz',
                //icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_alarm),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              onChanged: (String deger) {
                //tıklanan tuş degerini terminale yazar
                if (deger.length > 3) print(deger);
              },
              onSubmitted: (String deger) {
                //yazılan veriyi terminale yazar
                print(deger);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType:
              TextInputType.number, //klavyede sadece rakamlar çıkar
              textInputAction:
              TextInputAction.next, // klavyedeki tamam iconunu değiştirir
            ),
          )
        ],
      ),
    );
  }
}
*/
