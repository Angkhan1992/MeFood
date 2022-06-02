import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';

class ImagePickerService {
  BuildContext context;
  ImagePickerService(this.context);

  factory ImagePickerService.of(BuildContext context) {
    return ImagePickerService(context);
  }

  Future<String?> picker() async {
    ImageSource? imageSource;
    if (kIsWeb) {
      imageSource = ImageSource.gallery;
    } else {
      imageSource = await _showPickerBottomSheet();
    }

    if (imageSource == null) {
      return null;
    }
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: imageSource,
    );
    if (pickedFile == null) {
      return null;
    }
    return pickedFile.path;
  }

  Future<ImageSource?> _showPickerBottomSheet() async {
    return await showModalBottomSheet<ImageSource?>(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(offsetBase),
          topLeft: Radius.circular(offsetBase),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      isDismissible: true,
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXSm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NorchWidget(
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              height: 16.0,
            ),
            S.current.choose_method.wText(
              TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              child: S.current.type_gallery.wText(
                TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
              child: S.current.type_camera.wText(
                TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  // Future<ImageSource?> _showPickerDialog() async {
  //   return await showModalBottomSheet<ImageSource?>(
  //     context: context,
  //     isScrollControlled: false,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(offsetBase),
  //         topLeft: Radius.circular(offsetBase),
  //       ),
  //     ),
  //     backgroundColor: Theme.of(context).colorScheme.background,
  //     isDismissible: true,
  //     builder: (_) => Container(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: offsetBase,
  //         vertical: offsetXSm,
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           NorchWidget(
  //             color: Theme.of(context).hintColor,
  //           ),
  //           const SizedBox(
  //             height: 16.0,
  //           ),
  //           S.current.choose_method.wText(
  //             TextStyle(
  //               fontSize: 14.0,
  //               color: Theme.of(context).hintColor,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 24.0,
  //           ),
  //           InkWell(
  //             onTap: () => Navigator.of(context).pop(ImageSource.gallery),
  //             child: S.current.type_gallery.wText(
  //               TextStyle(
  //                 fontSize: 18.0,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 16.0,
  //           ),
  //           InkWell(
  //             onTap: () => Navigator.of(context).pop(ImageSource.camera),
  //             child: S.current.type_camera.wText(
  //               TextStyle(
  //                 fontSize: 18.0,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 16.0,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

enum ImagePickerType {
  bottomsheet,
  dialog,
}
