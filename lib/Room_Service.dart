import 'package:akkerboomguesthouseapp/Room_Cleaning.dart';
import 'package:flutter/material.dart';
import 'package:akkerboomguesthouseapp/ServiceCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:akkerboomguesthouseapp/Service.dart';
import 'package:akkerboomguesthouseapp/main.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=> const RoomService(),
      "/Service":(context)=> const Service(),
      "/Room_cleaning":(context)=> const Room_cleaning(),
    },
  ));
}
class RoomService extends StatefulWidget {
  const RoomService({Key? key}) : super(key: key);

  @override
  State<RoomService> createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {
  _launchURLBrowser() async {
    print("in");
    var url = Uri.parse(
        "https://www.google.co.za/maps/place/Akkerboom+Guesthouse/@-25.8678951,28.1864671,17z/data=!3m1!4b1!4m5!3m4!1s0x1e9565cc7be1c08b:0xd1eeebb0527bf87a!8m2!3d-25.8678856!4d28.1886171");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void handleCard(int index) {
    String ServiceName = Services[index].name;

    switch (ServiceName) {
      case "Nearby Attractions":
        {
          _launchURLBrowser();
        }
        break;
      case "Order Food":
        {
          Navigator.pushNamed(context, "/Service", arguments: ServiceName);
        }
        break;
      case "Maintenance":
        {
          Navigator.pushNamed(context, "/Service", arguments: ServiceName);
        }
        break;
      case "Cleaning And Laundry":
        {
          Navigator.pushNamed(context, "/Room_cleaning");
        }
        break;

      default:
        {
          return;
        }
    }
  }

  List<ServiceCard> Services = [
    ServiceCard(name: "Order Food", icon: Icons.fastfood),
    ServiceCard(name: "Maintenance", icon: Icons.car_repair),
    ServiceCard(
        name: "Cleaning And Laundry", icon: Icons.cleaning_services_sharp),
    ServiceCard(name: "Nearby Attractions ", icon: Icons.place),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Room Service",
            style: TextStyle(),
          ),
        ),
      ),
      body: Container(
        child: Container(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                children: List.generate(
                  Services.length,
                      (index) => SizedBox(
                    height: 100.0,
                    child: InkWell(
                      onTap: () {
                        handleCard(index);
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 60.0,
                                  child: Icon(
                                    Services[index].icon,
                                    size: 60.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  Services[index].name,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            )),
      ),
    );
  }
}

// You can pass any object to the arguments parameter.

// In this example, create a class that contains both

// a customizable title and message.