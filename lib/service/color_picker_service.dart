import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/widget/base/base.dart';

class ColorPickerService {
  final BuildContext context;
  final Color pickerColor;

  ColorPickerService(
    this.context, {
    required this.pickerColor,
  });

  factory ColorPickerService.of(
    BuildContext context, {
    Color? picker,
  }) {
    var _color = picker ?? Theme.of(context).colorScheme.secondary;
    return ColorPickerService(
      context,
      pickerColor: _color,
    );
  }

  Future<Color?> picker() async {
    var _color = pickerColor;
    return showDialog<Color?>(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    S.current.choose_color.wText(TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    )),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ColorPicker(
                      pickerColor: _color,
                      onColorChanged: (color) => _color = color,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomOutlineButton(
                            title: S.current.cancel,
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomFillButton(
                            title: S.current.done,
                            onTap: () => Navigator.of(context).pop(_color),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
