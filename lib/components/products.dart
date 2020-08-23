import 'package:apparelist/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/car/c1.png",
      "old_price": 120,
      "price": 80,
      "try_link": "https://www.instagram.com/ar/509005743226323/",
    },
    {
      "name": "Red Dress",
      "picture": "images/car/c2.png",
      "old_price": 100,
      "price": 90,
      "try_link": "https://www.instagram.com/ar/1634239426713402",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
            prod_try_link: product_list[index]['try_link'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_try_link;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
    this.prod_try_link,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: prod_picture,
                        product_detail_price: prod_price,
                        product_detail_try_link: prod_try_link,
                      ))),
              child: GridTile(
                footer: Container(
                  color: Colors.white30,
                  child: ListTile(
                    leading: Text(
                      prod_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      "\$$prod_price",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      "\$$prod_old_price",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ),
                child: Image.asset(prod_picture, fit: BoxFit.cover),
              ),
            ),
          )),
    );
  }
}
