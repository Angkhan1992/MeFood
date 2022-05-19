import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

bool isShowing = false;

class LoadingProvider {
  final BuildContext? context;

  LoadingProvider(this.context);

  factory LoadingProvider.of(context) {
    return LoadingProvider(context);
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
              color: Colors.white,
              size: 48.0,
            ),
          );
        },
        useRootNavigator: false);
    return true;
  }
}
