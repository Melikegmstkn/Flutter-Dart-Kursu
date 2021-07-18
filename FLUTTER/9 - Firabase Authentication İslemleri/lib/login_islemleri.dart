import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class LoginIslemleri extends StatefulWidget {
  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Kullanıcı oturumunu kapattı veya yok');
      } else {
        if (user.emailVerified) {
          print('Kullanıcı oturum açtı ve emaili onaylı');
        } else {
          print('Kullanıcı oturum açtı ve emaili onaylı değil');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Islemleri"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                child: Text("Email/Sifree User Create"),
                color: Colors.blueAccent,
                onPressed: _emailSifreKullaniciOlustur),
            RaisedButton(
                child: Text("Email/Sifree User LogIn"),
                color: Colors.greenAccent,
                onPressed: _emailSifreKullaniciGirisYap),
            RaisedButton(
                child: Text("Şifremi Unuttum"),
                color: Colors.pinkAccent,
                onPressed: _resetPassword),
            RaisedButton(
                child: Text("Şifremi Güncelle"),
                color: Colors.purpleAccent,
                onPressed: _updatePassword),
            RaisedButton(
                child: Text("Email Güncelle"),
                color: Colors.brown,
                onPressed: _updateEmail),
            RaisedButton(
                child: Text("Gmail ile Giriş"),
                color: Colors.tealAccent,
                onPressed: _googleIleGiris),
            RaisedButton(
                child: Text("Telefon No ile Giriş"),
                color: Colors.tealAccent,
                onPressed: _telNoGiris),
            RaisedButton(
                child: Text("Çıkış Yap"),
                color: Colors.yellowAccent,
                onPressed: _cikisYap),
          ],
        ),
      ),
    );
  }

  Future<UserCredential?> _googleIleGiris() async {
    try {
      //Kimlik doğrulama akışını tetikleyin
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Yetkilendirme ayrıntılarını istekten alın
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      //Yeni bir kimlik bilgisi oluşturun
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //Oturum açtıktan sonra UserCredential'ı iade edin
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint("gmail girişi hata $e");
    }
  }

  void _emailSifreKullaniciOlustur() async {
    String _email = "mlkgmstkn5@gmail.com";
    String _password = "guncelSifre"; //sifre güncellenince değiştirdimk

    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      User? _yeniUser = _credential.user;
      await _yeniUser!.sendEmailVerification();
      if (_auth.currentUser != null) {
        debugPrint("Size bir mail attık lütfen onaylayın");
        await _auth.signOut();
        debugPrint("Kullanıcıyı sistemden attık");
      }
      debugPrint(_yeniUser.toString());
    } catch (e) {
      debugPrint("***************** HATA VAR ****************");
      debugPrint(e.toString());
    }
  }

  void _emailSifreKullaniciGirisYap() async {
    String _email = "mlkgmstkn5@gmail.com";
    String _password = "guncelSifre";

    try {
      if (_auth.currentUser == null) {
        User? _oturumAcanUser = (await _auth.signInWithEmailAndPassword(
                email: _email, password: _password))
            .user;

        if (_oturumAcanUser!.emailVerified) {
          debugPrint("Mail onaylı ana sayfaya gidebilir");
        } else {
          debugPrint("Lütfen mailinizi onaylayıp tekrar giriş yapın");
          _auth.signOut();
        }
      } else {
        debugPrint("Oturum açmış kullanıcı zaten var");
      }
    } catch (e) {
      debugPrint("***************** HATA VAR ****************");
      debugPrint(e.toString());
    }
  }

  void _cikisYap() async {
    if (_auth.currentUser != null) {
      await _auth.signOut();
    } else {
      debugPrint("Zaten oturum açmış bir kullanıcı yok");
    }
  }

  void _resetPassword() async {
    String _email = "mlkgmstkn5@gmail.com";

    try {
      await _auth.sendPasswordResetEmail(email: _email);
      debugPrint("Resetleme maili gönderildi");
    } catch (e) {
      debugPrint("Şifre resetlenirken hata $e");
    }
  }

  void _updatePassword() async {
    try {
      await _auth.currentUser!.updatePassword("guncelSifre");
      debugPrint("Şifreniz güncellendi");
    } catch (e) {
      try {
        //kullanıcıdan eski oturum bilgileri girmesi istenir
        String email = 'mlkgmstkn5@gmail.com';
        String password = 'guncelSifre';

        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(credential);

        //güncel email ve şifre bilgisi dogruysa eski şifresi yenisiyle güncellenir.
        debugPrint("Girilen eski email şifre bilgisi dogru");
        await _auth.currentUser!.updatePassword("guncelSifre");
        debugPrint("Auth yeniden saglandı, şifre de güncellendi");
      } catch (e) {
        debugPrint("hata çıktı $e");
      }

      debugPrint("şifre güncellenirken hata çıktı $e");
    }
  }

  void _updateEmail() async {
    try {
      await _auth.currentUser!.updateEmail("guncellenmis5@gmail.com");
      debugPrint("Enailiniz güncellendi");
    } on FirebaseAuthException catch (e) {
      try {
        //kullanıcıdan eski oturum bilgileri girmesi istenir
        String email = 'mlkgmstkn5@gmail.com';
        String password = 'guncelSifre';

        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(credential);

        //güncel email ve şifre bilgisi dogruysa eski şifresi yenisiyle güncellenir.
        debugPrint("Girilen eski email şifre bilgisi dogru");
        await _auth.currentUser!.updateEmail("melike@gmstkn.com");
        debugPrint("Auth yeniden saglandı, mail de güncellendi");
      } catch (e) {
        debugPrint("hata çıktı $e");
      }

      debugPrint("Email güncellenirken hata çıktı $e");
    }
  }

  void _telNoGiris() async {
    //test no : +90 597 315 25 60
    //test id : 190560
    await _auth.verifyPhoneNumber(
      phoneNumber: '+90 543 788 79 24',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("verfication failed hata : $e");
      },
      codeSent: (String verificationId, int? resendToken) async {
        debugPrint("kod yollandı");

        try {
          String smsCode = '190560';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await _auth.signInWithCredential(phoneAuthCredential);
        } catch (e) {
          debugPrint("kod hata : $e");
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("timeouta düştü");
      },
    );
  }
}
