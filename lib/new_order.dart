import 'package:akkerboomguesthouseapp/orderfoodtasl.dart';
import 'package:akkerboomguesthouseapp/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:akkerboomguesthouseapp/orderfoodtasl.dart';

class new_order extends StatefulWidget {
  new_order({Key? key}) : super(key: key);

  @override
  _new_orderState createState() => _new_orderState();
}

class _new_orderState extends State<new_order> {
  String? dropDownRooms = "100";
  //final dropDownRoom=[["1059","1602","1603"];
  var _currencies = [
    "Cheese Toast Sandwhich",
    "Vegetable Wrap",
    "Chocolate Cake",
    "Mutton Bunny",
    "Cheese Burger",
    "Chicken Mayo"
  ];
  var items = [
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110"
  ];
  OrderFood orderFood = new OrderFood();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _food = TextEditingController();
  TextEditingController _roomnum = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _specialController = TextEditingController();
  var _dropdownvalue;
  DateTime selectedDate = DateTime.now();
  DateTime sDate = DateTime.now();
  void _createOrder(String name, String roomnum,
      String food, String specialRequests) {
    FirebaseFirestore.instance
        .collection('Roomservice')
        .add({'Room_num': roomnum,'Name':name,'food':food,'Special Request':specialRequests});

  }


  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownvalue = selectedValue;
      });
    }
  }

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
        _food.text = date;
      });
  }

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Order Recieved!'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Your Order has been recieved thank you!'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                controller: _nameController,
                onSaved: (val) => orderFood.Food = val.toString(),
                decoration: InputDecoration(
                  labelText: 'Name and Surname',
                  icon: Icon(Icons.numbers_rounded),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) return "Enter your name";
                  return null;
                },
              ),
              TextFormField(
                controller: _roomnum,
                onSaved: (val) => orderFood.Roomnum = val.toString(),
                decoration: InputDecoration(
                  labelText: 'Room Number',
                  labelStyle: TextStyle(),
                  icon: Icon(Icons.add),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty || value !=null && int.parse(value)>8)
                    return "Please enter valid room number";
                  return null;
                },
              ),
              Row(
                children: [
                  Icon(Icons.add_business),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButton<String>(
                          value: _dropdownvalue,
                          items: const [
                            DropdownMenuItem(
                              child: Text("Chicken Sandwhich"),
                              value: "Chicken Sandwhich",
                            ),
                            DropdownMenuItem(
                              child: Text("Cheese Burger"),
                              value: "Cheese Burger",
                            ),
                            DropdownMenuItem(
                              child: Text("Chocolate Cake"),
                              value: "Chocolate Cake",
                            ),
                            DropdownMenuItem(
                              child: Text("Cheese Sandwhich"),
                              value: "Cheese Sandwhich",
                            ),
                            DropdownMenuItem(
                              child: Text("Eggs and Bacon"),
                              value: "Eggs and Bacon",
                            ),
                          ],
                          onChanged: dropdownCallback)
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _specialController,
                onSaved: (val) => orderFood.Specialrequest = val.toString(),
                decoration: InputDecoration(
                  labelText: 'Special Request',
                  icon: Icon(Icons.note),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              FlatButton(
                child: Text("Submit"),
                textColor: Colors.white,
                color: Colors.lightGreen,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _createOrder(_nameController.text, _roomnum.text, _dropdownvalue,_specialController.text);
                    _roomnum.clear();
                    _specialController.clear();
                    _nameController.clear();

                    _showcontent();
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
