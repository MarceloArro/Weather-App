import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/domain/model/product_cart.dart';
import 'package:weather_flutter/presentation/common/delivery_button.dart';
import 'package:weather_flutter/presentation/common/theme.dart';

import '../home_bloc.dart';
import 'cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CartBLoC>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
        ),
      ),
      body: bloc.totalItems == 0 ? EmptyCart() : _FullCart(),
    );
  }
}

class _FullCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CartBLoC>();
    final total = bloc.totalPrice.toStringAsFixed(2);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: bloc.cartList.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 230,
              itemBuilder: (context, index) {
                final productCart = bloc.cartList[index];
                return _ShoppingCartProduct(
                  productCart: productCart,
                  onDelete: () {
                    bloc.deleteProduct(productCart);
                  },
                  onIncrement: () {
                    bloc.increment(productCart);
                  },
                  onDecrement: () {
                    bloc.decrement(productCart);
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).canvasColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub total',
                              style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            ),
                            Text(
                              '0.0 usd',
                              style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            ),
                            Text(
                              'Free',
                              style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Text(
                              '\$$total USD',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  DeliveryButton(
                    text: 'Checkout',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct({
    Key key,
    this.productCart,
    this.onDelete,
    this.onDecrement,
    this.onIncrement,
  }) : super(key: key);
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final product = productCart.product;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name),
                        const SizedBox(height: 10),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: DeliveryColors.lightGrey,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: onDecrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DeliveryColors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: DeliveryColors.purple,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  productCart.quantity.toString(),
                                ),
                              ),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DeliveryColors.purple,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${product.price} ',
                                style: TextStyle(
                                  color: DeliveryColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/delivery/sad.png',
            height: 90,
          ),
          const SizedBox(height: 20),
          Text(
            'There are no products',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          const SizedBox(height: 20),
          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: DeliveryColors.purple,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Go shopping',
                  style: TextStyle(
                    color: DeliveryColors.white,
                  ),
                ),
              ),
              onPressed: () {
                final homeBloc = context.read<HomeBLoC>();
                homeBloc.updateIndexSelected(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
