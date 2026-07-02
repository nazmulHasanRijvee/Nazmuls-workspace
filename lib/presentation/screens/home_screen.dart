import 'package:flutter/material.dart';
import 'package:flutter8_workspace/presentation/widgets/message_section.dart';


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
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: .center,

            children: [

              buildMessageSection()

            ],

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
}
