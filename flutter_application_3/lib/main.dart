import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _slagaemoe1 = '';
  String _slagaemoe2 = '';
  String _znak = '';
  bool _nextTurn = false;

  void evaluate(String sl1, String sl2, String znak) {
    try {
      int ans = 0;
      if (znak == "+") {
        ans = int.parse(sl1) + int.parse(sl2);
      } else if (znak == "-") {
        ans = int.parse(sl1) - int.parse(sl2);
      } else if (znak == "*") {
        ans = int.parse(sl1) * int.parse(sl2);
      } else if (znak == "/") {
        ans = int.parse(sl1) ~/ int.parse(sl2);
      }
      setState(() {
        _slagaemoe1 = ans.toString();
        _slagaemoe2 = "";
        _znak = "";
      });
    } catch (e) {
      setState(() {
        _slagaemoe1 = sl1;
        _slagaemoe2 = "";
        _znak = znak;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('$_slagaemoe1 $_znak $_slagaemoe2'),
          ),
          Row(
            children: [
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '1';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '1';
                      });
                    }
                  },
                  child: Text('1')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '2';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '2';
                      });
                    }
                  },
                  child: Text('2')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '3';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '3';
                      });
                    }
                  },
                  child: Text('3')),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _znak = "+";
                      _nextTurn = true;
                    });
                  },
                  child: Text('+')),
            ],
          ),
          Row(
            children: [
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '4';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '4';
                      });
                    }
                  },
                  child: Text('4')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '5';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '5';
                      });
                    }
                  },
                  child: Text('5')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '6';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '6';
                      });
                    }
                  },
                  child: Text('6')),
              FlatButton(
                  onPressed: () => evaluate(_slagaemoe1, _slagaemoe2, _znak),
                  child: Text('=')),
            ],
          ),
          Row(
            children: [
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '7';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '7';
                      });
                    }
                  },
                  child: Text('7')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '8';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '8';
                      });
                    }
                  },
                  child: Text('8')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '9';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '9';
                      });
                    }
                  },
                  child: Text('9')),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _znak = "-";
                      _nextTurn = true;
                    });
                  },
                  child: Text('-')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _znak = "*";
                      _nextTurn = true;
                    });
                  },
                  child: Text('*')),
              FlatButton(
                  onPressed: () {
                    if (!_nextTurn) {
                      setState(() {
                        _slagaemoe1 += '0';
                      });
                    } else {
                      setState(() {
                        _slagaemoe2 += '0';
                      });
                    }
                  },
                  child: Text('0')),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _znak = "/";
                      _nextTurn = true;
                    });
                  },
                  child: Text('/')),
              FlatButton(
                  onPressed: () {
                    try {
                      if (!_nextTurn) {
                        setState(() {
                          _slagaemoe1 =
                              _slagaemoe1.substring(0, _slagaemoe1.length - 1);
                        });
                      } else {
                        setState(() {
                          _slagaemoe2 =
                              _slagaemoe2.substring(0, _slagaemoe2.length - 1);
                        });
                      }
                    } catch (e) {}
                    ;
                  },
                  child: Text('<')),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _znak = "";
                      _nextTurn = false;
                      _slagaemoe1 = "";
                      _slagaemoe2 = "";
                    });
                  },
                  child: Text('<<')),
            ],
          ),
        ],
      ),
    );
  }
}
