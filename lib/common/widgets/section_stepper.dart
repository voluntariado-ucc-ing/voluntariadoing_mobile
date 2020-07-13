import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class SectionStepper extends AnimatedWidget {

  final int stepsCount;
  final double width;
  final Color color;
  
  SectionStepper({
    @required this.stepsCount,
    @required this.width,
    this.color = ColorPalette.primaryBlue,
    ValueNotifier<double> progress
  }) : assert(stepsCount > 1),
      super(listenable: progress);

  final _unfilledColor = ColorPalette.lightGrey;

  final double _circleDiameter = 20;
  final double _progressBarHeight = 5;
  double get _progressBarMargin => (_circleDiameter - _progressBarHeight) / 2;

  ValueNotifier<double> get progress => listenable;

  double get currentStep => progress.value * stepsCount;

  /// Whether a step indicator should be filled with [color] or not
  bool _shouldBeFilled(int step) => step <= currentStep;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: _progressBarMargin),
          child: _buildUnfilledProgressBar(context),
        ),
        Padding(
          padding: EdgeInsets.only(top: _progressBarMargin),
          child: _buildFilledProgressBar(context),
        ),
        _buildStepCircles(),
      ]
    ),
  );

  Widget _buildUnfilledProgressBar(BuildContext ctx) => Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: _unfilledColor,
          borderRadius: WidgetUtils.borderRadius10
        ),
        height: _progressBarHeight,
        width: width
      )
    ],
  );

  Widget _buildFilledProgressBar(BuildContext ctx) => Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: WidgetUtils.borderRadius10
        ),
        height: _progressBarHeight,
        width: width * (currentStep / (stepsCount - 1))
      )
    ],
  );

  Widget _buildStepCircles() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: Iterable<int>.generate(stepsCount)
      .map<Widget>(_buildStepCircle).toList()
  );

  Widget _buildStepCircle(int step) => AnimatedContainer(
    duration: Duration(milliseconds: 200),
    curve: Curves.ease,
    decoration: BoxDecoration(
      color: _shouldBeFilled(step) ? color : _unfilledColor,
      shape: BoxShape.circle
    ),
    width: _circleDiameter,
    height: _circleDiameter
  );
}