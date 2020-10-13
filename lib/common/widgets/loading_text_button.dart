import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/primary_button.dart';

class LoadingTextButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onTap;

  LoadingTextButton(
      {@required this.isLoading,
      @required this.onTap,
      @required this.text});

  @override
  Widget build(BuildContext context) => PrimaryButton(
      onTap: onTap,
      child: isLoading
          ? SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            )
          : Text(text,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700)));
}
