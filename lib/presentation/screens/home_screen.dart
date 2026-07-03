import 'package:flutter/material.dart';
import 'package:flutter8_workspace/presentation/widgets/about_section.dart';
import 'package:flutter8_workspace/presentation/widgets/message_section.dart';

import '../../data/utils/asset_paths.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final ValueNotifier<bool> _isTapped;

  @override
  void initState() {
    super.initState();
    _isTapped = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _isTapped.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
        AssetImage(AssetPaths.madamImage),
        context
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: SingleChildScrollView(

          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: .center,

                children: [

                  buildMessageSection(),
                  buildAboutSection()

                ],

              ),
            ),
          ),
        ),

      ),
    );

  }

  Widget buildMessageSection() {
    return ValueListenableBuilder(
      valueListenable: _isTapped,
      builder: (context, value, child){
        return Visibility(
            visible: value,
            child: child ?? const SizedBox.shrink()
        );
        },
      child: MessageSection(
          onTap: () => _isTapped.value = false
      ),
    );
  }

  Widget buildAboutSection() {
    return ValueListenableBuilder(
      valueListenable: _isTapped,
      builder: (context, value, child){
        return Visibility(
            visible: !value,
            child: child ?? const SizedBox.shrink()
        );
      },
      child: AboutSection()
    );
  }
}
