import 'package:flutter/material.dart';

class StateTeksUtama extends State<TeksUtama> {
  var listNama = [
    'Budi', 'Andi', 'Sari', 'Rudi',
    'Nurul', 'Huda', 'Lendis', 'Fabri'
  ];
  var listWarna = [
    Colors.red, Colors.purple, Colors.teal, Colors.lime,
    Colors.indigo, Colors.deepPurple, Colors.cyan,
    Colors.blue, Colors.yellow
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Container bayangan
        Positioned(
          top: 50,
          left: 50,
          child: Opacity(
            opacity: 0.2, // Adjusted opacity to make it lighter
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              width: 300, // Increased width
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50), // Rounded corners
              ),
            ),
          ),
        ),
        // Container utama
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          margin: EdgeInsets.all(20),
          width: 300, // Increased width
          height: 150,
          decoration: BoxDecoration(
            color: Colors.cyan[50],
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Apa kabar',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                listNama[index % listNama.length],
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: listWarna[index % listWarna.length],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TeksUtama extends StatefulWidget {
  final state = StateTeksUtama();

  @override
  State<StatefulWidget> createState() => state;
}

void main() {
  TeksUtama teksUtama = TeksUtama();

  runApp(
    MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo Dunia'),
        ),
        body: Center(
          child: teksUtama,
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Random',
          child: Icon(Icons.refresh),
          onPressed: teksUtama.state.incrementIndex,
        ),
      ),
    ),
  );
}
