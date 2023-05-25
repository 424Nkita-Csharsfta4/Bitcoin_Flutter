import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoAppTiraspol());
}

class CryptoAppTiraspol extends StatelessWidget {
  const CryptoAppTiraspol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color.fromARGB(255, 251, 243, 17),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      home: const CryptoListScreen(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CryptoListScreenState createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 208, 109, 239),
                  Color.fromARGB(255, 158, 64, 211),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 2.0,
            child: ListTile(
              leading: Image.asset(
                'assets/bitcoin.png',
                height: 25,
                width: 25,
              ),
              title: const Text(
                'Dodge coins',
                style: TextStyle(
                  color: Color.fromARGB(240, 0, 0, 0),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              subtitle: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CryptoScreen(),
                  ));
                },
                child: const Text(
                  '20000\$',
                  style: TextStyle(
                    color: Color.fromARGB(241, 226, 222, 222),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bitcoin')),
    );
  }
}
