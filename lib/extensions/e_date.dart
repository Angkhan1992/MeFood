import 'package:intl/intl.dart';

extension EDate on DateTime {
  String get convert2ServerTime =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String get visiableDate => DateFormat('MM/dd/yyyy').format(this);

  String get visiableTime => DateFormat('hh:mm a').format(this);

  String get visiableWeek => DateFormat('EEEE').format(this);

  bool get expired => DateTime.now().isAfter(this);
}
