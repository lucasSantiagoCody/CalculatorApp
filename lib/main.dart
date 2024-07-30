import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number = '';
  double firstNum = 0.0;
  String operation = '';
  String cardOperation = '';

  void calculate(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          number += tecla;
          if (!number.contains(',')) {
            number = number.replaceAll(',', '.');
            int numberInt = int.parse(number);
            number = numberInt.toString();
          } else {}
        });
        break;
      case '+':
      case '-':
      case 'x':
      case '/':
        operation = tecla;
        if (number != '') {
          firstNum = double.parse(number.replaceAll(',', '.'));
        }

        setState(() {
          if (tecla == '/') {
            cardOperation = '÷';
          } else {
            cardOperation = tecla;
          }
        });

        
        number = '';
        break;

      case '=':
        double result = 0.0;

        if (operation == '/') {
          if (double.parse(number) * 1 == 0) {
            return;
          }
        }

        if (operation == '+') {
          result = firstNum + double.parse(number.replaceAll(',', '.'));
        }
        if (operation == '-') {
          result = firstNum - double.parse(number.replaceAll(',', '.'));
        }
        if (operation == 'x') {
          result = firstNum * double.parse(number.replaceAll(',', '.'));
        }
        if (operation == '/') {
          result = firstNum / double.parse(number.replaceAll(',', '.'));
        }
        String resultString = result.toString();
        List<String> resultChunks = resultString.split('.');

        if (int.parse(resultChunks[1]) * 1 == 0) {
          setState(() {
            number = int.parse(resultChunks[0]).toString();
          });
        } else {
          setState(() {
            number = result.toString().replaceAll('.', ',');
          });
        }
        setState(() {
          cardOperation = '';
        });
      case 'ac':
        setState(() {
          number = '0';
          cardOperation = '';
        });
        break;
      case '<':
        setState(() {
          if (number.length > 0) {
            number = number.substring(0, number.length - 1);
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: cardOperation.isNotEmpty,
            child: Card(
                margin: const EdgeInsets.only(left: 400),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Text(cardOperation,
                      style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                      )),
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(number,
                style: const TextStyle(fontSize: 70, color: Colors.white)),
          ]),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  calculate('ac');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((state) => Colors.grey),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(29)),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.shade200;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue;
                      }
                      return null;
                    })),
                child: const Text(
                  'AC',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  calculate('<');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((state) => Colors.grey),
                    minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.shade200;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue;
                      }
                      return null;
                    })),
                child: const Text(
                  '+/-',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  calculate('%');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((state) => Colors.grey),
                    minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.shade200;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue;
                      }
                      return null;
                    })),
                child: const Text(
                  '%',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    calculate('/');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (state) => Colors.orange),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 50)),
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.orange.shade200;
                        }
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.orange.shade100;
                        }
                        return null;
                      })),
                  child: Image.asset(
                    'assets/images/divided-icon.png',
                    width: 20,
                    height: 20,
                  )),
            ],
          ),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
              onPressed: () {
                calculate('7');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '7',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('8');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '8',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('9');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '9',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('x');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((state) {
                    return Colors.orange;
                  }),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.orange.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.orange.shade100;
                    }
                    return null;
                  })),
              child: const Text(
                'x',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ]),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
              onPressed: () {
                calculate('4');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '4',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('5');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '5',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('6');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '6',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('-');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.orange.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.orange.shade100;
                    }
                    return null;
                  })),
              child: const Text(
                '-',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ]),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
              onPressed: () {
                calculate('1');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('2');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('3');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('+');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.orange.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.orange.shade100;
                    }
                    return null;
                  })),
              child: const Text(
                '+',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ]),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
              onPressed: () {
                calculate('0');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  minimumSize: MaterialStateProperty.all(const Size(220, 60)),
                  alignment: Alignment.centerLeft,
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue;
                    }
                    return null;
                  })),
              child: const Text(
                '0',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const Text(''),
            ElevatedButton(
                onPressed: () {
                  calculate(',');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    minimumSize: MaterialStateProperty.all(const Size(100, 20)),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.shade200;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue;
                      }
                      return null;
                    })),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    ',',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                calculate('=');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.orange.shade200;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.orange.shade100;
                    }
                    return null;
                  })),
              child: const Text(
                '=',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ]),
          const SizedBox(height: 30),
        ],
      ),
    ));
  }
}
