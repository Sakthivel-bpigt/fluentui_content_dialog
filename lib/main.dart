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

  var numberType = NumberTypes.Natural;
  var number = Numbers.ONE;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('ContentDialog')),
      children: [
        Button(
          child: const Text('Show dialog'),
          onPressed: () => showContentDialog(context),
        ),
        const SizedBox(width: 10.0),
        Text(result ?? ''),
      ],
    );
  }

  void showContentDialog(BuildContext context) async {
    result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Content Dialog'),
        content: Column(
          children: [
            ComboBox<String>(
              value: numberType,
              items: NumberTypes.NumberTypesList.map<ComboBoxItem<String>>((e) {
                return ComboBoxItem<String>(value: e, child: Text(e));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  numberType = newValue!;
                  debugPrint(numberType);
                });
              },
            ),
            Text('Selected item is $numberType'),
            if (numberType.contains(NumberTypes.Natural))
              ComboBox<String>(
                value: number,
                items: Numbers.NumberList.map<ComboBoxItem<String>>((e) {
                  return ComboBoxItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    number = newValue!;
                    debugPrint(number);
                  });
                },
              ),
          ],
        ),
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
