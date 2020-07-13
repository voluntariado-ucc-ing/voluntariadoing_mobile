import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_stepper.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class SteppedView extends StatefulWidget {

  final List<Widget> pages;

  /// A widget to be shown between the stepper and the pages
  final Widget title;

  SteppedView({
    @required this.pages,
    this.title
  });

  @override
  _SteppedViewState createState() => _SteppedViewState();
}

class _SteppedViewState extends State<SteppedView> {
  
  PageController _controller;
  ValueNotifier<double> _notifier = ValueNotifier<double>(0);

  int get stepsCount => widget.pages.length;
  
  int get currentStep {
    if (!_controller.hasClients) return null;
    return _controller?.page?.toInt();
  }

  @override
  void initState() {
    _controller = PageController()
      ..addListener(_onPageScroll);
    super.initState();
  }

  void _onPageScroll() {
    _notifier.value = _controller.page / stepsCount;
    if (_controller.page == _controller.page.roundToDouble()) {
      setState((){});
    }
  }

  void _back() => _controller.previousPage(
    duration: Duration(milliseconds: 300), curve: Curves.ease);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    floatingActionButton: (currentStep != null && currentStep > 0) 
      ? FloatingActionButton(
        backgroundColor: ColorPalette.secondaryBlue,
        child: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: _back,
      )
      : null,
    body: Container(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 10),
                  child: SectionStepper(
                    stepsCount: stepsCount,
                    progress: _notifier,
                    width: MediaQuery.of(context).size.width * .66,
                  ),
                ),
              ],
            ),
            if (widget.title != null)
             widget.title,
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                children: widget.pages,
                controller: _controller,
              ),
            )
          ],
        ),
      )
    ),
  );
}