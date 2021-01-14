import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/models/Event.dart';
import 'package:taskpad/src/screens/event/EventDetailsScreen.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier {
  List<Event> _listOfEvents = [];

  List<Event> get listOfEvents => _listOfEvents;

  addEvents(BuildContext context, Event event) {
    _listOfEvents.add(event);
    notifyListeners();
    redirect(context, event);
  }

  updateEvent(BuildContext context, Event oldEventData, Event newEventData) {
    _listOfEvents.removeWhere((element) => element == oldEventData);
    addEvents(context, newEventData);
  }

  redirect(BuildContext context, Event event) {
    Navigator.pop(context);
    Functions.redirect(context, EventDetailsScreen(event: event));
  }
}
