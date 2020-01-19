import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_management/core/viewmodels/view/amount_view_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class AmountView extends StatefulWidget {
  @override
  _AmountViewState createState() => _AmountViewState();
}

class _AmountViewState extends State<AmountView> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AmountViewModel>(
      model: AmountViewModel(dashBoardService: Provider.of(context)),
      child: Image.asset(
        "assets/logo.png",
        height: 250,
      ),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 90),
                      child: Text(
                        "Received Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 250,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Amount'),
                            controller: amountController,
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          color: Theme.of(context).primaryColor,
                          textColor:
                              Theme.of(context).primaryTextTheme.button.color,
                          onPressed: () => {
                            model.addAmount(amountController.text, context),
                          },
                          child: Text("Add"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              if (model.busy) CircularProgressIndicator(),
              RaisedButton.icon(
                icon: Icon(Icons.delete),
                label: Text("Cancel booking"),
                onPressed: () => model.cancelMatch(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
