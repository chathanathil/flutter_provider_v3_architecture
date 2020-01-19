import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_management/core/viewmodels/view/team_details_model.dart';
import 'package:turf_management/ui/views/base_widget.dart';

class TeamDetailsView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> teamData = {"name": "", "phone": "", "createdBy": ""};

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TeamDetailsModel>(
        model: TeamDetailsModel(matchService: Provider.of(context)),
        child: Image.asset(
          "assets/logo.png",
          height: 250,
        ),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Team Details",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 15),
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Name',
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Name of the team';
                                }
                              },
                              onSaved: (value) {
                                teamData['name'] = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Phone',
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Phone number of the team';
                                }
                              },
                              onSaved: (value) {
                                teamData['phone'] = value;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 15),
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Created By',
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter your name';
                                }
                              },
                              onSaved: (value) {
                                teamData['createdBy'] = value;
                              },
                            ),
                          ),
                          model.busy
                              ? CircularProgressIndicator()
                              : RaisedButton(
                                  child: Text("Submit"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 8.0),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      .color,
                                  onPressed: () {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    }
                                    _formKey.currentState.save();
                                    model.setTeamDetails(
                                        teamData['name'],
                                        teamData['phone'],
                                        teamData['createdBy']);
                                    model.bookMatch(context);
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
