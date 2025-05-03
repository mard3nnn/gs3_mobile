import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gs3_app/core/utils/app_responsivity.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/login/data/constants.dart';
import 'package:gs3_app/modules/login/presentation/components/login_button.dart';
import 'package:gs3_app/modules/login/vm/login_viewmodel.dart';

import '../../home/routes/home_routes.dart';
import 'components/login_bottom_card.dart';
import 'components/login_form.dart';

class LoginPresentation extends StatelessWidget {
  const LoginPresentation({super.key});

  LoginViewModel get vm => inject<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox.shrink(),
              SvgPicture.asset('assets/images/gs3_logo.svg'),
              LoginButton(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: context.responsivePct(.8),
                        width: MediaQuery.of(context).size.width,
                        child: const LoginForm(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.only(left: 24),
                height: 100,
                child: ListView.builder(
                  itemCount: LoginConstants.bottomCards.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final card = LoginConstants.bottomCards[index];

                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: LoginBottomCard(
                        title: card['title'],
                        icon: card['icon'],
                        onTap: () => router.navigateTo(
                          context,
                          HomeRoutesPath.home.path,
                          clearStack: true,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
