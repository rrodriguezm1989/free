import 'package:dandy/Authentication/bloc/authentication_bloc.dart';
import 'package:dandy/Authentication/bloc/authentication_event.dart';
import 'package:dandy/Authentication/components/background.dart';
import 'package:dandy/Authentication/components/white_background.dart';
import 'package:dandy/common/constants/components/dropdown_input.dart';
import 'package:dandy/common/constants/components/listview_with_search.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/Authentication/components/activity_indicator.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:dandy/common/constants/utils/constant_departamentos_guatemala.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final _bloc = AuthenticationBloC();

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

  Center Body(
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

    return Center(
        child: Container(color: constantColors.secondary, child: Text("home")));
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
