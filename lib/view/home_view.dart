import 'dart:math';

import 'package:flight/api/api.dart';
import 'package:flight/model/flight_model.dart';
import 'package:flight/util/my_dotted_line.dart';
import 'package:flight/util/my_time.dart';
import 'package:flight/util/mydate.dart';
import 'package:flight/util/style.dart';
import 'package:flight/widgets/myrow.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: FutureBuilder<flightModel?>(
        future: Api.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Some Error contact to devloper"),
            );
          } else {
            var data = snapshot.data as flightModel;
            return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: height * .3,
                      child: Image.asset(
                        "assets/images/image.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * .16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  data.data![0].legs![0].originCity.toString(),
                                  style: MyStyle.whitelight,
                                ),
                                Text(
                                  data.data![0].legs![0].origin.toString(),
                                  style: MyStyle.whitedark,
                                ),
                                Text(
                                  MyTime.mytime(
                                    data.data![0].legs![0].estimatedDeparture
                                        .toString(),
                                  ),
                                  style: MyStyle.whitelight,
                                ),
                              ],
                            ),
                            SizedBox(
                                width: width * .3, child: const MySeparator()),
                            Transform.rotate(
                              angle: 90 * pi / 180,
                              child: const Icon(
                                Icons.flight,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  data.data![0].legs![0].destinationCity
                                      .toString(),
                                  style: MyStyle.whitelight,
                                ),
                                Text(
                                  data.data![0].legs![0].destination.toString(),
                                  style: MyStyle.whitedark,
                                ),
                                Text(
                                  MyTime.mytime(
                                    data.data![0].legs![0].estimatedArrival
                                        .toString(),
                                  ),
                                  style: MyStyle.whitelight,
                                ),
                              ],
                            ),
                          ]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    width: width * .8,
                    child: const Center(
                      child: Text(
                        "Yay! Your flight is on time ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Passenger Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 35),
                    child: Text(
                      "Sinku Rajendra Kumar",
                      style: MyStyle.dark,
                    ),
                  ),
                ),
                MyRow(
                    one: "Dep Terminal",
                    two: data.data![0].legs![0].departureTerminal.toString(),
                    three: "Gate",
                    four: "C3",
                    five: "Arr. Terminal",
                    six: data.data![0].legs![0].arrivalTerminal.toString()),
                const SizedBox(
                  height: 20,
                ),
                MyRow(
                    one: "Date",
                    two: MyDate.myDate(
                        data.data![0].legs![0].estimatedDeparture.toString()),
                    three: "Flight Status",
                    four: data.data![0].legs![0].flightState.toString(),
                    five: "Flight",
                    six: data.data![0].legs![0].flightIdentifier.toString()),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: MySeparator(
                    dashCount: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
