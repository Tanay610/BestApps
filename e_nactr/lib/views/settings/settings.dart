import 'package:e_nactr/components/book_list_item.dart';
import 'package:e_nactr/theme/theme_config.dart';
import 'package:e_nactr/util/router.dart';
import 'package:e_nactr/view_models/app_provider.dart';
import 'package:e_nactr/views/downloads/downloads.dart';
import 'package:e_nactr/views/favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List items = [];

  @override
  void initState() {
    super.initState();
    items = [
      {
        'icons': Feather.heart,
        'title': 'Favorites',
        'function': () {
          return _pushPage(Favorites());
        }
      },
      {
        'icons': Feather.download,
        'title': 'Downloads',
        'function': () {
          return _pushPage(Downloads());
        }
      },
      {
        'icons': Feather.moon,
        'title': 'Dark Mode',
        'function': () {
          return _pushPage(Downloads());
        }
      },
      {'icons': Feather.info, 'title': 'About', 'function': () => showAbout()},
      {
        'icons': Feather.file_text,
        'title': 'Licenses',
        'function': () => _pushPage(const LicensePage())
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    ///
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      items.removeWhere((item) => item['title'] == 'Dark Mode');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (items[index]['title'] == 'Dark Mode') {
              return _buildThemeSwitch(items[index]);
            }

            return ListTile(
              onTap: items[index]['function'],
              leading: Icon(
                items[index]['icons'],
              ),
              title: Text(
                items[index]['title'],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: items.length),
    );
  }

  Widget _buildThemeSwitch(Map item) {
    return SwitchListTile(
      secondary: Icon(
        item['icons'],
      ),
      title: Text(item['title']),
      value: Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
          ? false
          : true,
      onChanged: (v) {
        if (v) {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.darkTheme, 'dark');
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.lightTheme, 'light');
        }
      },
    );
  }

  _pushPage(Widget page) {
    Routed.pushPage(context, page);

    Routed.pushPageDialog(context, page);
  }

  showAbout() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('About'),
            content: const Text("Ebook app by Tanay Gautam"),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }
}
