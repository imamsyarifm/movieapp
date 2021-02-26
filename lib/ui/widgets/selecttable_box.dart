part of 'widgets.dart';

class SelecttableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnable;
  final double widht;
  final double height;
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  SelecttableBox(this.text,
      {this.isSelected = false,
      this.isEnable = true,
      this.widht = 144,
      this.height = 60,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          height: height,
          width: widht,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (!isEnable)
                  ? Color(0xFFE4E4E4)
                  : isSelected
                      ? accentColor2
                      : Colors.transparent,
              border: Border.all(
                  color: (!isEnable)
                      ? Color(0xFFE4E4E4)
                      : isSelected
                          ? Colors.transparent
                          : Color(0xFFE4E4E4))),
          child: Center(
            child: Text(
              text ?? "None",
              style: (textStyle ?? blackTextFont)
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}
