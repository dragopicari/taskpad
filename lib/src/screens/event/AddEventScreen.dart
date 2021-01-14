import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/common/widget/TextFormField.dart';
import 'package:taskpad/src/models/Event.dart';
import 'package:taskpad/src/services.dart/providers/EventProvider.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  final Event event;

  const AddEventScreen({@required this.event});

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventPlaceController = TextEditingController();
  final TextEditingController eventCountryController = TextEditingController();
  final TextEditingController eventCrwdNrController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String selectedTime = "";

  @override
  void initState() {
    if (widget.event != null) {
      eventNameController.value =
          TextEditingValue(text: widget.event.eventName);
      eventPlaceController.value =
          TextEditingValue(text: widget.event.eventPlace);
      eventCountryController.value =
          TextEditingValue(text: widget.event.eventCountry);
      eventCrwdNrController.value =
          TextEditingValue(text: widget.event.crwNumber);

      selectedTime = widget.event.eventTime;
    }
    super.initState();
  }

  @override
  void dispose() {
    eventNameController.dispose();
    eventPlaceController.dispose();
    eventCountryController.dispose();
    eventCrwdNrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: deepGrey,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: new BoxDecoration(color: deepGrey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20, bottom: 30),
                child: Text(
                  "Add an event",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: field(
                              Emojis.nameBadge,
                              false,
                              eventNameController,
                              false,
                              TextInputType.name,
                              TextInputAction.next,
                              "Insert event name",
                              false,
                              null,
                            ),
                          ),
                          field(
                            Emojis.triangularFlag,
                            false,
                            eventPlaceController,
                            false,
                            TextInputType.name,
                            TextInputAction.next,
                            "Insert event place",
                            false,
                            null,
                          ),
                          field(
                            Emojis.globeShowingAmericas,
                            false,
                            eventCountryController,
                            false,
                            TextInputType.name,
                            TextInputAction.next,
                            "Insert event country",
                            false,
                            null,
                          ),
                          field(
                            Emojis.family,
                            false,
                            eventCrwdNrController,
                            false,
                            TextInputType.number,
                            TextInputAction.next,
                            "Insert number of partecipants",
                            true,
                            () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Emojis.timerClock,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Container(
                                    height: 50,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      color: deepGrey,
                                      onPressed: () async {
                                        String time =
                                            await Functions.selectTime(context);

                                        setState(() {
                                          selectedTime = time;
                                        });
                                      },
                                      child: Text(
                                        widget.event != null
                                            ? widget.event.eventTime
                                            : selectedTime != ""
                                                ? selectedTime
                                                : "Select event hour",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              width: size.width / 1.2,
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                color: whiteAmber,
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();

                                  if (!globalKey.currentState.validate() ||
                                      selectedTime == "") {
                                    Functions.returnDialog(
                                      context,
                                      "Please fill all the data",
                                      true,
                                    );
                                  } else {
                                    Event event = Event(
                                      eventNameController.text,
                                      eventPlaceController.text,
                                      eventCountryController.text,
                                      eventCrwdNrController.text,
                                      selectedTime,
                                    );

                                    if (widget.event != null) {
                                      eventProvider.updateEvent(
                                          context, widget.event, event);
                                    } else {
                                      eventProvider.addEvents(context, event);
                                    }
                                  }
                                },
                                child: Text(
                                  widget.event != null
                                      ? "SAVE AND CONTINUE"
                                      : "UPDATE AND CONTINUE",
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget field(
    String emojy,
    bool isForTaskScreen,
    TextEditingController inputController,
    bool obscuredText,
    TextInputType inputType,
    TextInputAction inputAction,
    String inputHint,
    bool isFinalInput,
    VoidCallback actionToPerform,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            emojy,
            style: TextStyle(fontSize: 30),
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            isForTaskScreen: isForTaskScreen,
            inputController: inputController,
            obscuredText: obscuredText,
            inputType: inputType,
            inputAction: inputAction,
            inputHint: inputHint,
            isFinalInput: isFinalInput,
            actionToPerform: actionToPerform,
            bgColor: deepGrey,
            hintColor: lightGrey,
            textFieldColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
