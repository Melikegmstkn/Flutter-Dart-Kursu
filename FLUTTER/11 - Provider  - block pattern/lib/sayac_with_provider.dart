import 'package:flutter/material.dart';
import 'package:flutter_state/counter.dart';
import 'package:provider/provider.dart';

class ProviderlaSayacUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider ile Sayac App"),
      ),
      body: Center(
        child: MyColumn(),
      ),
      floatingActionButton: MyFloatingActionButtons(),
    );
  }
}

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("floating action button build");
    //var mySayac = Provider.of<Counter>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "1",
          onPressed: () {
            context.read<Counter>().arttir();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          heroTag: "2",
          onPressed: () {
            context.read<Counter>().azalt();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("mycolumn widget build");
    //var mySayac = Provider.of<Counter>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          context.watch<Counter>().sayac.toString(),
          style: TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
