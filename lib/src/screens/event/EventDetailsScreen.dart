import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/common/widget/DetailsScreen.dart';
import 'package:taskpad/src/models/Event.dart';
import 'package:flutter/material.dart';

import 'AddEventScreen.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({@required this.event});

  @override
  Widget build(BuildContext context) {
    return DetailsScreen(
      appBarImage:
          "https://png.pngtree.com/png-clipart/20191228/ourmid/pngtree-office-event-calendar-plan-png-image_2096035.jpg",
      title: "Your Event Details : ",
      child: listTile(context),
    );
  }

  Widget listTile(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: Text(
              event.eventName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Place : " +
                      event.eventPlace +
                      "  Country : " +
                      event.eventCountry),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Time of event : ",
                        style: TextStyle(
                          color: deepGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: event.eventTime,
                          style: TextStyle(color: Colors.amber)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Number of partecipants : ",
                        style: TextStyle(
                          color: deepGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: event.crwNumber,
                          style:
                              TextStyle(color: Colors.blue.withOpacity(0.5))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      color: whiteAmber,
                      onPressed: () {
                        Navigator.pop(context);
                        Functions.redirect(
                            context, AddEventScreen(event: event));
                      },
                      child: Text(
                        "UPDATE EVENT",
                        style: TextStyle(
                          color: deepGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
