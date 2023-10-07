import 'package:flutter/material.dart';
import 'package:interstellar_insight/features/theme/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SettingHeader('Preferences'),
          const ThemeToggleTitle(),
          const SettingHeader('About'),
          SettingLinkTile(
            title: 'Source Code',
            subtitle: 'View the full source code on GitHub',
            onTap: () => launchUrlString(
              'https://github.com/eliascreates/interstellar_insight',
            ),
          ),
          SettingLinkTile(
            title: 'Licenses',
            subtitle: 'Licenses of libraries used',
            onTap: () => showLicensePage(
              context: context,
              applicationIcon:
                  Image.asset('assets/images/mooncake_icon.png', height: 120),
              applicationName: 'Interstellar Insight',
            ),
          ),
          SettingLinkTile(
            title: 'Portfolio',
            subtitle: 'Other apps I built',
            onTap: () => launchUrlString(
              'https://eliascreates.github.io/',
            ),
          ),
          SettingLinkTile(
            title: 'Developed by Elias kekana',
            subtitle: 'CS student',
            onTap: () => launchUrlString(
              'https://github.com/eliascreates',
            ),
          ),
        ],
      ),
    );
  }
}

class SettingHeader extends StatelessWidget {
  const SettingHeader(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = theme.textTheme.titleMedium?.copyWith(
      color: theme.unselectedWidgetColor,
      fontWeight: FontWeight.w500,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20),
      child: Text(text, style: headerStyle),
    );
  }
}

class SettingLinkTile extends StatelessWidget {
  const SettingLinkTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final void Function()? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        onTap: onTap,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: theme.brightness == Brightness.light
            ? theme.colorScheme.primaryContainer
            : null,
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
