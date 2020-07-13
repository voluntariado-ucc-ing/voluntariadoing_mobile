import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
  
  final _initialPage = 0;
  PageController _controller;
  ValueNotifier<double> _notifier = ValueNotifier<double>(0);

  int get stepsCount => widget.pages.length;
  
  int get currentStep {
    if (!_controller.hasClients) return _initialPage;
    return _controller?.page?.toInt();
  }

  @override
  void initState() {
    _controller = PageController(initialPage: _initialPage)
      ..addListener(_onPageScroll);
    super.initState();
  }

  void _onPageScroll() {
    _notifier.value = _controller.page / stepsCount;
    if (_controller.page == _controller.page.roundToDouble()) {
      setState((){});
    }
  }

  void _back() {
    if (!_controller.hasClients) return;
    _controller?.previousPage(
      duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
  
  void _forward() {
    if (!_controller.hasClients) return;
    _controller?.nextPage(
      duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: _buildFab(),
    body: Container(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 10),
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

  Widget _buildFab() {
    final shouldShowBack = currentStep != null && currentStep > 0;
    final shouldShowForward = currentStep != null && currentStep != stepsCount - 1;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: shouldShowBack 
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
        children: [
          if (shouldShowBack)
            FloatingActionButton(
              mini: true,
              backgroundColor: ColorPalette.secondaryBlue,
              child: Icon(
                Icons.arrow_back, 
                color: Colors.white,
                size: 20,
              ),
              onPressed: _back,
            ),
          if (shouldShowForward)
            FloatingActionButton.extended(
              backgroundColor: ColorPalette.primaryBlue,
              onPressed: _forward,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'COMMON.CONTINUE'.tr(),
                    style: Theme.of(context).textTheme.button
                      .copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_forward, 
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              )
            ),
        ],
      )
    );
  }
}