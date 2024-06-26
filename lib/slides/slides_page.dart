import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '10_flutter_for_web/flutter_for_web_slide.dart';
import '11_flutter_for_desktop/flutter_for_desktop_slide.dart';
import '12_flutter_for_toaster/flutter_for_toaster_slide.dart';
import '13_flutter_comparison/flutter_comparison_slide.dart';
import '14_dart/dart_slide.dart';
import '15_tooling/tooling_slide.dart';
import '16_integrations/integrations_slide.dart';
import '17_community/community_slide.dart';
import '18_drawbacks/drawbacks_slide.dart';
import '19_transition_to_flutter/transition_to_flutter_slide.dart';
import '1_title/title_slide.dart';
import '20_future_of_flutter/future_of_flutter_slide.dart';
import '21_self_promotion/self_promotion_slide.dart';
import '22_thank_you/thank_you_slide.dart';
import '2_agenda/agenda_slide.dart';
import '3_about_me/about_me_slide.dart';
import '4_flutter_intro/flutter_intro_slide.dart';
import '5_flutter_concepts/flutter_concepts_slide.dart';
import '6_flutter_around_you/flutter_around_you_slide.dart';
import '7_custom_ui/custom_ui_slide.dart';
import '8_animations_rive/animations_rive_slide.dart';
import '9_flutter_for_mobile/flutter_for_mobile_slide.dart';

class SlidesPage extends StatefulWidget {
  const SlidesPage();

  @override
  _SlidesPageState createState() => _SlidesPageState();
}

class _SlidesPageState extends State<SlidesPage> {
  static const _slideSwitchDuration = Duration(milliseconds: 500);
  static const _slideSwitchCurve = Curves.easeInOut;
  static const _slidesCount = 22;

  final _pageController = PageController();
  final _focusNode = FocusNode();

  late final Map<LogicalKeySet, Intent> _shortcuts;
  late final Map<Type, Action<Intent>> _actions;

  @override
  void initState() {
    super.initState();

    _shortcuts = <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.arrowLeft):
          const _HandleSlideIntent.arrowLeft(),
      LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.arrowRight):
          const _HandleSlideIntent.arrowRight(),
    };
    _actions = <Type, Action<Intent>>{
      _HandleSlideIntent: CallbackAction<_HandleSlideIntent>(
        onInvoke: _handleShortcut,
      ),
    };
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < _slidesCount - 1) {
      _pageController.nextPage(
        duration: _slideSwitchDuration,
        curve: _slideSwitchCurve,
      );
    }
  }

  void _previousPage() {
    if (_pageController.page != 0) {
      _pageController.previousPage(
        duration: _slideSwitchDuration,
        curve: _slideSwitchCurve,
      );
    }
  }

  void _handleShortcut(_HandleSlideIntent intent) {
    switch (intent.button) {
      case _KeyboardButton.arrowLeft:
        setState(() {
          if (_pageController.page != 0) {
            _pageController.previousPage(
              duration: _slideSwitchDuration,
              curve: _slideSwitchCurve,
            );
          }
        });

        break;
      case _KeyboardButton.arrowRight:
        setState(() {
          if (_pageController.page! < _slidesCount - 1) {
            _pageController.nextPage(
              duration: _slideSwitchDuration,
              curve: _slideSwitchCurve,
            );
          }
        });

        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FocusableActionDetector(
            shortcuts: _shortcuts,
            actions: _actions,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              child: Focus(
                focusNode: _focusNode,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const TitleSlide();
                      case 1:
                        return const AgendaSlide();
                      case 2:
                        return const AboutMeSlide();
                      case 3:
                        return const FlutterIntroSlide();
                      case 4:
                        return const FlutterConceptsSlide();
                      case 5:
                        return const FlutterAroundYouSlide();
                      case 6:
                        return const CustomUiSlide();
                      case 7:
                        return const AnimationsRiveSlide();
                      case 8:
                        return const FlutterForMobileSlide();
                      case 9:
                        return const FlutterForWebSlide();
                      case 10:
                        return const FlutterForDesktopSlide();
                      case 11:
                        return const FlutterForToasterSlide();
                      case 12:
                        return const FlutterComparisonSlide();
                      case 13:
                        return const DartSlide();
                      case 14:
                        return const ToolingSlide();
                      case 15:
                        return const IntegrationsSlide();
                      case 16:
                        return const CommunitySlide();
                      case 17:
                        return const DrawbacksSlide();
                      case 18:
                        return const TransitionToFlutterSlide();
                      case 19:
                        return const FutureOfFlutterSlide();
                      case 20:
                        return const SelfPromotionSlide();
                      case 21:
                        return const ThankYouSlide();
                    }

                    return const SizedBox();
                  },
                  itemCount: _slidesCount,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: _nextPage,
              child: const Icon(
                Icons.arrow_right,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 200.0,
            left: 20.0,
            child: FloatingActionButton(
              onPressed: _previousPage,
              child: const Icon(
                Icons.arrow_left,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HandleSlideIntent extends Intent {
  final _KeyboardButton button;

  const _HandleSlideIntent({
    required this.button,
  });

  const _HandleSlideIntent.arrowLeft() : button = _KeyboardButton.arrowLeft;
  const _HandleSlideIntent.arrowRight() : button = _KeyboardButton.arrowRight;
}

enum _KeyboardButton {
  arrowLeft,
  arrowRight,
}
