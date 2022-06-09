import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mefood/generated/l10n.dart';

class HistoryPage extends StatelessWidget {
  final DateTime initDate;

  const HistoryPage({
    Key? key,
    required this.initDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          _currentDate(context),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16.0,
              ),
              Text(
                'Today\'s Order 0',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              const Spacer(),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < 20; i++) ...{
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_distance.svg',
                            width: 18.0,
                            height: 18.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '0.00 Km',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/ic_coin.svg',
                            width: 18.0,
                            height: 18.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '0,000 LAK',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _currentDate(BuildContext context) {
    var radius = 12.0;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            alignment: Alignment.center,
            child: _dateWidget(context, type: 0),
          ),
        ),
        const SizedBox(
          width: 2.0,
        ),
        Expanded(
          child: Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
            ),
            alignment: Alignment.center,
            child: _dateWidget(context, type: 1),
          ),
        ),
        const SizedBox(
          width: 2.0,
        ),
        Expanded(
          child: Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
              ),
            ),
            alignment: Alignment.center,
            child: _dateWidget(context, type: 2),
          ),
        ),
      ],
    );
  }

  Widget _dateWidget(
    BuildContext context, {
    required int type,
  }) {
    var titles = [
      S.current.day,
      S.current.month,
      S.current.year,
    ];
    var date = [
      DateFormat('dd').format(initDate),
      DateFormat('MM').format(initDate),
      DateFormat('yyyy').format(initDate),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            titles[type],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Text(
          date[type],
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
