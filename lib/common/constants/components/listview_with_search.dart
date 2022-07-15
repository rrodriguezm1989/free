import 'package:dandy/common/constants/components/listview_with_search.dart';
import 'package:flutter/material.dart';

import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;
import 'package:dandy/common/constants/utils/constant_dimension.dart'
    as constantDimension;

import 'package:google_fonts/google_fonts.dart';

class ListViewWithSearch extends StatefulWidget {
  @override
  _ListViewWithSearch createState() => _ListViewWithSearch();
}

class _ListViewWithSearch extends State<ListViewWithSearch> {
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  TextEditingController editingController = TextEditingController();
  var items = <String>[];
  int? _selected;

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 344,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              child: Padding(
            padding: EdgeInsets.only(top: 44),
            child: Container(
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0)),
                    border: Border.all(
                        width: 1,
                        color: constantColors.purple,
                        style: BorderStyle.solid)),
                child: ListView.builder(
                  //you have to specify the padding 0 because it includes one by default
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: false,
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return Container(
                      color: _selected == i ? constantColors.purple : null,
                      child: ListTile(
                        leading: const FlutterLogo(),
                        title: Container(
                          child: Text(items[i],
                              style: GoogleFonts.openSans(
                                  color: _selected == i
                                      ? Colors.white
                                      : constantColors.greyInputBackground,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                        ),
                        onTap: () => setState(() => {_selected = i}),

                        //_selected == i ? constantColors.purple : null,
                      ),
                    );
                  },
                )),
          )),
          Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: SizedBox(
                height: constantDimension.heightInputs,
                width: 344,
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: constantColors.greyInputBackground,
                              width: 0.0),
                          borderRadius: BorderRadius.circular(45.0)),
                      filled: true,
                      //fillColor: Colors.red,
                      contentPadding: const EdgeInsets.only(
                          left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: constantColors.purple, width: 2.0),
                          borderRadius: BorderRadius.circular(45.0)),
                      fillColor: constantColors.greyInputBackground,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Search for University",
                      hintStyle: TextStyle(
                          fontSize: 14.0, color: constantColors.purple),
                      prefixIcon: Icon(
                        Icons.search,
                        color: constantColors.purple,
                        size: 16.0,
                      ),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      focusColor: constantColors.purple),
                ),
              ))
        ],
      ),
    );
  }
}
