import '../../config/router/router.dart';
import '../models/plan.dart';

final utilitiesList = <Plan>[
  Plan(
    'Transferir Saldo',
    'Transfiere saldo a otras personas',
    'assets/images/data_plan.png',
    AppRouter.transfer,
  ),
  Plan(
    'Tarifa por Consumo',
    'Active o desactive la tarifa por consumo',
    'assets/images/mobile_sms_plan.png',
    AppRouter.sms,
  ),
  Plan(
    'Plan Amogos',
    'Gestione su plan de amigos',
    'assets/images/voice_plan.png',
    AppRouter.voice,
  ),
];
