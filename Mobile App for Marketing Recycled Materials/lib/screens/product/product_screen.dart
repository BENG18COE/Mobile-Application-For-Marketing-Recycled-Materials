import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/blocs/blocls.dart';
import 'package:trial/models/models.dart';
import 'package:trial/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen[900],
        child: Container(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddProductToWishlist(product));
                    final snackBar =
                        SnackBar(content: Text('added to your Wishlist'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 35,
                  ),
                );
              }),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    context.read<CartBloc>().add(AddProduct(product));
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Text(
                    'ADD TO CARD',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.lightGreen[900]!.withAlpha(50),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.lightGreen[900],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Tsh${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    '${product.description} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
