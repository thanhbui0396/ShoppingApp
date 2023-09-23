import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/data_provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    context.read<DataProvider>().checkIntro();
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    var pageDecoration = PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Theme.of(context).primaryColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Theme.of(context).primaryColor,
      allowImplicitScrolling: false,
      autoScrollDuration: 3000,
      infiniteAutoScroll: false,
      bodyPadding: const EdgeInsets.only(top: 160),
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body: "Welcome to Tanam! Grocery Applications",
          image: _buildImage('assets/images/img_intro1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Welcome to Tanam! Grocery Applications",
          image: _buildImage('assets/images/img_intro1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Welcome to Tanam! Grocery Applications",
          image: _buildImage('assets/images/img_intro1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
          image: _buildImage('assets/images/img_intro1.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(),
      // You can override onSkip callback
      showSkipButton: false,
      showNextButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: true,

      //rtl: true, // Display as right-to-left

      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      controlsPosition: const Position(bottom: 150, left: 0, right: 0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
