import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

//import component
import 'package:apparelist/components/horizontal_listview.dart';
import 'package:apparelist/components/products.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/car/c1.png'),
          AssetImage('images/car/c2.png'),
          AssetImage('images/car/c3.png'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(
          milliseconds: 1000,
        ),
        dotSize: 6.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Apparelist'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("User"),
              accountEmail: Text("Email"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.deepPurple),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.deepPurpleAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person, color: Colors.deepPurpleAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading:
                    Icon(Icons.shopping_basket, color: Colors.deepPurpleAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.dashboard, color: Colors.deepPurpleAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favorite"),
                leading: Icon(Icons.favorite, color: Colors.deepPurpleAccent),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carouse
          image_carousel,
          //padding
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Categories"),
          ),
          //horiontal list
          HorizontalList(),
          //padding
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Text("Products"),
          ),
          //gridview
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
