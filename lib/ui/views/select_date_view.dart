import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/viewmodels/view/select_date_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class SelectDateView extends StatefulWidget {
  @override
  _SelectDateViewState createState() => _SelectDateViewState();
}

class _SelectDateViewState extends State<SelectDateView> {
  static DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SelectDateModel>(
      model: SelectDateModel(matchService: Provider.of(context)),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Text(
                "Select Date",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              Center(
                child: Container(
                  height: 30,
                  width: 200,
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: Center(
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(selectedDate),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                  onPressed: () => {
                    model
                        .setDate(DateFormat('dd-MM-yyyy').format(selectedDate)),
                    Navigator.pushNamed(context, RoutePaths.SelectTime)
                  },
                  child: Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
