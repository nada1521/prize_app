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
            'https://scontent.fcai19-11.fna.fbcdn.net/v/t39.30808-1/484433372_611971701821074_6534602678444115531_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=105&ccb=1-7&_nc_sid=1d2534&_nc_ohc=M8AHQ14Khf0Q7kNvwHnm5xH&_nc_oc=AdliMK6KO7LpRjYsbNg1xGWPtEKyjnsIomO5WW9vpcU_NwUPLImNYdt8Ot34jf8aWuY&_nc_zt=24&_nc_ht=scontent.fcai19-11.fna&_nc_gid=P5vZBcXVWB50UOvyUSgxnQ&oh=00_AfPLs-RaVsV7cmhTBUI0asM62K4l4JBgajYUyBZDdoDt0A&oe=6864B99C',
        speakerName: "Mostfa Omar",
        eventTitle: LocaleKeys.home_other_events_event_model_title.tr(),
        date: DateTime.now(),
      ),
      EventModel(
        speakerImage:
            'https://scontent.fcai19-11.fna.fbcdn.net/v/t39.30808-1/484433372_611971701821074_6534602678444115531_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=105&ccb=1-7&_nc_sid=1d2534&_nc_ohc=M8AHQ14Khf0Q7kNvwHnm5xH&_nc_oc=AdliMK6KO7LpRjYsbNg1xGWPtEKyjnsIomO5WW9vpcU_NwUPLImNYdt8Ot34jf8aWuY&_nc_zt=24&_nc_ht=scontent.fcai19-11.fna&_nc_gid=P5vZBcXVWB50UOvyUSgxnQ&oh=00_AfPLs-RaVsV7cmhTBUI0asM62K4l4JBgajYUyBZDdoDt0A&oe=6864B99C',
        speakerName: "Ali Ahmed",
        eventTitle:  LocaleKeys.home_other_events_event_model_title.tr(),
        date: DateTime.now(),
      ),
      EventModel(
        speakerImage:
            'https://scontent.fcai19-11.fna.fbcdn.net/v/t39.30808-1/484433372_611971701821074_6534602678444115531_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=105&ccb=1-7&_nc_sid=1d2534&_nc_ohc=M8AHQ14Khf0Q7kNvwHnm5xH&_nc_oc=AdliMK6KO7LpRjYsbNg1xGWPtEKyjnsIomO5WW9vpcU_NwUPLImNYdt8Ot34jf8aWuY&_nc_zt=24&_nc_ht=scontent.fcai19-11.fna&_nc_gid=P5vZBcXVWB50UOvyUSgxnQ&oh=00_AfPLs-RaVsV7cmhTBUI0asM62K4l4JBgajYUyBZDdoDt0A&oe=6864B99C',
        speakerName: "Omar Ahmed",
        eventTitle:  LocaleKeys.home_other_events_event_model_title.tr(),
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
