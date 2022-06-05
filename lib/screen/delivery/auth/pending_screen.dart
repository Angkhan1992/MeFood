import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/screen/delivery/auth/update_screen.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/constants.dart';
import 'package:mefood/widget/base/base.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                'Pending'.wTitle,
                const Spacer(),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: InkWell(
                    onTap: () => NavigatorService.of(context).push(
                      screen: UpdateScreen(
                        index: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: offsetBase,
            ),
            S.current.pending_48_desc.wText(
              TextStyle(
                fontSize: 16.0,
              ),
              lines: 2,
            ),
            const SizedBox(
              height: offsetXLg,
            ),
            for (var item in pendingList) ...{
              ListTile(
                leading: Icon(
                  (item['leading'] as IconData),
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
                trailing: Icon(
                  LineIcons.check,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: (item['title'] as String).wText(
                  TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () => NavigatorService.of(context).push(
                  screen: UpdateScreen(
                    index: pendingList.indexOf(item),
                  ),
                ),
              ),
            },
            const SizedBox(
              height: offsetXLg,
            ),
            CustomOutlineButton(
              borderColor: Colors.red,
              title: S.current.remove_account,
              onTap: () {
                // [Future] add new
              },
            ),
          ],
        ),
      ),
    );
  }
}
