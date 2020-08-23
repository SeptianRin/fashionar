import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detail_try_link;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_old_price,
    this.product_detail_picture,
    this.product_detail_price,
    this.product_detail_try_link,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
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
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\$${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$${widget.product_detail_price}",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Text("Size"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Text("Color"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                    elevation: 0.2,
                    onPressed: () async {
                      var url = '${widget.product_detail_try_link}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: new Text("Try It")),
              ),
              Expanded(
                child: MaterialButton(
                    elevation: 0.2,
                    onPressed: () {},
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: new Text("Buy It")),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.deepPurple),
                  onPressed: null),
              new IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.deepPurple),
                  onPressed: null)
            ],
          )
        ],
      ),
    );
  }
}
