import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/features/home/data/models/event_model.dart';
import 'package:prize/features/home/view/widgets/other_events/event_widget.dart';

class AllEventsWidget extends StatelessWidget {
  const AllEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<EventModel> events = [
      EventModel(
        speakerImage:
            'https://cdn.pixabay.com/photo/2023/06/23/11/23/ai-generated-8083323_1280.jpg',
        speakerName: "Mostfa Omar",
        eventTitle: LocaleKeys.home_other_events_event_model_title.tr(),
        date: DateTime.now(),
      ),
      EventModel(
        speakerImage:
            'https://cdn.pixabay.com/photo/2023/06/23/11/23/ai-generated-8083323_1280.jpg',
        speakerName: "Ali Ahmed",
        eventTitle: LocaleKeys.home_other_events_event_model_title.tr(),
        date: DateTime.now(),
      ),
      EventModel(
        speakerImage:
            'https://cdn.pixabay.com/photo/2023/06/23/11/23/ai-generated-8083323_1280.jpg',
        speakerName: "Omar Ahmed",
        eventTitle: LocaleKeys.home_other_events_event_model_title.tr(),
        date: DateTime.now(),
      ),
    ];
    return ListView.builder(
      itemCount: events.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => EventWidget(
        event: events[index],
      ),
    );
  }
}
