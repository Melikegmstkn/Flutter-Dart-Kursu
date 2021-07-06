import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  _TextFormFieldKullanimiState createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textform field kullanimi'),
      ),
      body: SingleChildScrollView(
        //alt alta textFormField kullanmak için SingleChildScrollView kullanıyrouz
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // validatorü ne zaman devreye sokacağını ayarlar. always ise hep kırmızı
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  //initialValue: 'melikegmstkn', //ilk deger
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: Colors.redAccent), //validator hata stili
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username',
                  ),
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  validator: (deger) {
                    //text kontrolu şart koyma
                    if (deger!.length < 4) {
                      return 'Username en az 4 karakter olmalı';
                    } else
                      return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  //initialValue: 'melike@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Email'),
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (deger) {
                    //emailValidator -> ___@___.com tipinde verileri kabul eder
                    if (deger!.isEmpty) {
                      return 'email boş olamaz';
                    } else if (!EmailValidator.validate(deger)) {
                      return 'Geçerli mail giriniz';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //initialValue: 'melike@gmail.com',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password'),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return 'Şifre ne az 6 karakter olmalı';
                    } else
                      return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      String result =
                          'username:$_userName\nemail:$_email\nSifre:$_password';

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orange.shade300,
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text('Onayla'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
