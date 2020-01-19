import 'package:provider/provider.dart';
import 'package:turf_management/core/services/api.dart';
import 'package:turf_management/core/services/authentication_services.dart';
import 'package:turf_management/core/services/dash_board_services.dart';
import 'package:turf_management/core/services/match_services.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];
List<SingleChildCloneableWidget> independentServices = [
  Provider.value(
    value: Api(),
  )
];
List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  ),
  ProxyProvider<Api, DashBoardService>(
    update: (context, api, dashBoardService) => DashBoardService(api: api),
  ),
  ProxyProvider<Api, MatchService>(
    update: (context, api, matchService) => MatchService(api: api),
  )
];
List<SingleChildCloneableWidget> uiConsumableProviders = [];
