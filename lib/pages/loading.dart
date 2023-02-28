import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String? Temperature = "loading";

  String? city = "Kolkata";
  String? temp;
  String? hum;
  String? airSpeed;
  String? desc;
  String? main;
  String? icon;

  void startApp(String? city) async {
    Worker instance = Worker(location: "$city");
    await instance.getData();

    /*print(instance.air_speed);
    print(instance.description);*/

    /* setState(() {
      Temperature = instance.temp;
    });*/

    temp = instance.temp;
    hum = instance.humidity;
    airSpeed = instance.airSpeed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {
            "temp_value": temp,
            "hum_value": hum,
            "air_speed_value": airSpeed,
            "des_value": desc,
            "main_value": main,
            "city_value": city,
            "icon_value": icon,
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      search = ModalRoute.of(context)!.settings.arguments as Map;
    }
    if (search != null) {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 180,
              ),
              Image.asset(
                "images/download.jpg",
                height: 240,
                width: 240,
              ),
              const Text(
                "Weather App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Made By Riya",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const SpinKitWave(
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
