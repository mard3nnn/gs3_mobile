import 'package:flutter/material.dart';
import 'package:gs3_app/design_system/components/components.dart';
import 'package:gs3_app/modules/home/presentation/components/home_card.dart';
import 'package:gs3_app/modules/home/presentation/components/home_top_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../data/constants/home_favorites_constants.dart';
import 'components/history/tile_history.dart';
import 'components/home_favorites_card.dart';

class HomePresentation extends StatelessWidget {
  const HomePresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromRGBO(65, 110, 180, 1),
            ],
            stops: [.3, .7],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const HomeTopBar(),
              Container(
                color: Colors.grey.shade400,
                margin: const EdgeInsets.only(right: 8, left: 8, top: 4),
                height: 1,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeCard(
                      changeBackground: !(index % 2 == 0),
                    );
                  },
                ),
              ),
              Container(
                height: 1,
                color: Colors.white.withOpacity(.5),
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTypography(
                      title: 'Meus favoritos',
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        AppTypography(
                          title: 'Personalizar',
                          fontSize: 8,
                        ),
                        Icon(
                          LucideIcons.layoutGrid,
                          size: 18,
                          color: Color.fromRGBO(33, 126, 185, 1.0),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, top: 16),
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomeFavoritesConstants.favorites.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Map<String, dynamic> favorite =
                          HomeFavoritesConstants.favorites[index];

                      return Container(
                        margin: const EdgeInsets.only(right: 32),
                        child: HomeFavoritesCard(
                          icon: favorite['icon'],
                          title: favorite['title'],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: const Color.fromRGBO(229, 229, 229, 1).withOpacity(.4),
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTypography(
                      title: 'Últimos lançamentos',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    Row(
                      children: [
                        AppTypography(title: 'Ver todos', fontSize: 8),
                        Icon(
                          LucideIcons.chevronRight,
                          color: Color.fromRGBO(40, 144, 207, 1),
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              TileHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
