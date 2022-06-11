import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/model/base/review_model.dart';

extension EReview on ReviewModel {
  static Widget fakeView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 28.0,
                height: 28.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    LineIcons.user,
                    size: 18.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                'Black Gold',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              for (var i = 0; i < 5; i++) ...{
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18.0,
                ),
              },
              const SizedBox(
                width: 8.0,
              ),
              Text(
                'February 23, 2022',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            'Unable to report app issues on the contact form. Clicking on the fields won\'t bring up the keyboard to type in. I was trying to get in contact with them about a bug. When viewing transactions, upon clicking "see more", a screen shows I have not made any transactions.',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w200,
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
