import 'package:flutter/material.dart';
import 'package:for_krista_proj/models/Cart.dart';
import 'package:for_krista_proj/models/Product.dart';
import 'package:for_krista_proj/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {

  final String productId;

  ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<ProductDataProvider>(context).getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: GoogleFonts.marmelad(), ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
                tag: data.imgUrl,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data.imgUrl),
                        fit: BoxFit.cover,
                    ),
                  ),
                )
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(data.title, style: TextStyle(fontSize: 26.0),),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text('Цена: ', style: TextStyle(fontSize: 20.0),),
                        Text('${data.price}: ', style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                    Divider(),
                    Text(data.description),
                    SizedBox(
                      height: 20.0,
                    ),

                    Provider.of<CartDataProvider>(context).cartItems.containsKey(productId) ?
                        Column(
                          children: <Widget>[
                            MaterialButton(
                              color: Color(0xffccff90),
                                child: Text('Перейти в корзину'),
                                onPressed: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                  ))
                            }),
                            Text(
                              'Товар уже добавлен в корзину',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ):
                        MaterialButton(
                          color: Theme.of(context).primaryColor,
                          child: Text('Добавить в корзину'),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context, listen: false).addItem(
                                  productId: data.id,
                                  price: data.price,
                                  title: data.title,
                                  imgUrl: data.imgUrl
                              );
                            }
                        ),
                  ],
                ),
              ),
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),

            )
          ],
        ),
      )
    );
  }
}
