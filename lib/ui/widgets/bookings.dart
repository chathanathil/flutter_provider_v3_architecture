import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/viewmodels/view/amount_view_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class TurfBooking extends StatefulWidget {
  final Map<dynamic, dynamic> booking;
  final String date;

  TurfBooking({this.booking, this.date});

  @override
  _TurfBookingState createState() => _TurfBookingState();
}

class _TurfBookingState extends State<TurfBooking> {
  final amountController = TextEditingController();
  SharedPreferences sp;

  // _createSlot(AmountViewModel model) {
  //   List<Widget> slot = List();
  //   widget.details.forEach((item) {
  //     slot.add(
  //       Card(
  //         elevation: 1,
  //         margin: EdgeInsets.all(10),
  //         child: Container(
  //           decoration: BoxDecoration(
  //               border: Border.all(
  //                   color: (item['cancelled']) == true
  //                       ? Colors.red
  //                       : Colors.white)),
  //           child: InkWell(
  //             onDoubleTap: () {
  //               model.setId(item['_id']);
  //               model.setDate(widget.date);
  //               Navigator.pushNamed(
  //                 context,
  //                 RoutePaths.AddAmount,
  //               );
  //             },
  //             child: ListTile(
  //               leading: Container(
  //                   margin: EdgeInsets.only(top: 10),
  //                   child: Text(item['time'])),
  //               title: Text(item['name']),
  //               subtitle: InkWell(child: SelectableText(item['phone'])),
  //               trailing: Container(
  //                   width: 180,
  //                   child: Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: <Widget>[
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: <Widget>[
  //                           Text("Created By"),
  //                           Text(item['createdBy']),
  //                         ],
  //                       ),
  //                       if (item['amount'] != null)
  //                         Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: <Widget>[
  //                               Text("Amount"),
  //                               Text(item['amount'].toString())
  //                             ]),
  //                       Text(item['team']),
  //                     ],
  //                   )),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  //   return slot;
  // }

  @override
  Widget build(BuildContext context) {
    // return BaseWidget<DashBoardViewModel>(
    //     model: DashBoardViewModel(api: Provider.of(context)),
    // onModelReady: (model) => model.getTurf(widget.date),
    //     builder: (context, model, child) => model.busy
    //         ? Center(
    //             child: CircularProgressIndicator(),
    //           )
    //         : ListView.builder(
    //             itemCount: model.bookings.length,
    //             itemBuilder: (context, index) => BookingCard(
    //               booking: model.bookings[index],
    //               onDoubleTap: () =>
    //                   Navigator.pushNamed(context, RoutePaths.AddAmount),
    //             ),
    //           ));
    return BaseWidget<AmountViewModel>(
        model: AmountViewModel(dashBoardService: Provider.of(context)),
        builder: (context, model, child) => Card(
              elevation: 1,
              margin: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: widget.booking['cancelled'] == true
                            ? Colors.red
                            : Colors.white)),
                child: InkWell(
                  onDoubleTap: () {
                    model.setId(widget.booking['_id']);
                    model.setDate(widget.date);
                    Navigator.pushNamed(
                      context,
                      RoutePaths.AddAmount,
                    );
                  },
                  child: ListTile(
                    leading: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(widget.booking['time'])),
                    title: Text(widget.booking['name']),
                    subtitle:
                        InkWell(child: SelectableText(widget.booking['phone'])),
                    trailing: Container(
                        width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Created By"),
                                Text(widget.booking['createdBy']),
                              ],
                            ),
                            if (widget.booking['amount'] != null)
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Amount"),
                                    Text(widget.booking['amount'].toString())
                                  ]),
                            Text(widget.booking['team']),
                          ],
                        )),
                  ),
                ),
              ),
            ));
  }
}
