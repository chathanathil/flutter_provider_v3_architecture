import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/viewmodels/view/select_turf_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class SelectTurfView extends StatelessWidget {
  void _next(BuildContext context, String team, SelectTurfModel model) {
    model.setTurf(team);
    Navigator.pushNamed(context, RoutePaths.TeamDetails);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SelectTurfModel>(
        model:
            SelectTurfModel(matchService: Provider.of(context, listen: false)),
        onModelReady: (model) => model.getSlots(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Select",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    model.busy
                        ? CircularProgressIndicator()
                        : Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: <Widget>[
                                      if (model.slots['msg'] != null)
                                        Text(model.slots['msg']),
                                      if (model.slots['1'] != null)
                                        SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: Card(
                                            child: InkWell(
                                              onTap: () => _next(context,
                                                  model.slots["1"], model),
                                              child: Center(
                                                  child:
                                                      Text(model.slots["1"])),
                                            ),
                                          ),
                                        ),
                                      if (model.slots['2'] != null)
                                        SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: Card(
                                            child: InkWell(
                                              onTap: () => _next(context,
                                                  model.slots["2"], model),
                                              child: Center(
                                                  child:
                                                      Text(model.slots["2"])),
                                            ),
                                          ),
                                        ),
                                      if (model.slots['3'] != null)
                                        SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: Card(
                                            child: InkWell(
                                              onTap: () => _next(context,
                                                  model.slots["3"], model),
                                              child: Center(
                                                  child:
                                                      Text(model.slots["3"])),
                                            ),
                                          ),
                                        ),
                                      if (model.slots['4'] != null)
                                        SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: Card(
                                            child: InkWell(
                                              onTap: () => _next(context,
                                                  model.slots["4"], model),
                                              child: Center(
                                                  child:
                                                      Text(model.slots["4"])),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                  // }
                                  // }
                                }),
                          ),
                    // Text("model.time"),
                  ],
                ),
              ),
            ));
  }
}
