import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/widget/base/base.dart';

class MemberShipWidget extends StatelessWidget {
  final bool isSelected;
  final bool isPremium;
  final String title;
  final String price;
  final String? expired;
  final List<String> conditions;
  final Function()? upgrade;

  const MemberShipWidget({
    Key? key,
    required this.title,
    required this.price,
    this.expired,
    this.isPremium = false,
    this.upgrade,
    required this.conditions,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: !isSelected
              ? Colors.grey
              : Theme.of(context).colorScheme.secondary,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              title.wText(
                TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              if (expired != null) ...{
                isSelected
                    ? expired!.wText(
                        TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    : SizedBox(
                        width: 120.0,
                        height: 36.0,
                        child: CustomFillButton(
                          title: 'Upgrade Now',
                          onTap: upgrade,
                        ),
                      ),
              },
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          price.wText(
            TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          for (var condition in conditions) ...{
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                condition.wText(TextStyle(fontSize: 16.0)),
              ],
            ),
          }
        ],
      ),
    );
  }
}

Widget accountItemWidget(
  BuildContext context, {
  required String title,
  required Widget leading,
  Function()? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 8.0,
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          leading,
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          if (onTap != null)
            Icon(
              Icons.edit,
              size: 18.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
        ],
      ),
    ),
  );
}
