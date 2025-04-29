import 'package:fluro/fluro.dart';

import 'modules/login/routes/login_routes.dart';

void defineRouter(FluroRouter router) {
  router.define(
    LoginRoutesPath.login.path,
    handler: LoginRoutes.loginHandler,
  );
}
