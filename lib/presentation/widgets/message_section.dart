import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/extensions/theme_extension.dart';
import '../../data/utils/asset_paths.dart';

class MessageSection extends StatefulWidget {

  final VoidCallback onTap;

  const MessageSection({super.key, required this.onTap});

  @override
  State<MessageSection> createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {

  late final ValueNotifier<bool> _isHovered;

  @override
  void initState() {
    super.initState();
    _isHovered = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: .min,
      children: [
        buildMailLottie(),
        buildUnreadText()
      ],
    );
  }

  Widget buildUnreadText() {
    return buildInkWell(
      isText: true,
      child: ValueListenableBuilder(
        valueListenable: _isHovered,
        builder: (context, value, child) {
          return Text(
                  AppStrings.unreadMessage,
                  style: context.theme.textTheme.bodyLarge
                  !.copyWith(
                      color: value ? AppColors.hoveredTextColor : AppColors.messageTextColor
                  )
              );
        }
      ),
    );
  }

  Widget buildMailLottie() {
    return buildInkWell(
      isText: false,
      child: RepaintBoundary(
            child: LottieBuilder.asset(
              AssetPaths.message,
              width: 300,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
    );
  }

  Widget buildInkWell({required bool isText, required Widget child}){

    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,

      onTap: widget.onTap,
      onHover: isText ? (bool value) => _isHovered.value = value : null,
      child: child,
    );

  }

}