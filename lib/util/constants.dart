import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/generated/l10n.dart';

const kFontFamily = 'Nunito';

const defaultLatitude = 17.923548;
const defaultLongitude = 102.649344;

const priceDeliveryPerKm = 5000;

var kEmptyPrice = '${S.current.currency_lao} -----';
var kEmptyDistance = '--- ${S.current.unit_km}';
var kEmptyDuration = '--- ${S.current.unit_min}';

final formatOrderNumber = NumberFormat('000000000');
final formatCurrency = NumberFormat('###,###,###');

final pendingList = [
  {
    'leading': LineIcons.user,
    'title': 'User Profile',
  },
  {
    'leading': LineIcons.addressBook,
    'title': 'User Address',
  },
  {
    'leading': LineIcons.car,
    'title': 'Car Information',
  },
  {
    'leading': LineIcons.lock,
    'title': 'Securit Account',
  },
];

final constactCategory = [
  S.current.cat_contact_01,
  S.current.cat_contact_02,
  S.current.cat_contact_03,
  S.current.cat_contact_04,
  S.current.cat_contact_05,
  S.current.cat_contact_06,
];
