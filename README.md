# Taxi

Passo-a-passo para desenvolver um app tipo *Uber* no *Flutter*. Este app será para os motoristas.

## Estrutura do Projeto

O nosso projeto *Flutter* irá possuir esta estrutura:
```
taxi_driver
 |-android
 | |-app
 | | |-src
 | | | |-debug
 | | | |  |-AndroidManifest.xml 
 | | | |-main
 | | | |  |-java
 | | | |  |  |- io.flutter.plugins
 | | | |  |       |-GeneratedPluginRegistrant.java 
 | | | |  |-kotlin
 | | | |  |  |-com.example.taxidriver
 | | | |  |     |-MainActivity.kt
 | | | |  |-res
 | | | |  |  |-drawable
 | | | |  |  |   |-launch_background.xml
 | | | |  |  |-mipmap-hdpi
 | | | |  |  |  |-ic_launcher.png
 | | | |  |  |-mipmap-mdpi
 | | | |  |  |  |-ic_launcher.png
 | | | |  |  |-mipmap-xhdpi
 | | | |  |  |  |-ic_launcher.png
 | | | |  |  |-mipmap-xxhdpi
 | | | |  |  |  |-ic_launcher.png
 | | | |  |  |-mipmap-xxxhdpi
 | | | |  |  |  |-ic_launcher.png
 | | | |  |  |-values
 | | | |  |  |  |-styles.xml
 | | | |  |  |-AndroidManifest.xml
 | | | |-profile
 | | | |  |-AndroidManifest.xml
 | | |-build.gradle
 | |-gradle
 | |  |-wrapper
 | |  |  |-gradle-wrapper.jar
 | |  |  |-gradle-wrapper.properties
 | |-.gitignore
 | |-build.gradle
 | |-gradle.properties
 | |-gradlew
 | |-gradlew.bat
 | |-local.properties
 | |-settings.gradle
 | |-taxidriver_android.iml
 |-ios
 | |-Flutter
 | |  |-AppFrameworkInfo.plist
 | |  |-Debug.xcconfig
 | |  |-flutter_export_environment.sh
 | |  |-Generated.xcconfig
 | |  |-Release.xcconfig
 | |-Runner
 | |  |-Assets.xcassets
 | |  |  |-AppIcon.appiconset
 | |  |  |   |-Contents.json
 | |  |  |   |-Icon-App-20x20@1x.png
 | |  |  |   |-Icon-App-20x20@2x.png
 | |  |  |   |-Icon-App-20x20@3x.png
 | |  |  |   |-Icon-App-29x29@1x.png
 | |  |  |   |-Icon-App-29x29@2x.png
 | |  |  |   |-Icon-App-29x29@3x.png
 | |  |  |   |-Icon-App-40x40@1x.png
 | |  |  |   |-Icon-App-40x40@2x.png
 | |  |  |   |-Icon-App-40x40@3x.png
 | |  |  |   |-Icon-App-60x60@2x.png
 | |  |  |   |-Icon-App-60x60@3x.png
 | |  |  |   |-Icon-App-76x76@1x.png
 | |  |  |   |-Icon-App-76x76@2x.png
 | |  |  |   |-Icon-App-83.5x83.5@2x.png
 | |  |  |   |-Icon-App-1024x1024@1x.png
 | |  |  |-LaunchImage.imageset
 | |  |  |  |-Contents.json
 | |  |  |  |-LaunchImage.png
 | |  |  |  |-LaunchImage@2x.png
 | |  |  |  |-LaunchImage@3x.png
 | |  |  |  |-README.md
 | |  |-Base.Iproj
 | |  |  |-LaunchScreen.storyboard
 | |  |  |-Main.storyboard
 | |  |-AppDelegate.swift
 | |  |-GeneratedPluginRegistrant.h
 | |  |-GeneratedPluginRegistrant.m
 | |  |-Info.plist
 | |  |-Runner-Bridging-Header.h
 | |-Runner.xcodeproj
 | |  |-project.xcworkspace
 | |  |   |-contents.xcworkspacedata
 | |  |-xcshareddata
 | |  |  |-xcschemes
 | |  |  |  |-Runner.xcscheme
 | |  |  |-project.pbxproj
 | |  |-project.pbxproj
 | |-Runner.xcworkspace
 | |  |-contents.xcworkspacedata
 | |-.gitignore
 |-lib
 | |-main.dart
 |-test
 | |-widget_test.dart
 |-.gitignore
 |-.metadata
 |-.packages
 |-pubspec.lock
 |-pubspec.yaml
 |-README.md
 |-taxidriver.iml
```
## Dependências 

Primeiramente, vamos em `pubspec.yaml` e chamaremos o `google_maps_flutter`
```
dependencies:
  flutter:
    sdk: flutter
  google_maps_flutter: ^0.5.7 # Adicione esta linha
  
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
```
Feito isso podemos clicar em `Pub get` para instalar os novos pacotes referênciados.

## API 

Vamos em [Google Cloud Platform](href="https://cloud.google.com/console/google/maps-apis/overview"), se necessario crie um novo projeto, ou use um já existente.

Na opção do menu vamos em credencias, se tudo estive correto vamos usar uma api gerada para ser usada neste [tutorial do flutter](https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/#0). No meu caso vou usar a API já configurada.

Com a API em mãos vamos em `taxi_driver/ android/ app/ src / main / AndroidManifest.xml` e adicionaremos a linha
```
<meta-data android:name="com.google.android.geo.API_KEY" android:value="O VALOR DA SUA API"/>
```
E em `taxi_driver/ios/Runner/AppDelegate.swift` adicionaremos a seguinte linha
```
GMSServices.provideAPIKey("O VALOR DA SUA API AQUI")
```
**NOTA:** Não vou testar este aplicativo na plataforma IOS, entretanto, adicionando esta linha ao `AppDelegate.swift` já é meio caminho andado:)

## Interface Do Usuario

Depois de tudo configurado dentro de `taxi_driver/lib/` vamos criar uma pasta chamada `ui` com os seguintes documentos
```
taxi_driver
 |-android
 |-ios
 |-lib
 |  |-ui
 |  |  |-account.dart
 |  |  |-earnings.dart
 |  |  |-earnings_details.dart
 |  |  |-home.dart
 |  |  |-notifications.dart
 |  |  |-profile.dart
 |  |  |-promotions.dart
 |  |  |-recent_transactions.dart
 |  |-main.dart
 
 ...
 
 ```

Em `account.dart` colocamos o seguinte codigo
```
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountView();
  }
}

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Account"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text("Documents", style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.note,
              color: Colors.grey,
              size: 30,
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text("Perks", style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 30,
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text("Ensurance", style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.security,
              color: Colors.grey,
              size: 30,
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text("App Settings", style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.settings,
              color: Colors.grey,
              size: 30,
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            title: Text("About", style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.info,
              color: Colors.grey,
              size: 30,
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
          ),
          Divider(),
        ],
      ));
  }
}
```
Como em `cshtml`, nós não vemos as telas, entretanto conhecendo cada `Widget`podemos prever como vai ficar. Na tela `account` o que temos entre cada linha um divisor. Estas linhas são os `ListTile()`, enquanto que o `Divider()` gera uma linha horizontal fina, com preenchimento de ambos os lados. Nesta tela teremos as opções para alterar o registro do motorista e as configurções do app.

Em `earnings.dart` vamos colocar o seguinte codigo
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EarningsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EarningsView();
  }
}

class EarningsView extends StatefulWidget {
  @override
  _EarningsViewState createState() => _EarningsViewState();
}

const kExpandedHeight = 300.0;

class _EarningsViewState extends State<EarningsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: 560,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: ()=> Navigator.pop(context),
                            icon: Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Earnings",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "This week",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "\$6.60",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 11,
                      offset: Offset(3.0, 4.0))
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/earning_details"),
                        title: Text("Earning Details", style: TextStyle(fontSize: 20)),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Sep 17 - Sep 24", style: TextStyle(fontSize: 16))),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                          child: Icon(
                            Icons.lightbulb_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/recent_transations"),
                        title: Text("Recent transactions", style: TextStyle(fontSize: 20)),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("\$6.60 balance", style: TextStyle(fontSize: 16))),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                          child: Icon(
                            Icons.lightbulb_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/promotions"),
                        title:
                            Text("Promotions", style: TextStyle(fontSize: 20)),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("See what's available", style: TextStyle(fontSize: 16))),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                          child: Icon(
                            Icons.lightbulb_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
Neste codigo se atente ao `Navigator.pushNamed(context, routeName)` pois é dessa forma que será chamada outras quando o usuario tocar em um `ListTile()`, `Padding()`, `Row()`, `Align()` etc. Nesta tela teremos os ganhos de forma enxuta do motorista.

Em `earnings_datails.dart` colocaremos o seguinte codigo
```
import 'package:flutter/material.dart';

class EarningsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return EarningsDetailsView();
  }
}

class EarningsDetailsView extends StatefulWidget {
  @override
  _EarningsDetailsViewState createState() => _EarningsDetailsViewState();
}

class _EarningsDetailsViewState extends State<EarningsDetailsView> {
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
        title: Text("Weekly"),
      ),
      body: ListView(
        children: <Widget>[
        ],
      ),
    );
  }
}
```
Esta tela está incompleta, entretanto é aqui que os detalhes dos ganhos de cada motorista irá ficar.
```
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  PolylineId selectedPolyline;

  // Values when toggling polyline color
  int colorsIndex = 0;
  List<Color> colors = <Color>[
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.pink,
  ];

  // Values when toggling polyline width
  int widthsIndex = 0;
  List<int> widths = <int>[10, 20, 5];

  int jointTypesIndex = 0;
  List<JointType> jointTypes = <JointType>[
    JointType.mitered,
    JointType.bevel,
    JointType.round
  ];

  // Values when toggling polyline end cap type
  int endCapsIndex = 0;
  List<Cap> endCaps = <Cap>[Cap.buttCap, Cap.squareCap, Cap.roundCap];

  // Values when toggling polyline start cap type
  int startCapsIndex = 0;
  List<Cap> startCaps = <Cap>[Cap.buttCap, Cap.squareCap, Cap.roundCap];

  // Values when toggling polyline pattern
  int patternsIndex = 0;
  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[],
    <PatternItem>[
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)],
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)],
  ];

  //GoogleMapController _mapController;

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913025, 13.202462),
    zoom: 17.0,
  );

  @override
  void initState() {
    //_mapController.mar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 11, offset: Offset(3.0, 4.0))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(padding: EdgeInsets.only(left: 20),child: Icon(Icons.keyboard_arrow_up)),
            Text("You're offline", style: TextStyle(fontSize: 30,)),
            Container(padding: EdgeInsets.only(right: 20),child: Icon(Icons.list)),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      bottomSheet: Container(
        height: 300,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            polylines: Set<Polyline>.of(polylines.values),
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              //_initCameraPosition();
            },
          ),
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FunctionalButton(
                      icon: Icons.search,
                      title: "",
                      onPressed: () {},
                    ),
                    PriceWidget(
                      price: "0.00",
                      onPressed: () {},
                    ),
                    ProfileWidget(onPressed: () => Navigator.pushNamed(context, '/notifications'),),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FunctionalButton(
                      icon: Icons.security,
                      title: "",
                      onPressed: () {},
                    ),
                    TaxiButton(
                      title: "Go",
                      onPressed: () {},
                    ),
                    Container(
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FunctionalButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.black,
          fillColor: Colors.white,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Icon(
                widget.icon,
                size: 30.0,
                color: Colors.black,
              )),
        ),
      ],
    );
  }
}

class ProfileWidget extends StatefulWidget {
  final Function() onPressed;

  const ProfileWidget({Key key, this.onPressed}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 4),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 11, offset: Offset(3.0, 4.0))
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            "assets/img/user_profile.jpg",
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class PriceWidget extends StatefulWidget {
  final String price;
  final Function() onPressed;

  const PriceWidget({Key key, this.price, this.onPressed}) : super(key: key);

  @override
  _PriceWidgetState createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 4),
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 11, offset: Offset(3.0, 4.0))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("\$",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
          Text(widget.price,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class TaxiButton extends StatefulWidget {
  final String title;
  final Function() onPressed;

  const TaxiButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  _TaxiButtonState createState() => _TaxiButtonState();
}

class _TaxiButtonState extends State<TaxiButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 10),
              shape: BoxShape.circle),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
            child: RawMaterialButton(
              onPressed: widget.onPressed,
              splashColor: Colors.black,
              fillColor: Colors.blue,
              elevation: 15.0,
              shape: CircleBorder(),
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28))),
            ),
          ),
        ),
      ],
    );
  }
}
```
Está é a tela principal do motorista, onde aparecerá o mapa, chamados, o preço da viagem aceitada é um botão onde ele irá aceitar a viagem que for surgir na tela. Enquanto que na parte inferior da tela teremos um `bottomNavigationBar` onde deverá aparecer a categoria que o motorista irá trabalhar (requisito a ser discutido), porém irá aparecer "Você está offline!" quando o motorista estiver sem conexão. Um detalhe a ser observado no codigo acima, é que nele temos um exemplo de como criar os nossos proprios botôes.

Em `notifications.dart` colocaremos o seguinte codigo
```
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationsView();
  }
}

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

const kExpandedHeight = 300.0;

class _NotificationsViewState extends State<NotificationsView> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: kExpandedHeight,
                floating: false,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.black,
                leading: GestureDetector(
                  child: IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(Icons.close, size: 28, color: Colors.white),
                  ),
                ),
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "HELP",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(Icons.help, size: 28, color: Colors.white),
                    ],
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: <Widget>[
                      Container(
                        height: 300,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FunctionalButton(
                                  icon: Icons.attach_money,
                                  title: "Earnings",
                                  onPressed: () =>
                                      Navigator.pushNamed(context, "/earnings"),
                                ),
                                ProfileButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, "/profile"),
                                  icon: Icons.star,
                                  title: "Profile",
                                  rating: "4.88",
                                ),
                                FunctionalButton(
                                  icon: Icons.settings,
                                  title: "Account",
                                  onPressed: () =>
                                      Navigator.pushNamed(context, "/account"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Explore these safety features",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Free Instant Pay cashouts this week",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.warning,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Track your earnings",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Follow the opportunity",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Plan your day with ease the opportunity",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Your earnings are processed Tuesday at noon",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title:
                    Text("Welcome, Betsy", style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("9/17/18, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class FunctionalButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.black,
          fillColor: Colors.blue,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                widget.icon,
                size: 50.0,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class ProfileButton extends StatefulWidget {
  final String title, rating;
  final IconData icon;
  final Function() onPressed;

  const ProfileButton(
      {Key key, this.title, this.rating, this.icon, this.onPressed})
      : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/img/user_profile.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Positioned(
            left: 14,
            top: 75,
            child: Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.rating,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    widget.icon,
                    color: Colors.black,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```
Nesta tela teremos as notificações do motorista que o app ou algum usurio irá mandar, caso o motorista não veja logo de cara.

Em `profile.dart` teremos o seguinte codigo
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

const kExpandedHeight = 300.0;

class _ProfileViewState extends State<ProfileView> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: kExpandedHeight,
              floating: false,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.black,
              leading: GestureDetector(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit, size: 26, color: Colors.white),
                  onPressed: () {},
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 300,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: ProfileWidget(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/profile"),
                          icon: Icons.star,
                          name: "Betsy",
                          rating: "4.88",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "3,914",
                            style: TextStyle(
                              fontSize: 34,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Trips",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 1,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black12))),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "4",
                              style: TextStyle(
                                fontSize: 34,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Years",
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tell customers a little about yourself",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 60,
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                            border: Border.all(color:  Colors.blue, width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(const Radius.circular(4.0)),
                          ),
                          child: Text('ADD DETAILS',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Compliements",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "ViEW ALL",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                makeCompliementsList("Cool Car"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FunctionalButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key : key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.black,
          fillColor: Colors.blue,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Icon(
                widget.icon,
                size: 30.0,
                color: Colors.black,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class ProfileWidget extends StatefulWidget {
  final String name, rating;
  final IconData icon;

  final Function() onPressed;

  const ProfileWidget({Key key, this.name, this.rating, this.icon, this.onPressed}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/img/user_profile.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.rating,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      widget.icon,
                      color: Colors.black,
                      size: 22,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget makeCompliementsList(String title) {
  return Container(
    padding: EdgeInsets.only(left: 5, right: 5),
    height: 220,
    child: Column(
      children: <Widget>[
        Container(
          height: 200,
          child: ListView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            children: makeContainers(title),
          ),
        )
      ],
    ),
  );
}

int counter = 0;
List<Widget> makeContainers(String title) {
  List<Container> compliementsList = [];
  for (var i = 0; i < 6; i++) {
    counter++;
    compliementsList.add(Container(
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/img/logo.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ],
          ),
          Positioned(
            left: 68,
            top: -1,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Center(
                child: Text("1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    ));
    if (counter == 12) {
      counter = 0;
    }
  }
  return compliementsList;
}
```
Esta tela será o perfil do usuario, onde irá aparecer os elogios, nota, bio do motorista, viagens feitas, etc.

Em `promotions.dart` teremos o seguinte codigo
```
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
        children: <Widget>[
        ],
      ),
    );
  }
}
```
Assim como `earnings_details.dart` esta tela não esta completa, entretanto aqui teremos mensagens sobre promoções beneficas para os motoristas.

Em `recent_transactions.dart` teremos o seguinte codigo
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RecentTransactionsView();
  }
}

class RecentTransactionsView extends StatefulWidget {
  @override
  _RecentTransactionsViewState createState() => _RecentTransactionsViewState();
}

class _RecentTransactionsViewState extends State<RecentTransactionsView> {
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
        title:  Text("Activity"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Your Balance",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$6.60",
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(const Radius.circular(4.0)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            color:  Colors.white,
                            size: 40,
                          ),
                          Text('CASH OUT',
                              style: TextStyle(
                                color: Colors.white, fontSize: 24)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PAYMENT SCHEDULED: 9/24",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(26),
            width: double.infinity,
            color: Colors.black12,
            child: Text(
              "Posted",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Taxi Premium", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    Text("\$6.60", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Sep 19, 10:13 PM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    Text("\$6.60", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
```
Nesta tela irá aparecer a transações mais recentes feita pelo motorista.

Por fim, em `main.dart` colocaremos o seguinte codigo
```
import 'package:flutter/material.dart';
import 'package:taxidriver/ui/account.dart';
import 'package:taxidriver/ui/earnings.dart';
import 'package:taxidriver/ui/earnings_details.dart';
import 'package:taxidriver/ui/home.dart';
import 'package:taxidriver/ui/notifications.dart';
import 'package:taxidriver/ui/profile.dart';
import 'package:taxidriver/ui/promotions.dart';
import 'package:taxidriver/ui/recent_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Taxi'),
        '/notifications': (context) => NotificationsPage(),
        '/earnings': (context) => EarningsPage(),
        '/profile': (context) => ProfilePage(),
        '/earning_details': (context) => EarningsDetailPage(),
        '/recent_transations': (context) => RecentTransactionsPage(),
        '/promotions': (context) => PromotionsPage(),
        '/account': (context) => AccountPage(),
      },
    );
  }
}
```
Dessa forma, chamaremos e criaremos uma rota para o nosso app. E tambe usando `debugShowCheckedModeBanner: false` tiramos aquela bandeira chata escrito "Debug".

## Detalhe

Após testar o app, a imagem não estava aparecendo, procurei uma solução e no **Stackoverflow** tinha uma resposta dizendo para alterar o `pubspec.yaml` colocando
```
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  assets:
    - assets/img/user_profile.jpg
    - assets/img/logo.png
```
No proprio `pubspec.yaml` tem comentarios explicando sobre isso... Enfim, a imagem apareceu.

Entretando, ainda na resposta no **Stackoverflow** o usuario diz que se estiver usando `.jpg` trocar isso para `.jpeg` quando for chama-lo e também o comando que ele usada
é um pouco diferente do que a gente está usando, mas por via das duvidas fica registrado aqui
```
Image(image: AssetImage("assets/christmas.jpeg"),
```
Um pouco diferente do que a gente usa em nosso app
```
Image.asset("assets/img/user_profile.jpg", width: 60, height: 60, fit: BoxFit.cover,),
```












