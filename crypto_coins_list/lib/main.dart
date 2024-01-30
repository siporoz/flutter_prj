import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesListApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 37, 37, 37),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        dividerColor: Colors.white10,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 37, 37, 37),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18 , fontWeight: FontWeight.w700)
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14
          )
        )
      ),
      home: const MyHomePage(title: 'Crypto Currencies ListApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto app'),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (item, i) =>
          ListTile(
            leading: SvgPicture.asset('assets/svg/btc-logo.svg', height: 25, width: 25,),
            title: Text('Bitcoin', style: theme.textTheme.bodyMedium),
            subtitle: Text('20000',
              style: theme.textTheme.labelSmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
        )
      ),
    );
  }
}
