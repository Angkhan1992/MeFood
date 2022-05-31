import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverStatus extends StatelessWidget {
  final Function()? onTap;

  const DriverStatus({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ready for Ride',
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 2.0),
              Row(
                children: [
                  Text(
                    'SOON',
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DriverCalendar extends StatelessWidget {
  final Function()? onTapBack;
  final Function()? onTapForward;
  final Function()? onTapCalendar;

  DriverCalendar({
    Key? key,
    this.onTapBack,
    this.onTapForward,
    this.onTapCalendar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          InkWell(
            onTap: onTapBack,
            child: SvgPicture.asset(
              'assets/icons/ic_back.svg',
              width: 18.0,
              height: 18.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          InkWell(
            onTap: onTapCalendar,
            child: SvgPicture.asset(
              'assets/icons/ic_calendar.svg',
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          InkWell(
            onTap: onTapForward,
            child: SvgPicture.asset(
              'assets/icons/ic_next.svg',
              width: 18.0,
              height: 18.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
