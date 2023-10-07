import 'package:flutter/material.dart';
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
      appBar: AppBar(),
      body: ListView(
        children: const [
          SettingHeader('Preferences'),
          ThemeToggleTitle(title: 'Light Theme'),
          SettingHeader('About'),
          SettingLinkTile(
            title: 'Source Code',
            subtitle: 'View the full source code on GitHub',
            urlString: 'https://github.com/eliascreates/interstellar_insight',
          ),
          SettingLinkTile(
            title: 'Portfolio',
            subtitle: 'Other apps I built',
            urlString: 'https://eliascreates.github.io/',
          ),
          SettingLinkTile(
            title: 'Developed by Elias kekana',
            subtitle: 'CS student',
            urlString: 'https://github.com/eliascreates',
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
    required this.urlString,
    required this.title,
    required this.subtitle,
  });

  final String urlString;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        onTap: () => launchUrlString(
          urlString,
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: theme.colorScheme.primaryContainer,
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

class ThemeToggleTitle extends StatelessWidget {
  const ThemeToggleTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SwitchListTile(
        value: true,
        onChanged: (value) {},
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(title),
        secondary: const Icon(Icons.light_mode),
      ),
    );
  }
}
