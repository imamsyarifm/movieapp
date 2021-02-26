part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;

  RatingStar({this.voteAverage = 0, this.starSize = 20, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widget = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: starSize,
            ));
    widget.add(SizedBox(
      width: 3,
    ));

    widget.add(Text(
      "$voteAverage/10",
      style: whiteNumberFont.copyWith(
          fontSize: fontSize, fontWeight: FontWeight.w300),
    ));

    return Row(
      children: widget,
    );
  }
}
