import 'package:akkerboomguesthouseapp/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:intl/intl.dart';

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
  TextEditingController _numguestController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _specialController = TextEditingController();
  TextEditingController _dateinput = TextEditingController();
  TextEditingController _dateoutput = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime sDate=DateTime.now();
  void _createBooking(String numberofguests,String Checkindate,String CheckOutdate , String guestname ,String specialRequests) {


    FirebaseFirestore.instance
        .collection('bookings')
        .add({'CheckOutdate': CheckOutdate});
    FirebaseFirestore.instance
        .collection('bookings')
        .add({'numberofguests': numberofguests});
    FirebaseFirestore.instance
        .collection('bookings')
        .add({'Checkindate': Checkindate});
    FirebaseFirestore.instance
        .collection('bookings')
        .add({'guestname':  guestname});
    FirebaseFirestore.instance
        .collection('bookings')
        .add({'specialRequests': specialRequests});

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
        _dateController.text = date;
      });
  }
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Booking Recieved!'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Your Booking has been recieved thank you!'),
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
                controller: _numguestController,
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

              TextFormField(
                controller: _dateinput,
                decoration: const InputDecoration(
                  labelText: "Date",

                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      _dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              TextFormField(
                controller: _dateoutput,
                decoration: const InputDecoration(
                  labelText: "Date",

                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      _dateoutput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ) ,
              TextFormField(
                controller: _specialController,
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
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _numguestController.clear();
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