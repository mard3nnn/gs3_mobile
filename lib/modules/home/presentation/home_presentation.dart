import 'package:flutter/material.dart';
import 'package:gs3_app/core/http/models/user_auth_data.dart';
import 'package:gs3_app/design_system/components/components.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/presentation/components/home_card.dart';
import 'package:gs3_app/modules/home/presentation/components/home_top_bar.dart';
import 'package:gs3_app/modules/home/vm/home_viewmodel.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../data/constants/home_favorites_constants.dart';
import '../data/mapper/remote/card_list_response.dart';
import '../data/mapper/remote/transaction_list_response.dart';
import 'components/history/tile_history.dart';
import 'components/home_favorites_card.dart';
import 'components/shimmer/home_card_shimmer.dart';
import 'components/shimmer/tile_history_shimmer.dart';
import 'home_favorites_presentation.dart';

class HomePresentation extends StatefulWidget {
  const HomePresentation({super.key});

  @override
  State<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends State<HomePresentation> {
  final HomeViewmodel vm = inject<HomeViewmodel>();
  final userData = inject<UserAuthData>();

  @override
  void initState() {
    vm.myCards();
    super.initState();
  }

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
              const SizedBox(height: 70),
              const HomeTopBar(),
              Container(
                color: Colors.grey.shade400,
                margin: const EdgeInsets.only(right: 8, left: 8, top: 4),
                height: 1,
              ),
              const SizedBox(height: 15),
              StreamBuilder<List<CardData>>(
                stream: vm.listCards,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<CardData>?> snapshot,
                ) {
                  final List<CardData>? cards = snapshot.data;

                  if (snapshot.data == null) {
                    return SizedBox(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return const HomeCardShimmer();
                        },
                      ),
                    );
                  }

                  return SizedBox(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cards!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final CardData card = cards[index];

                        return HomeCard(
                          changeBackground: !(index % 2 == 0),
                          name: card.cardName,
                          bankLimit: card.limit,
                          bestDayToBuy: card.bestPurchaseDay,
                          finalNumber: card.number,
                          onPressed: () async => vm.cardHistory(
                            cardId: card.id.toString(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              if (userData.permissions.isNotEmpty)
                Container(
                  height: 1,
                  color: Colors.white.withOpacity(.5),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
              if (userData.permissions.isNotEmpty)
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
              if (userData.permissions.isNotEmpty)
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

                        if (!userData.permissions
                            .contains(favorite['permission'])) {
                          return const SizedBox.shrink();
                        }

                        return Container(
                          margin: const EdgeInsets.only(right: 32),
                          child: HomeFavoritesCard(
                            icon: favorite['icon'],
                            title: favorite['title'],
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeFavoritesPresentation(
                                  menu: favorite['title'],
                                ),
                              ),
                            ),
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
              StreamBuilder<List<TransactionData>>(
                stream: vm.transactions,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      children: List.generate(
                        6,
                        (int index) => const TileHistoryShimmer(),
                      ),
                    );
                  }

                  final List<TransactionData> transactions = snapshot.data!;

                  if (transactions.isEmpty) {
                    return const AppTypography(
                      title: 'Nenhum histórico para este cartão.',
                    );
                  }

                  // Condição 3: lista com dados
                  final List<Widget> tiles = transactions
                      .map(
                        (transaction) =>
                            TileHistory(transactionData: transaction),
                      )
                      .toList();

                  return Column(children: tiles);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
