import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

bool isShowing = false;

class LoadingService {
  final BuildContext? context;

  LoadingService(this.context);

  factory LoadingService.of(context) {
    return LoadingService(context);
  }

  bool hide() {
    if (context == null) {
      return true;
    }
    isShowing = false;
    Navigator.of(context!).pop(true);
    return true;
  }

  bool show() {
    if (context == null) {
      return true;
    }
    isShowing = true;
    showDialog<dynamic>(
        context: context!,
        builder: (BuildContext context) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Theme.of(context).colorScheme.secondary,
              size: 48.0,
            ),
          );
        },
        useRootNavigator: false);
    return true;
  }
}
