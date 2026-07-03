import 'package:flutter/material.dart';
import 'package:flutter8_workspace/core/extensions/theme_extension.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../data/utils/asset_paths.dart';

class AboutSection extends StatefulWidget {

  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> with SingleTickerProviderStateMixin {

  late final AnimationController _chevronController;
  late final Animation<double> _chevronRotation;
  late final ValueNotifier<bool> _isTapped;
  late final ValueNotifier<bool> _imageTapped;

  @override
  void initState() {
    super.initState();
    _isTapped = ValueNotifier<bool>(false);
    _imageTapped = ValueNotifier<bool>(false);
    _chevronController =AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _chevronRotation = Tween<double>(begin: 0, end: 0.5).animate(
        CurvedAnimation(parent: _chevronController, curve: Curves.easeInOut)
    );
  }

  @override
  void dispose(){
    _isTapped.dispose();
    _imageTapped.dispose();
    _chevronController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: .min,
      children: [
        buildTeacherAnimation(),
        buildAboutContainer(context),
        const SizedBox(height: 150),
        buildImage(),
        const SizedBox(height: 100),
      ],
    );

  }

  Widget buildImage() {
    return ValueListenableBuilder(
      valueListenable: _imageTapped,
      builder: (context, value, child) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 2200),
          reverseDuration: const Duration(milliseconds: 2200),
          curve: Curves.easeInOut,
          child: value ? buildMadamImage() : buildImageButton('Tap to See'),
        );
      }
    );
  }

  Widget buildMadamImage() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: .circular(10),
          child: Image.asset(
            AssetPaths.madamImage,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppStrings.imageTitle,
          style: context.theme.textTheme.bodyLarge
          !.copyWith(color: AppColors.messageTextColor),
        ),
        const SizedBox(height: 40),
        buildImageButton('Tap to Close')
      ],
    );
  }

  Widget buildImageButton(String text) {
    return OutlinedButton(
      onPressed: () {
        _imageTapped.value = !_imageTapped.value;
        },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: .circular(10),
        )
      ),
      child: Text(text),
    );
  }

  Widget buildAboutContainer(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isTapped,
      builder: (context, value, child) {
        return Stack(
          alignment: .center,
          children: [
            buildBaseContainer(context, value),
            if(!value)
              buildGradient(),
            buildButton(value)
          ],
        );
      }

    );
  }

  Positioned buildButton(bool value) {
    return Positioned(
      bottom: 10,
      child: OutlinedButton.icon(
          onPressed: () {
            _isTapped.value = !_isTapped.value;
            if(_isTapped.value) {
              _chevronController.forward();
            } else {
              _chevronController.reverse();
            }
            },
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              side: BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: .circular(10),
              )
          ),
          icon: RotationTransition(
              turns: _chevronRotation,
              child: Icon(Icons.keyboard_arrow_down_outlined)
          ),
          label: Text( value ? 'See Less' : 'See More')
      ),
    );
  }

  Positioned buildGradient() {
    return Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: .circular(10),
              gradient: LinearGradient(
                  begin: .center,
                  end: .bottomCenter,
                  colors: [
                    AppColors.containerColor.withAlpha(25),
                    AppColors.containerColor.withAlpha(50),
                    AppColors.containerColor.withAlpha(125),
                    AppColors.containerColor.withAlpha(200),
                    AppColors.containerColor,
                  ]
              )
          ),
        )
    );
  }

  Container buildBaseContainer(BuildContext context, bool value) {
    return Container(
      padding: .symmetric(horizontal: 30, vertical: 20),
      width: 600,
      decoration: BoxDecoration(
          borderRadius: .circular(10),
          color: AppColors.containerColor
      ),
      child: Column(
        children: [
          buildTitle(context),
          const SizedBox(height: 5),
          buildAnimatedText(value, context),
          SizedBox(height: value ? 40 :  10)
        ],
      ),
    );
  }

  AnimatedSize buildAnimatedText(bool value, BuildContext context) {
    return AnimatedSize(
          alignment: .topCenter,
          duration: const Duration(milliseconds: 3200),
          reverseDuration: const Duration(milliseconds: 3000),
          curve: Curves.easeInOut,
          child: Text(
            value ? AppStrings.aboutText : AppStrings.aboutShortText,
            style: context.theme.textTheme.bodyMedium
            !.copyWith(color: AppColors.aboutTextColor),
            textAlign: .justify,
          ),
        );
  }

  Align buildTitle(BuildContext context) {
    return Align(
          alignment: .centerLeft,
          child: Text(
            AppStrings.aboutTitle,
            style: context.theme.textTheme.bodyLarge
            !.copyWith(color: AppColors.aboutTextColor),
          ),
        );
  }

  RepaintBoundary buildTeacherAnimation() {
    return RepaintBoundary(
        child: Lottie.asset(
          AssetPaths.teacher,
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        ),
      );
  }
}