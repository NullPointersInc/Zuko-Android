import 'package:about/about.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    const Widget aboutPage = AboutPage(
      applicationVersion: 'Version {{ version }}, build #{{ buildNumber }}',
      applicationDescription: Text(
        'Application that can detect wildfire.',
        textAlign: TextAlign.center,
      ),
      applicationIcon: const SizedBox(
        width: 100,
        height: 100,
        child: Image(
          image: AssetImage("assets/logo.png"),
        ),
      ),
      applicationLegalese: '© Null Pointers INC, {{ year }}',
      children: <Widget>[
        MarkdownPageListTile(
          filename: 'README.md',
          title: Text('View Readme'),
          icon: Icon(Icons.all_inclusive),
        ),
        MarkdownPageListTile(
          filename: 'CHANGELOG.md',
          title: Text('View Changelog'),
          icon: Icon(Icons.view_list),
        ),
        MarkdownPageListTile(
          filename: 'LICENSE.md',
          title: Text('View License'),
          icon: Icon(Icons.description),
        ),
        MarkdownPageListTile(
          filename: 'CONTRIBUTING.md',
          title: Text('Contributing'),
          icon: Icon(Icons.share),
        ),
        MarkdownPageListTile(
          filename: 'CODE_OF_CONDUCT.md',
          title: Text('Code of conduct'),
          icon: Icon(Icons.sentiment_satisfied),
        ),
        LicensesPageListTile(
          title: Text('Open source Licenses'),
          icon: Icon(Icons.favorite),
        ),
      ],
    );

    return MaterialApp(
      title: 'Zuko',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: aboutPage,
      ),
    );
  }
}