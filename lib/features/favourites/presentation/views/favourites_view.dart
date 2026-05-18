import 'package:flutter/material.dart';
import 'package:home_space/features/favourites/presentation/views/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  static const routeName = "FavouritesView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: FavouritesViewBody()));
  }
}
