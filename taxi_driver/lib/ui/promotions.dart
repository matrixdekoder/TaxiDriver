import 'package:flutter/material.dart';

class PromotionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PromotionsView();
  }
}

class PromotionsView extends StatefulWidget {
  @override
  _PromotionsViewState createState() => _PromotionsViewState();
}

class _PromotionsViewState extends State<PromotionsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Promotions"),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
