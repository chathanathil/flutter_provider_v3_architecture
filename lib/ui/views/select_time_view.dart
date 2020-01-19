import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/viewmodels/view/select_time_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class SelectTimeView extends StatelessWidget {
  void _next(BuildContext context, String time, SelectTimeModel model) {
    model.setTime(time);
    Navigator.pushNamed(context, RoutePaths.SelectTurf);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SelectTimeModel>(
        model: SelectTimeModel(matchService: Provider.of(context)),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Select time",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "6am to 7 am", model),
                                  child: Center(child: Text("6am to 7am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "7am to 8am", model),
                                  child: Center(child: Text("7am to 8am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "8am to 9am", model),
                                  child: Center(child: Text("8am to 9am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "9am to 10am", model),
                                  child: Center(child: Text("9am to 10am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "10am to 11am", model),
                                  child: Center(child: Text("10am to 11am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "11am to 12pm", model),
                                  child: Center(child: Text("11am to 12pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "12pm to 1pm", model),
                                  child: Center(child: Text("12pm to 1pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "1pm to 2pm", model),
                                  child: Center(child: Text("1pm to 2pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "2pm to 3pm", model),
                                  child: Center(child: Text("2pm to 3pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "3pm to 4pm", model),
                                  child: Center(child: Text("3pm to 4pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "4pm to 5pm", model),
                                  child: Center(child: Text("4pm to 5pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "5pm to 6pm", model),
                                  child: Center(child: Text("5pm to 6pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "6pm to 7pm", model),
                                  child: Center(child: Text("6pm to 7pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "7pm to 8pm", model),
                                  child: Center(child: Text("7pm to 8pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "8pm to 9pm", model),
                                  child: Center(child: Text("8pm to 9pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "9pm to 10pm", model),
                                  child: Center(child: Text("9pm to 10pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "10pm to 11pm", model),
                                  child: Center(child: Text("10pm to 11pm")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "11pm to 12am", model),
                                  child: Center(child: Text("11pm to 12am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "12am to 1am", model),
                                  child: Center(child: Text("12am to 1am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "1am to 2am", model),
                                  child: Center(child: Text("1am to 2am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "2am to 3am", model),
                                  child: Center(child: Text("2am to 3am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "3am to 4am", model),
                                  child: Center(child: Text("3am to 4am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "4am to 5am", model),
                                  child: Center(child: Text("4am to 5am")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: Card(
                                child: InkWell(
                                  onTap: () =>
                                      _next(context, "5am to 6am", model),
                                  child: Center(child: Text("5am to 6am")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
