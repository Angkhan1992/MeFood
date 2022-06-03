import 'package:flutter/material.dart';
import 'package:mefood/model/member_model.dart';

class OwnerPage extends StatefulWidget {
  final Function()? onPrevious;
  final Function(MemberModel owner)? onNext;

  OwnerPage({
    Key? key,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  var owner = MemberModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Row(
            children: [
              const SizedBox(width: 24.0),
              Text(
                'Owner Information',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 16.0),
            ],
          ),
          const SizedBox(height: 24.0),
          Container(
            height: 1000,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ],
      ),
    );
  }
}
