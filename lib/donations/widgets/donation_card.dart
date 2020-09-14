import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voluntariadoing_mobile/common/widgets/slidable_card.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/svg_assets.dart';
import 'package:voluntariadoing_mobile/donations/views/donation_detail_view.dart';

class DonationCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => SlidableCard(
    content: _buildContent(context),
    onPress: () => Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DonationDetailView())),
    rightGradient: LinearGradient(
      colors: [
        ColorPalette.secondaryBlue, 
        ColorPalette.primaryBlue
      ],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft
    ),
    rightAction: (){},
    rightIcon: _buildRightIcon(context),
    leftGradient: LinearGradient(
      colors: [
        ColorPalette.rejected, 
        ColorPalette.red
      ],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft
    ),
    leftAction: (){},
    leftIcon: _buildLeftIcon(context),
  );

  Widget _buildRightIcon(BuildContext ctx) => ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: 80,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.alarm, color: Colors.white, size: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Marcar para retirar',
                textAlign: TextAlign.center,
                style: Theme.of(ctx).textTheme.button
                  .copyWith(
                    fontFamily: 'Nunito_900',
                    color: Colors.white
                  ),
              ),
            )
          ],
        ),
      ],
    ),
  );

  Widget _buildLeftIcon(BuildContext ctx) => ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: 80,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.close, color: Colors.white, size: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Rechazar',
                textAlign: TextAlign.center,
                style: Theme.of(ctx).textTheme.button
                  .copyWith(
                    fontFamily: 'Nunito_900',
                    color: Colors.white
                  ),
              ),
            )
          ],
        ),
      ],
    ),
  );

  Widget _buildContent(BuildContext ctx) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SvgAssets.donationToBeConfirmed,
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Por confirmar',
                style: Theme.of(ctx).textTheme.caption
                  .copyWith(
                    fontFamily: 'Nunito_900',
                    color: ColorPalette.toBeConfirmed
                  ),
              ),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Arroz',
                  maxLines: 2,
                  style: Theme.of(ctx).textTheme.headline6
                    .copyWith(
                      fontFamily: 'Nunito_900',
                      color: ColorPalette.darkGrey
                    ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cantidad: ',
                      style: Theme.of(ctx).textTheme.bodyText2
                        .copyWith(
                          color: ColorPalette.grey,
                          fontWeight: FontWeight.w600
                        ),
                    ),
                    Text(
                      '9kg',
                      style: Theme.of(ctx).textTheme.bodyText2
                        .copyWith(
                          fontFamily: 'Nunito_900',
                          color: ColorPalette.darkGrey
                        ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: ColorPalette.primaryBlue),
                      Flexible(
                        child: Text(
                          'Córdoba, ',
                          style: Theme.of(ctx).textTheme.caption
                            .copyWith(
                              fontFamily: 'Nunito_900',
                              color: ColorPalette.darkGrey
                            ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Maestro Vidal 1461',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(ctx).textTheme.caption
                            .copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPalette.darkGrey
                            ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ),
          )
        )
      ],
    ),
  );
}