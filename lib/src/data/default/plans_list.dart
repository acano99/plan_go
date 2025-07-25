import 'package:plan_go/src/config/router/router.dart';
import 'package:plan_go/src/data/models/plan.dart';

final plansList = <Plan>[
  Plan(
    'Datos',
    'Comprar plan de datos',
    'assets/images/data_plan.png',
    AppRouter.data,
  ),
  Plan(
    'SMS',
    'Comprar plan de sms',
    'assets/images/mobile_sms_plan.png',
    AppRouter.sms,
  ),
  Plan(
    'Voz',
    'Comprar plan de voz',
    'assets/images/voice_plan.png',
    AppRouter.voice,
  ),
];
