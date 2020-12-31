import 'dart:collection';
import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final int countNum;
  final num price;
  final String imgUrl;

  Cart({
    @required this.id,
    @required this.title,
    @required this.countNum,
    @required this.price,
    @required this.imgUrl
  });
}

class CartDataProvider with  ChangeNotifier {
  Map<String, Cart> _cartItems = {}; //Словарь

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems); //геттер словаря

  int get cartItemsCount => _cartItems.length;

  double get totalAmount { //считаю сумму корзины
    var total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.countNum;
    });

    return total;
  }

  void addItem({productId, price,  title, imgUrl}) {
    if (_cartItems.containsKey(productId)) { //Если есть продукт с таким ключем в словаре
      _cartItems.update(productId, (obj) => Cart(
          id: obj.id,
          title: obj.title,
          countNum: obj.countNum + 1,
          price: obj.price,
          imgUrl: obj.imgUrl,
      ));
    } else { // или добавить новое значение, если его там нет
      _cartItems.putIfAbsent(productId, () =>  Cart(
        id: '${DateTime.now()}',
        title: title,
        countNum: 1,
        price: price,
        imgUrl: imgUrl,
      ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners(); //
  }

  void updateItemsAddOne(String productId) { //Добавить единицу товара по id
    _cartItems.update(
      productId,
          (ex) => Cart(
        id: ex.id,
        title: ex.title,
        price: ex.price,
        imgUrl: ex.imgUrl,
        countNum: ex.countNum + 1,
      ),
    );
    notifyListeners();
  }

  void updateItemsSubOne(String productId) { //Убрать одну еденицу товара по id
    if (_cartItems[productId].countNum < 2) {
      deleteItem(productId);
    } else {
      _cartItems.update(
        productId,
            (ex) => Cart(
          id: ex.id,
          title: ex.title,
          price: ex.price,
          imgUrl: ex.imgUrl,
          countNum: ex.countNum - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}