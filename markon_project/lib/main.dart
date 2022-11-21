import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:markon_project/helper/customAppBar.dart';

import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/helper/locator.dart';
import 'package:markon_project/route_generator.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Markon'),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_getCurrentLocation();
    });

    super.initState();
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    setState(() {
      _currentPosition = position;
      _getAddressFromLatLng();
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude,
          localeIdentifier: "id");

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.street} ${place.thoroughfare}  ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  //${place.subThoroughfare},

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBarMarkon(
          rightPadding: context.deviceWidth(0.2),
          leftPadding: context.deviceWidth(0.2),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.list),
                  Spacer(),
                  Text(
                    'One',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.next_plan)
                ],
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Location  = ${_currentAddress}',
              ),
              SizedBox(height: context.deviceHeight(0.05)),
              CustomButtonWithFreeColor(
                buttonHeight: context.deviceHeight(0.05),
                buttonWidth: context.deviceWidth(0.6),
                radius: context.deviceHeight(0.01),
                title: 'Get Current Location',
                color: Colors.black,
                textColor: Colors.amber,
                onTap: () {
                  _getCurrentLocation();
                },
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
