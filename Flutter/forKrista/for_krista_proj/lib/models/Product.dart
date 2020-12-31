import 'dart:collection';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imgUrl,
    @required this.color
  });
}

class ProductDataProvider with ChangeNotifier { //Список товаров
  List<Product> _items = [
    Product(
        id: 'p3',
        title: 'Солнечный ураган счастья',
        description: 'Супер описание этого сочного микса',
        price: 15.00,
        imgUrl:'https://www.recipetineats.com/wp-content/uploads/2019/09/Tequila-Sunrise.jpg',
        color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Весенний фрэш-бой',
      description: 'Супер описание этого сочного микса',
      price: 77.99,
      imgUrl: 'https://hg-images.condecdn.net/image/m9kmKQ4JKBn/crop/810/f/Turquoise-Tonic-house-29may15_pr_b.jpg' ,
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Смертельный дабл кап',
      description: 'Лучше не надо...',
      price: 99.99,
      imgUrl: 'https://minimalistbaker.com/wp-content/uploads/2012/08/Grown-Up-Watermelon-Limeades.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Зеленый подонок',
      description: ' Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 35.99,
      imgUrl: 'https://www.baconismagic.ca/wp-content/uploads/2018/02/Cuba-libre-cocktail-recipe-720x720.jpg',
      color: '0xFFCCFF90',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items); //геттер для списка

  Product getElementById(String id)
  => _items.singleWhere((value) => value.id == id); //Получить продукт по id

}