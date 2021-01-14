import 'package:apey/src/common/widget/ListScreenBottmBar.dart';
import 'package:apey/src/services.dart/providers/EventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = Provider.of<EventProvider>(context);

    return ListScreenBottmBar(
      cntList: eventProvider.listOfEvents,
      isEventList: true,
      title: "Event list",
    );
  }
}
