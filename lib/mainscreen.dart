import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int eng = 0;
  int urdu = 0;
  int math = 0;
  int science = 0;
  int isl = 0;
  int total = 0;
  double percentage = 0;
  String Grade = "Not Calculated Yet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dmc Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("English"),
                  hintText: 'English',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }
                  final number = int.tryParse(text);
                  if (number == null || number <= 0 || number >= 100) {
                    return "Number Must Be Between 0 and 100";
                  }

                  eng = int.parse(text);
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Urdu"),
                  hintText: 'Urdu',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }
                  final number = int.tryParse(text);
                  if (number == null || number <= 0 || number >= 100) {
                    return "Number Must Be Between 0 and 100";
                  }

                  urdu = int.parse(text);
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Math"),
                  hintText: 'Math',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }
                  final number = int.tryParse(text);
                  if (number == null || number <= 0 || number >= 100) {
                    return "Number Must Be Between 0 and 100";
                  }

                  math = int.parse(text);
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Science"),
                  hintText: 'Science',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }
                  final number = int.tryParse(text);
                  if (number == null || number <= 0 || number >= 100) {
                    return "Number Must Be Between 0 and 100";
                  }

                  science = int.parse(text);
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Islamiat"),
                  hintText: 'Islamiat',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }
                  final number = int.tryParse(text);
                  if (number == null || number <= 0 || number >= 100) {
                    return "Number Must Be Between 0 and 100";
                  }

                  isl = int.parse(text);
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            formKey.currentState!.reset();
                            percentage = 0.0;
                            total = 0;
                            Grade = "Not Calculated Yet";
                          });
                        },
                        child: const Text('Clear')),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                                total = eng + urdu + math + science + isl;
                                if (percentage >= 80) {
                                  Grade = "A1";
                                } else if (percentage <= 79 &&
                                    percentage >= 70) {
                                  Grade = "A";
                                } else if (percentage <= 69 &&
                                    percentage >= 60) {
                                  Grade = "B";
                                } else if (percentage <= 59 &&
                                    percentage >= 40) {
                                  Grade = "C";
                                } else {
                                  Grade = "Fail";
                                }
                              }
                            });

                            setState(() {
                              if (formKey.currentState!.validate()) {
                                percentage = total / 500 * 100;
                              }
                            });
                          });
                        },
                        child: const Text('Calculate')),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                            width: 150,
                            child: Text(
                              "Total Number",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "$total",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                            width: 150,
                            child: Text(
                              "Percentage",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "$percentage",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                            width: 150,
                            child: Text(
                              "Grade",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "$Grade",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Expanded(
                        child:
                            Text("App Is Develope By Abdullah Farman With ❤"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
