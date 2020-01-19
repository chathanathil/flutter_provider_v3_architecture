import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/viewmodels/view/dash_board_view_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';
import 'package:turf_management/ui/widgets/bookings.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  static DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(
      BuildContext context, DashBoardViewModel model) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    model.turfBooking(DateFormat('dd-MM-yyyy').format(selectedDate));
    model.poolBooking(DateFormat('dd-MM-yyyy').format(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashBoardViewModel>(
        model: DashBoardViewModel(dashBoardService: Provider.of(context)),
        onModelReady: (model) => {
              model.turfBooking(DateFormat('dd-MM-yyyy').format(selectedDate)),
              model.poolBooking(DateFormat('dd-MM-yyyy').format(selectedDate)),
            },
        builder: (context, model, child) => DefaultTabController(
              length: 2,
              child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, RoutePaths.SelectDate),
                  child: Icon(Icons.add),
                ),
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                        text: "Football Turf",
                      ),
                      Tab(
                        text: "Swimming Pool",
                      )
                    ],
                  ),
                  title: Text(
                    "Abraj Bookings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        model.turfBooking(
                            DateFormat('dd-MM-yyyy').format(selectedDate));
                        model.poolBooking(
                            DateFormat('dd-MM-yyyy').format(selectedDate));
                      },
                    ),
                    Container(
                      height: 30,
                      width: 150,
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: InkWell(
                        onTap: () => _selectDate(context, model),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              DateFormat('dd/MM/yyyy').format(selectedDate),
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.date_range,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                body: TabBarView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        model.busy
                            ? CircularProgressIndicator()
                            : Container(
                                height: 600,
                                child: ListView.builder(
                                  itemCount: model.turfBookings.length,
                                  itemBuilder: (context, index) => model
                                              .turfBookings[index]['msg'] !=
                                          null
                                      ? Text(model.turfBookings[index]['msg'])
                                      : TurfBooking(
                                          booking: model.turfBookings[index],
                                          date: DateFormat('dd/MM/yyyy')
                                              .format(selectedDate),
                                        ),
                                ),
                              ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        model.busy
                            ? CircularProgressIndicator()
                            : Container(
                                height: 600,
                                child: ListView.builder(
                                  itemCount: model.poolBookings.length,
                                  itemBuilder: (context, index) => model
                                              .poolBookings[index]['msg'] !=
                                          null
                                      ? Center(
                                          child: Text(
                                              model.poolBookings[index]['msg']))
                                      : TurfBooking(
                                          booking: model.poolBookings[index],
                                          date: DateFormat('dd/MM/yyyy')
                                              .format(selectedDate),
                                        ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
