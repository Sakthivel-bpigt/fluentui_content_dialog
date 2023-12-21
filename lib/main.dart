import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? result = '';

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('ContentDialog')),
      children: [
        Center(
          child: Button(
            child: const Text('Show dialog'),
            onPressed: () => showContentDialog(context),
          ),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }

  void showContentDialog(BuildContext context) async {
    result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Content Dialog'),
        content: const NumberDialog(),
        actions: [
          Button(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.pop(context, 'User said ok');
              // Delete file here
            },
          ),
          FilledButton(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context, 'User closed dialog'),
          ),
        ],
      ),
    );
    setState(() {});
  }
}

class NumberDialog extends StatefulWidget {
  const NumberDialog({super.key});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends State<NumberDialog> {
  var numberType = NumberTypes.Natural;
  var number = Numbers.ONE;
  Map<String, bool> l1 = {'a': true, 'b': true, 'c': true};
  Map<String, bool> l2 = {'d': true, 'e': true, 'f': true};
  Map<String, bool> l3 = {'g': true, 'h': true, 'i': true};
  Map<String, bool> l4 = {'j': true, 'k': true, 'l': true};
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ComboBox<String>(
            value: numberType,
            items: Security.securityList.map<ComboBoxItem<String>>((e) {
              return ComboBoxItem<String>(value: e, child: Text(e));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                numberType = newValue!;
                debugPrint(numberType);
              });
            },
          ),
          if (numberType == Security.Cryptos)
            Container(
              width: 200,
              height: 400,
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: l1.length,
                itemBuilder: (context, index) {
                  String key = l1.keys.elementAt(index);
                  return ListTile(
                    title: Text(key),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          l1[key] = value!;
                        });
                      },
                      checked: l1[key],
                    ),
                  );
                },
              ),
            ),
          if (numberType == Security.FX_pairs)
            Container(
              width: 200,
              height: 400,
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: l2.length,
                itemBuilder: (context, index) {
                  String key = l2.keys.elementAt(index);
                  return ListTile(
                    title: Text(key),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          l2[key] = value!;
                        });
                      },
                      checked: l2[key],
                    ),
                  );
                },
              ),
            ),
          if (numberType == Security.Indices_Comm)
            Container(
              width: 200,
              height: 400,
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: l3.length,
                itemBuilder: (context, index) {
                  String key = l3.keys.elementAt(index);
                  return ListTile(
                    title: Text(key),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          l3[key] = value!;
                        });
                      },
                      checked: l3[key],
                    ),
                  );
                },
              ),
            ),
          if (numberType == Security.Metals_and_Oil_pairs)
            Container(
              width: 200,
              height: 400,
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: l4.length,
                itemBuilder: (context, index) {
                  String key = l4.keys.elementAt(index);
                  return ListTile(
                    title: Text(key),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          l4[key] = value!;
                        });
                      },
                      checked: l4[key],
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}

class Numbers {
  static const String ONE = "One";
  static const String TWO = "Two";
  static const String THREE = "Three";

  static List<String> NumberList = [ONE, TWO, THREE];
}

class NumberTypes {
  static const String Natural = "Natural";
  static const String Real = "Real";
  static const String Rational = "Rational";
  static const String Irrational = "Irrational";

  static List<String> NumberTypesList = [Natural, Real, Rational, Irrational];
}

class Security {
  static const String Cryptos = "Cryptos";
  static const String FX_pairs = "FX pairs";
  static const String Indices_Comm = "Indices & Comm";
  static const String Metals_and_Oil_pairs = "Metals and Oil pairs";

  static List<String> securityList = [
    Cryptos,
    FX_pairs,
    Indices_Comm,
    Metals_and_Oil_pairs
  ];
}
