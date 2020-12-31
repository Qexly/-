import 'package:flutter/material.dart';
import 'package:for_krista_proj/models/Cart.dart';
import 'package:for_krista_proj/widgets/cart_list_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text('Корзнина напитков')
        ),
        body: cartData.cartItems.isEmpty ?
        Card(
          elevation: 5.0,
          margin: const EdgeInsets.all(30.0),
          child: Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('Корзина пуста'),
          ),
        )
            : Column(
          children: <Widget>[
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
                  style: TextStyle(fontSize: 15.0),
                ),
                MaterialButton(
                  child: Text('Произвести оплату'),
                  color: Theme.of(context).primaryColor,
                    onPressed: () {
                      cartData.clear();
                    },
                )
              ],
            ),
            Divider(),
            Expanded(
              child: CartItemList(cartData: cartData),
            )
          ],
        )
    );
  }
}
