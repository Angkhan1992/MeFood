import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';

class StepperWidget extends StatelessWidget {
  final int number;
  final int step;
  final String title;

  const StepperWidget({
    Key? key,
    required this.number,
    required this.step,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color:
                step > number ? Theme.of(context).colorScheme.secondary : null,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2.0,
            ),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${number + 1}',
            style: TextStyle(
              fontSize: 15.0,
              color: step > number
                  ? Theme.of(context).scaffoldBackgroundColor
                  : null,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class WebCachImage extends StatelessWidget {
  final Function()? picker;
  final String url;
  final String shortDesc;
  final double radius;
  final double aspectRatio;
  final double previewIconSize;

  const WebCachImage({
    Key? key,
    required this.url,
    required this.shortDesc,
    this.picker,
    this.radius = 16.0,
    this.aspectRatio = 1.0,
    this.previewIconSize = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).hintColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: InkWell(
          onTap: picker,
          child: url.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LineIcons.imageAlt,
                        size: previewIconSize,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        shortDesc,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(radius - 2),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        width: previewIconSize,
                        height: previewIconSize,
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          strokeWidth: 2.0,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Image.asset(
                        'assets/images/web/logo.png',
                        width: previewIconSize * 1.25,
                        height: previewIconSize * 1.25,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}

class MemberWidget extends StatefulWidget {
  final String header;
  final Function(String pass, String repass)? onChangePass;
  final MemberModel? model;

  const MemberWidget({
    Key? key,
    required this.header,
    this.onChangePass,
    this.model,
  }) : super(key: key);

  @override
  State<MemberWidget> createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  bool isPassVisible = true, isRepassVisible = true;
  var pass = '', repass = '';

  @override
  Widget build(BuildContext context) {
    logger.d(widget.model);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${widget.header} ${S.current.avatar}'.subtitle,
              const SizedBox(height: 24.0),
              WebCachImage(
                url: widget.model!.linkAvatar ?? '',
                shortDesc: '300 * 300 ${S.current.image}',
                picker: () async {
                  var result = await FilePicker.platform.pickFiles(
                    withReadStream: true,
                  );
                  if (result != null) {
                    var file = result.files.single;
                    var resp = await APIService.of(context).upload(
                      path: 'avatar',
                      webFile: file,
                    );
                    if (resp['ret'] == 10000) {
                      var imageUrl = '$kUrlAvatar${resp['result']}';
                      setState(() {
                        widget.model!.linkAvatar = imageUrl;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 40.0,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${widget.header} ${S.current.information}'.subtitle,
              const SizedBox(height: 24.0),
              CustomTextField(
                prefix: Icon(LineIcons.user),
                controller: TextEditingController(
                  text: widget.model!.firstName,
                ),
                hintText: S.current.first_name,
                onChanged: (value) => widget.model!.firstName = value,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                prefix: Icon(LineIcons.user),
                controller: TextEditingController(
                  text: widget.model!.lastName,
                ),
                hintText: S.current.last_name,
                onChanged: (value) => widget.model!.lastName = value,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                prefix: Icon(Icons.email_outlined),
                controller: TextEditingController(
                  text: widget.model!.email,
                ),
                hintText: S.current.email_address,
                onChanged: (value) => widget.model!.email = value,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                prefix: Icon(Icons.phone_android),
                controller: TextEditingController(
                  text: widget.model!.phone,
                ),
                hintText: S.current.phone_number,
                onChanged: (value) => widget.model!.phone = value,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                prefix: Icon(Icons.lock),
                hintText: S.current.password,
                suffix: InkWell(
                  onTap: () => setState(() {
                    isPassVisible = !isPassVisible;
                  }),
                  child: Icon(
                    isPassVisible
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
                obscureText: isPassVisible,
                onChanged: (value) {
                  pass = value;
                  widget.onChangePass!(pass, repass);
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                prefix: Icon(Icons.lock),
                hintText: S.current.confirm_password,
                suffix: InkWell(
                  onTap: () => setState(() {
                    isRepassVisible = !isRepassVisible;
                  }),
                  child: Icon(
                    isRepassVisible
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
                obscureText: isRepassVisible,
                onChanged: (value) {
                  repass = value;
                  widget.onChangePass!(pass, repass);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
