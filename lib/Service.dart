import 'package:flutter/material.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 7,
              decoration: InputDecoration(
                labelText: title=="Order Food"?"Your Order":"Issues",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Room Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
                onPressed: () {},
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size.fromHeight(
                      40), // fromHeight use double.infinity as width and 40 is the height
                ))
          ],
        ),
      ),
    );
  }
}