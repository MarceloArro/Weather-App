import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/repository/local_storage_repository.dart';
import 'package:weather_flutter/presentation/common/theme.dart';
import 'package:weather_flutter/presentation/provider/home/products/products_screen.dart';
import 'package:weather_flutter/presentation/provider/home/profile/profile_screen.dart';

import 'cart/cart_bloc.dart';
import 'cart/cart_screen.dart';
import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeBLoC(
            apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
            localRepositoryInterface: context.read<LocalRepositoryInterface>(),
          )..loadUser(),
          builder: (_, __) => const HomeScreen._(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected,
              children: [
                ProductsScreen.init(context),
                const Placeholder(),
                const CartScreen(),
                const Placeholder(),
                ProfileScreen.init(context),
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: bloc.indexSelected,
          ),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;

  _DeliveryNavigationBar({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    final cartBloc = Provider.of<CartBLoC>(context);
    final user = bloc.user;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      color: index == 0 ? DeliveryColors.green : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => bloc.updateIndexSelected(0),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.store,
                      color: index == 1 ? DeliveryColors.green : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => bloc.updateIndexSelected(1),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: DeliveryColors.purple,
                          radius: 23,
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_basket,
                              color: index == 2 ? DeliveryColors.green : DeliveryColors.white,
                            ),
                            onPressed: () => bloc.updateIndexSelected(2),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: cartBloc.totalItems == 0
                              ? const SizedBox.shrink()
                              : CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.pinkAccent,
                                  child: Text(
                                    cartBloc.totalItems.toString(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: index == 3 ? DeliveryColors.green : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => bloc.updateIndexSelected(3),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => bloc.updateIndexSelected(4),
                  child: user?.image == null
                      ? const SizedBox.shrink()
                      : Center(
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              user.image,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
