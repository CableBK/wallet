import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Fluent Navigation View Example',
      theme: FluentThemeData(brightness: Brightness.light),
      home: NavigationViewExample(),
    );
  }
}

class NavigationViewExample extends StatefulWidget {
  @override
  _NavigationViewExampleState createState() => _NavigationViewExampleState();
}

class _NavigationViewExampleState extends State<NavigationViewExample> {
  int selectedIndex = 0;

  final List<String> pages = ['Home Page', 'Settings Page', 'Profile Page'];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text('Fluent Navigation View')),
      content: NavigationView(
        appBar: NavigationAppBar(title: Text(pages[selectedIndex])),
        pane: NavigationPane(
          selected: selectedIndex,
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            PaneItemHeader(header: const Text('Main Menu')),
            PaneItem(icon: Icon(FluentIcons.home), title: Text('Home')),
            PaneItem(icon: Icon(FluentIcons.settings), title: Text('Settings')),
            PaneItem(icon: Icon(FluentIcons.contact), title: Text('Profile')),
          ],
        ),
        content: Center(
          child: Text(pages[selectedIndex], style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
