import 'package:fluro/fluro.dart';
import 'package:gs3_app/modules/home/routes/home_routes.dart';

import 'modules/login/routes/login_routes.dart';

void defineRouter(FluroRouter router) {
  router.define(
    LoginRoutesPath.login.path,
    handler: LoginRoutes.loginHandler,
  );
  router.define(
    HomeRoutesPath.home.path,
    handler: HomeRoutes.homeHandler,
  );
}
