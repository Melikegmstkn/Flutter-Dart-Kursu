import 'package:flutter/material.dart';

import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

import 'app/home_page.dart';
import 'app/signin/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _personModel = Provider.of<UserModel>(context);
    if (_personModel.person == null) return SignInPage();
    return HomePage(person: _personModel.person);
  }
}
