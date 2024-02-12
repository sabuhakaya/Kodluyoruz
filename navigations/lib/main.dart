import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/settings': (context) => SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

//homepage.dart

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: const Icon(Icons.details),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            myString: 'Hello World',
                          )));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('ItemTest $index'),
                    subtitle: Text('Subtitle $index'),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    myString: 'Item $index',
                                  )));
                    },
                  );
                },
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

//details.dart
// details.dart
class DetailsPage extends StatefulWidget {
  final String myString; 
  DetailsPage({Key? key, required this.myString}) : super(key: key); 

  @override
  State createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> { 
  // Function to show the dialog box
  void _showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Dialog Title"),
          content: Text("This is the content of the dialog box."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Details Page '),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back")
            ),
            SizedBox(height: 20),
            Text(widget.myString),
          ],
        ),
      ),
      // Floating action button to trigger the dialog box
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogBox(); // Call the function to show the dialog box
        },
        child: Icon(Icons.add), // You can change the icon as needed
      ),
    );
  }
}

//settings.dart
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State createState() => _SettingsPageState();
}

class _SettingsPageState extends State {
  int counter = 0;
  bool isOpen = false;

  void toggleButton() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void inreaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings Page')),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Settings Page'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    inreaseCounter();
                  },
                  child: Text("Increase Counter")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    decreaseCounter();
                  },
                  child: Text("Decrase Counter")),
              SizedBox(
                height: 20,
              ),
              Text('Counter: $counter'),
              SizedBox(
                height: 50,
              ),
              IconButton(
                  onPressed: () {
                    toggleButton();
                  },
                  icon: Icon(Icons.photo_camera)),
              SizedBox(
                height: 20,
              ),
              if (isOpen)
                Image.asset(
                  'images/indir.jfif',
                  width: 300,
                  height: 300,
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ///Navigator.pop(context);
            Navigator.pushNamed(context, '/home');
            //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          child: Icon(Icons.arrow_back),
        ));
  }
}
