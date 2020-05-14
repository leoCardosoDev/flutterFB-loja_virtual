import 'package:flutter/material.dart';
import 'package:lojavirtualapp/tabs/home_tab.dart';
import 'package:lojavirtualapp/tabs/orders_tab.dart';
import 'package:lojavirtualapp/tabs/products_tab.dart';
import 'package:lojavirtualapp/widgets/cart_button.dart';
import 'package:lojavirtualapp/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Nossas Lojas'),
            centerTitle: true,
          ),
          body: Container(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Meus Pedidos'),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
