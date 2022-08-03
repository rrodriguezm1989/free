import 'package:dandy/Authentication/bloc/authentication_bloc.dart';
import 'package:dandy/Authentication/bloc/authentication_event.dart';
import 'package:dandy/Authentication/components/background.dart';
import 'package:dandy/Authentication/components/white_background.dart';
import 'package:dandy/common/constants/components/counter_component.dart';
import 'package:dandy/common/constants/components/dropdown_input.dart';
import 'package:dandy/common/constants/components/listview_with_search.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/Authentication/components/activity_indicator.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:dandy/common/constants/utils/constant_departamentos_guatemala.dart';

class SignUp1 extends StatefulWidget {
  @override
  _SignUp1 createState() => _SignUp1();
}

class _SignUp1 extends State<SignUp1> {
  final _bloc = AuthenticationBloC();
  var hasChildren = true;
  var childNumber = 0;
  var range = 0;

  var birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int stepHeader = 1;
    int stepMessageTop = 4;
    // ignore: dead_code
    return Scaffold(
      // body: ValueListenableBuilder(
      //   valueListenable: _bloc.counter,
      //   builder: (context, int counter, child) {
      //     return Body(headers, stepHeader, messagesTop, stepMessageTop, context,
      //         counter);
      //   },
      // ),
      //);
      body: StreamBuilder<int>(
        stream: _bloc.counterStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SnackBar(
              content: Text('There is an error!'),
            );
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return Body(stepHeader, stepMessageTop, context, snapshot.data!);
        },
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    _bloc.dispose();
  }

  Widget Body(
      int stepHeader, int stepMessageTop, BuildContext context, int counter) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> departamentosGuatemala = departamentos.toList();
    int index = 0;
    List<String> mDepartamento = municipiosDepartamento(index);
    String? _departmentSelect;
    String? _municipioSelect;
    String? _zonaSelect;
    ValueNotifier<DateTime?> _birthDate =
        ValueNotifier<DateTime>(DateTime.now());

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          initialDatePickerMode: DatePickerMode.year,
          initialEntryMode: DatePickerEntryMode.inputOnly,
          context: context,
          initialDate: _birthDate.value ?? DateTime.now(),
          firstDate: DateTime(1900, 8),
          lastDate: DateTime.now());
      if (picked != null && picked != _birthDate) {
        setState(() {
          print("object");
          print(picked);
          var format = DateFormat('dd/MM/yyyy');
          birthDateController.text = format.format(picked).toString();
          _birthDate.value = picked;
        });
      }
    }

    var calendar = ValueListenableBuilder(
        valueListenable: _birthDate,
        builder: (context, DateTime? dateEvent, child) {
          return GestureDetector(
            onTap: () => {_selectDate(context)},
            child: Stack(children: [
              TypicalInput(
                hintText: "mm/dd/yy",
                typeField: "text",
                widthField: width * 0.91 * 0.58,
                controller: birthDateController,
              ),
              Container(
                color: Colors.transparent,
                width: 220,
                height: 70,
              ),
            ]),
          );
        });

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constantColors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Container(
            color: constantColors.secondary,
            child: Center(
              child: Container(
                  width: width * 0.82,
                  child: Container(
                    color: constantColors.secondary,
                    width: width * 0.82,
                    //height: height,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Wrap(
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              TypicalInput(
                                hintText: "Direccion completa",
                                typeField: "text",
                                widthField: (width * 0.82).toDouble(),
                                height: 40 / 667 * height,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: width * 0.82 * 10 / 310),
                                child: DropdownInput(
                                  widthField: width * 0.82 * 150 / 310,
                                  hintText: "Departamentos",
                                  items: departamentosGuatemala,
                                  selectedItem: _departmentSelect,
                                  onChange: (String? newValue) {
                                    setState(() {
                                      _departmentSelect = newValue!;
                                    });
                                  },
                                ),
                              ),
                              DropdownInput(
                                widthField: width * 0.82 * 150 / 310,
                                hintText: "Municipios",
                                items: mDepartamento,
                                selectedItem: _municipioSelect,
                                onChange: (String? newValue) {
                                  setState(() {
                                    _municipioSelect = newValue!;
                                  });
                                },
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: DropdownInput(
                                    widthField: width * 0.82 * 150 / 310,
                                    selectedItem: _municipioSelect,
                                    onChange: (String? newValue) {
                                      setState(() {
                                        _municipioSelect = newValue!;
                                      });
                                    },
                                    hintText: "Zona",
                                    items: List<String>.generate(
                                        21, (i) => (i + 1).toString())),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0, bottom: 5),
                                      child: TextInput(
                                        text: "Fecha de Nacimiento",
                                        weight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    calendar,
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0, bottom: 5),
                                      child: TextInput(
                                        text: "Genero",
                                        weight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    DropdownInput(
                                        widthField: width * 0.82,
                                        hintText: "Genero",
                                        selectedItem: _municipioSelect,
                                        onChange: (String? newValue) {
                                          setState(() {
                                            _municipioSelect = newValue!;
                                          });
                                        },
                                        items: const [
                                          "Masculino",
                                          "Femenino",
                                          "Prefiero no decirlo"
                                        ]),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, bottom: 5, top: 10),
                                child: tilesHasChildren(),
                              ),
                              if (hasChildren)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, bottom: 5, top: 10),
                                  child: childrenForm(size.width),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 28),
                                child: Column(
                                  children: [
                                    LargeButton(
                                      text: "Siguiente",
                                      color: constantColors.principal,
                                      width: width * 0.82,
                                      height:
                                          (height * 58 / 667 * 0.85).toDouble(),
                                      onPress: () => {
                                        Navigator.of(context).pushNamed(
                                          '/home',
                                        )
                                      },
                                    ),
                                    alreadyHaveAnAccount(context)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  )),
            ),
          )),
        ),
      ),
    );
  }

  Widget tilesHasChildren() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formLabel("¿Tienes hijos?"),
        ListTile(
          title: const Text(
            "Si",
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio<bool>(
            value: true,
            groupValue: hasChildren,
            onChanged: (vl) {
              hasChildren = true;
              childNumber = 1;
              setState(() {});
            },
            fillColor: MaterialStateColor.resolveWith(
                (states) => hasChildren ? principal : Colors.white),
          ),
        ),
        ListTile(
          title: const Text(
            "No",
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio<bool>(
            value: false,
            groupValue: hasChildren,
            onChanged: (vl) {
              hasChildren = false;
              childNumber = 0;
              setState(() {});
            },
            fillColor: MaterialStateColor.resolveWith(
                (states) => !hasChildren ? principal : Colors.white),
          ),
        ),
      ],
    );
  }

  Widget childrenForm(double width) {
    return Container(
      width: width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        formLabel("¿Cuántos hijos tienes?"),
        CounterButton(
          counter: childNumber.toString(),
          onRemovePressed: () {
            if (childNumber == 0) return;
            childNumber--;
            setState(() {});
          },
          onAddPressed: () {
            if (childNumber >= 99) return;
            childNumber++;
            setState(() {});
          },
          withRoundedBorder: true,
          width: 155,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: childrenAge(),
        )
      ]),
    );
  }

  Widget childrenAge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formLabel("Rangos de edades"),
        ListTile(
          title: const Text(
            "1 - 5",
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio<int>(
            value: 0,
            groupValue: range,
            onChanged: (vl) {
              range = 0;
              setState(() {});
            },
            fillColor: MaterialStateColor.resolveWith(
                    (states) => range == 0 ? principal : Colors.white),
          ),
        ),
        ListTile(
          title: const Text(
            "5 - 12",
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio<int>(
            value: 1,
            groupValue: range,
            onChanged: (vl) {
              range = 1;
              setState(() {});
            },
            fillColor: MaterialStateColor.resolveWith(
                    (states) => range == 1 ? principal : Colors.white),
          ),
        ),
        ListTile(
          title: const Text(
            "12 -18",
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio<int>(
            value: 2,
            groupValue: range,
            onChanged: (vl) {
              range = 2;
              setState(() {});
            },
            fillColor: MaterialStateColor.resolveWith(
                    (states) => range == 2 ? principal : Colors.white),
          ),
        ),
      ],
    );
  }

  Widget formLabel(String lbl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: TextInput(
        text: lbl,
        weight: FontWeight.w600,
        fontSize: 14,
        align: TextAlign.start,
      ),
    );
  }

  Row alreadyHaveAnAccount(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInput(text: "Ya tienes cuenta?"),
        TextButtonNoBorders(
          text: "Inicia sesión aqui",
          onPress: () => {
            Navigator.of(context).pushNamed(
              "/login/0",
            )
          },
          color: Colors.white,
          underline: true,
        )
      ],
    );
  }
}
