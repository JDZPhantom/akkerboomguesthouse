import 'package:akkerboomguesthouseapp/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTaskForm extends StatefulWidget {
  NewTaskForm({Key ?key}) : super(key: key);

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  String? dropDownRooms="100";
  //final dropDownRoom=[["1059","1602","1603"];
  var items=["101","102","103","104","105","106","107","108","109","110"];
  Task task = new Task();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime sDate=DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Column(
            children: [
              TextFormField(
                onSaved: (val) => task.RoomNo = val.toString(),
                decoration: InputDecoration(
                  labelText: 'Name and Surname',
                  icon: Icon(Icons.numbers_rounded),
                ),
                validator: (value) {
                  if (value!=null && value.isEmpty)
                    return "Enter your name";
                  return null;
                },
              ),
              TextFormField(
                onSaved: (val) => task.NoOfGuest = val.toString(),
                decoration: InputDecoration(
                  labelText: 'Number of Guests',
                  labelStyle: TextStyle(
                  ),
                  icon: Icon(Icons.add),
                ),
                validator: (value) {
                  if (value!=null && value.isEmpty)
                    return "Please enter number of guest";
                  return null;
                },
              ),

              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    onSaved: (val) {
                      task.dateIn = selectedDate;
                    },
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Check In Date",
                      icon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value!=null && value.isEmpty)
                        return "Please enter your check in date";
                      return null;
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    onSaved: (val) {
                      task.dateOut = selectedDate;
                    },
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Check Out Date",
                      icon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value!=null && value.isEmpty)
                        return "Please enter your check out date";
                      return null;
                    },
                  ),
                ),
              ),
              TextFormField(
                onSaved: (val) => task.SpecialRequest = val.toString(),
                decoration: InputDecoration(
                  labelText: 'Special Request',
                  icon: Icon(Icons.note),
                ),
              ),

              SizedBox(height: 100,),



              FlatButton(
                child: Text("Submit"),
                textColor: Colors.white,
                color: Colors.lightGreen,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}