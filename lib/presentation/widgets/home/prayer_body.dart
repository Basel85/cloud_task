import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/presentation/cubits/calendar/calendar_cubit.dart';
import 'package:quran_app/presentation/cubits/calendar/calendar_states.dart';
import 'package:quran_app/presentation/widgets/prayer/prayer_times_component.dart';
import 'package:quran_app/presentation/widgets/prayer/selected_and_today_day_builder.dart';
import 'package:quran_app/utils/app_assets.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:table_calendar/table_calendar.dart';

class PrayerBody extends StatelessWidget {
  static final EdgeInsetsGeometry horizontalMargin =
      EdgeInsets.symmetric(horizontal: 32 * SizeConfig.horizontalBlock);
  const PrayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 44 * SizeConfig.verticalBlock,
          ),
          Container(
            margin: horizontalMargin,
            height: 298 * SizeConfig.verticalBlock,
            decoration: const ShapeDecoration(
              color: AppThemes.color0xFFE5B6F2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: BlocBuilder<CalendarCubit, CalendarState>(
              buildWhen: (previous, current) =>
                  current is CalendarDaySelectedState,
              builder: (_, state) => TableCalendar(
                calendarBuilders: CalendarBuilders(
                  selectedBuilder: (_, day, focusedDay) =>
                      SelectedAndTodayDayBuilder(
                    day: day,
                    isToday: false,
                  ),
                  todayBuilder: (_, day, focusedDay) =>
                      SelectedAndTodayDayBuilder(
                    day: day,
                  ),
                ),
                daysOfWeekHeight: 20 * SizeConfig.verticalBlock,
                rowHeight: 30 * SizeConfig.verticalBlock,
                calendarStyle: CalendarStyle(
                    weekendTextStyle: AppThemes
                        .fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500,
                    defaultTextStyle: AppThemes
                        .fontFamilyPoppinsPureBlackFontSize11FontWeightW500,
                    outsideDaysVisible: false,
                    tablePadding: EdgeInsets.only(
                      left: 13 * SizeConfig.horizontalBlock,
                      right: 13 * SizeConfig.horizontalBlock,
                    ),
                    weekNumberTextStyle: AppThemes
                        .fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: AppThemes
                        .fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500,
                    weekendStyle: AppThemes
                        .fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500),
                headerStyle: HeaderStyle(
                    titleTextFormatter: (date, locale) =>
                        DateFormat.yMMM(locale).format(date),
                    headerMargin: EdgeInsets.only(
                        top: 6 * SizeConfig.verticalBlock,
                        bottom: 16 * SizeConfig.verticalBlock),
                    leftChevronPadding: EdgeInsets.zero,
                    rightChevronPadding: EdgeInsets.zero,
                    leftChevronIcon: FaIcon(
                      FontAwesomeIcons.circleChevronLeft,
                      color: AppThemes.color0xFF484848,
                      size: 20 * SizeConfig.verticalBlock,
                    ),
                    rightChevronIcon: FaIcon(
                      FontAwesomeIcons.circleChevronRight,
                      color: AppThemes.color0xFF484848,
                      size: 20 * SizeConfig.verticalBlock,
                    ),
                    leftChevronMargin: EdgeInsets.only(
                        left: 86 * SizeConfig.horizontalBlock,
                        right: 15 * SizeConfig.horizontalBlock),
                    rightChevronMargin: EdgeInsets.only(
                        right: 85 * SizeConfig.horizontalBlock,
                        left: 15 * SizeConfig.horizontalBlock),
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: AppThemes
                        .fontFamilyPoppinsColor0xFF484848FontSize18FontWeightW700),
                focusedDay: state is CalendarDaySelectedState
                    ? state.focusedDay
                    : DateTime.now(),
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(DateTime.now().year + 10),
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) {
                  return isSameDay(
                      state is CalendarDaySelectedState
                          ? state.focusedDay
                          : DateTime.now(),
                      day);
                },
                onDaySelected: (selectedDay, focustedDay) {
                  if (!isSameDay(
                      state is CalendarDaySelectedState
                          ? state.focusedDay
                          : DateTime.now(),
                      selectedDay)) {
                    CalendarCubit.get(context).selectDay(selectedDay);
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 18 * SizeConfig.verticalBlock,
          ),
          Container(
              margin: horizontalMargin,
              padding: EdgeInsets.only(
                  top: 14 * SizeConfig.verticalBlock,
                  left: 17 * SizeConfig.horizontalBlock,
                  right: 17 * SizeConfig.horizontalBlock,
                  bottom: 20 * SizeConfig.verticalBlock),
              decoration:
                  AppThemes.color0xFFE5B6F2BorderRadiusTopLeft20BottomRight20,
              child: Wrap(
                spacing: 17 * SizeConfig.horizontalBlock,
                runSpacing: 20 * SizeConfig.verticalBlock,
                alignment: WrapAlignment.spaceAround,
                children: const [
                  PrayerTimesComponent(prayer: "Fajr"),
                  PrayerTimesComponent(prayer: "Zuhr"),
                  PrayerTimesComponent(prayer: "Asr"),
                  PrayerTimesComponent(prayer: "Maghrib"),
                  PrayerTimesComponent(prayer: "Isha"),
                ],
              )),
          SizedBox(
            height: 14 * SizeConfig.verticalBlock,
          ),
          Container(
            margin: horizontalMargin,
            padding: EdgeInsets.only(
                left: 19 * SizeConfig.horizontalBlock,
                right: 28 * SizeConfig.horizontalBlock,
                top: 21 * SizeConfig.verticalBlock,
                bottom: 21 * SizeConfig.verticalBlock),
            decoration:
                AppThemes.color0xFFE5B6F2BorderRadiusTopLeft20BottomRight20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Direction",
                  textAlign: TextAlign.center,
                  style: AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize12FontWeightW700,
                ),
                SvgPicture.asset(
                  AppAssets.directionIcon,
                  width: 23 * SizeConfig.horizontalBlock,
                  height: 23 * SizeConfig.verticalBlock,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
