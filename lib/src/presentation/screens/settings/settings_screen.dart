import 'package:flutter/material.dart';
import 'package:plan_go/src/domain/services/theme_service.dart';
import 'package:plan_go/src/presentation/globals/global_provider.dart';
import 'package:plan_go/src/presentation/widgets/action_list_tile.dart';
import 'package:plan_go/src/presentation/widgets/card_container.dart';
import 'package:plan_go/src/presentation/widgets/theme_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final globalProvider = context.watch<GlobalProvider>();

    return Scaffold(
      appBar: ThemeAppBar(title: 'Ajustes', showSetting: false),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          CardContainer(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.color_lens_rounded,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                    Text(
                      'Apariencia',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                ActionListTile(
                  title: 'Tema',
                  subtitle: 'Cambie el tema de la aplicacion',
                  icon: globalProvider.theme == SelectedTheme.dark
                      ? Icons.dark_mode_rounded
                      : globalProvider.theme == SelectedTheme.automatic
                      ? Icons.invert_colors_on_rounded
                      : Icons.light_mode_rounded,
                  onTap: () {
                    showModalBottomSheet(
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 20,
                            vertical: 24,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 8,
                              children: [
                                ActionListTile(
                                  title: 'Modo Oscuro',
                                  subtitle: 'Establece el modo oscuro',
                                  icon: Icons.dark_mode_rounded,
                                  onTap: () async {
                                    await context
                                        .read<GlobalProvider>()
                                        .setTheme(SelectedTheme.dark);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                                Divider(),
                                ActionListTile(
                                  title: 'Modo Claro',
                                  subtitle: 'Establece el modo claro',
                                  icon: Icons.light_mode_rounded,
                                  onTap: () async {
                                    await context
                                        .read<GlobalProvider>()
                                        .setTheme(SelectedTheme.light);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                                Divider(),
                                ActionListTile(
                                  title: 'Automatico',
                                  subtitle:
                                      'Establece el tema segun el sistema',
                                  icon: Icons.invert_colors_on_rounded,
                                  onTap: () async {
                                    await context
                                        .read<GlobalProvider>()
                                        .setTheme(SelectedTheme.automatic);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      context: context,
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          CardContainer(
            child: Column(
              spacing: 4,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.share_rounded,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                    Text(
                      'Compartir',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                ActionListTile(
                  title: 'Compartir',
                  subtitle: 'Comparte el enlace de descarga de la aplicacion',
                  icon: Icons.share_rounded,
                  onTap: () => SharePlus.instance.share(
                    ShareParams(
                      text:
                          'PlanGo, tus consultas y compras nunca fueron tan faciles https://apklis.cu/application/com.example.plan_go',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          CardContainer(
            child: Column(
              spacing: 8,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.help_rounded,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                    Text(
                      'Acerca de',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                ActionListTile(
                  title: 'Version',
                  subtitle: '2.0.0',
                  icon: Icons.android_rounded,
                ),
                /*Divider(),
                ActionListTile(
                  title: 'Desarrollado por',
                  subtitle: 'Informacion sobre el desarrollador',
                  icon: Icons.people_alt_rounded,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              'Abrahan Cano',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.primary,
                              ),
                            ),
                            Text(
                              'Creador, desarrollador y disennador de la aplicacion',
                              style: TextStyle(color: colorScheme.secondary),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                SocialButton(
                                  onPressed: () {},
                                  imagePath: 'assets/drawable/ic_facebook.png',
                                ),
                                SocialButton(
                                  onPressed: () {},
                                  imagePath: 'assets/drawable/ic_whatsapp.png',
                                ),
                                SocialButton(
                                  onPressed: () {},
                                  imagePath: 'assets/drawable/ic_telegram.png',
                                ),
                                SocialButton(
                                  onPressed: () {},
                                  imagePath: 'assets/drawable/ic_github.png',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
