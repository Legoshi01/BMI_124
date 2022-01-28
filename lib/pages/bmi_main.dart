import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageInput extends StatefulWidget {
  const PageInput({Key? key}) : super(key: key);

  @override
  _PageInputState createState() => _PageInputState();
}

double result = 0;
String BMI = '';

class _PageInputState extends State<PageInput> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _weight = TextEditingController();

  TextEditingController _height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Cal'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.centerLeft,
              //     end: Alignment.centerRight,
              //     colors: [Colors.white, Colors.blue, Colors.purple]
              //     )

              //     gradient: RadialGradient(
              //   colors: [Colors.yellow, Colors.deepPurple],
              // )
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  // Add one stop for each color
                  // Values should increase from 0.0 to 1.0
                  stops: [
                0.1,
                0.5,
                0.8,
                0.9
              ],
                  colors: [
                Colors.indigo,
                Colors.indigoAccent,
                Colors.blue,
                Colors.blueAccent
              ])),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                    child: Text('Input Weight & Height',
                        style: GoogleFonts.itim(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 30)))),
              ),
              inputW(),
              inputH(),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(150, 5, 150, 5),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (_formKey.currentState!.validate()) {
              //         // print(_weight.text + '  ' + _height.text);
              //         return;
              //       }
              //     },
              //     child: Text('Submit'),
              //   ),
              // ),
              submitBT(context)

              // textfield(),
              // textfieldpasw(),
            ],
          ),
        ),
      ),
    );
  }

  Padding submitBT(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150, 5, 150, 5),
      child: Container(
        child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // print(_weight.text + '  ' + _height.text);
                var route = MaterialPageRoute(
                    builder: (context) => PageResult(
                          BMI: BMI,
                        ));
                calBmi();
                Navigator.push(context, route);
              } else {
                return;
              }
            },
            // child: Text("go to page 3"))
            child: Text("ยืนยันข้อมูล")),
      ),
    );
  }

  Container inputW() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.teal),
          controller: _weight,
          validator: (vaLue) {
            if (vaLue!.isEmpty) {
              return "please enter weight";
            }
            return null;
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Input weight kg',
              // prefixIcon: Icon(
              //   Icons.weigh,
              //   color: Colors.teal,
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              )),
        ),
      ),
    );
  }

  Container inputH() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.teal),
          controller: _height,
          validator: (vaLue) {
            if (vaLue!.isEmpty) {
              return "please enter height";
            }
            return null;
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Input height cm',
              // prefixIcon: Icon(
              //   Icons.weigh,
              //   color: Colors.teal,
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              )),
        ),
      ),
    );
  }

  void calBmi() {
    double Pweight = double.parse(_weight.text);
    double Pheight = double.parse(_height.text);
    Pheight = Pheight / 100;
    Pheight = Pheight * Pheight;
    double result = (Pweight / Pheight);

    if (result < 18.5) {
      BMI = 'น้ำหนักน้อยเกินไป';
    } else if (result <= 22.99) {
      BMI = 'น้ำหนักปกติ';
    } else if (result <= 24.99) {
      BMI = 'น้ำหนักเกิน ';
    } else if (result <= 29.99) {
      BMI = 'อ้วนระดับ 1 ';
    } else if (result <= 39.99) {
      BMI = 'อ้วนระดับ 2 ';
    } else {
      BMI = 'อ้วนระดับ 3 ';
    }

    resultE = result.toStringAsFixed(2);
    // setState(() {});
  }
}
