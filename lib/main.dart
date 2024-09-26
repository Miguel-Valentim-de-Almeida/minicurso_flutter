import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: 
        const Row(
          children: [
            Column(
              children: [
              Text("Catapimbas"), 
              Text("fsdfsdf"), 
              Text("fsdfsdfsdfsd")
              ],
            ),
            Column(
              children: [
                Row(
                children: [
                  Text("dfsdfs"), 
                  Text("  dfsdfs")
                ]
                ),
                Row(
                  children: [
                    Text("dfsdfs"), 
                    Text("  dfsdfs")
                  ]
                )
              ]  
            ),
          ]      
        )
      ),
      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     const Text(
      //       'You have pushed the button this many times:',
      //     ),
      //     const Text(
      //       'Catapimbas',
      //     ),
      //     const Text(
      //       'atapimba',
      //     ),
      //     const Text(
      //       'tapimb',
      //     ),
      //     const Text(
      //       'apim',
      //     ),
      //     const Text(
      //       'pi',
      //     ),
      //     Text(
      //       '$_counter',
      //       style: TextStyle(
      //         color: const Color.fromARGB(255, 22, 88, 5),
      //         fontSize: 90,
      //         backgroundColor: Colors.blue,
      //       )
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
