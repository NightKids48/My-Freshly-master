part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? color;
  final bool? isLoading;
  const ButtonWidget(
      {super.key,
      this.onPressed,
      this.text = 'Button',
      this.isLoading = false,
      this.color = kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: colorName.mintLeaf,
          blurRadius: 3,
          blurStyle: BlurStyle.outer,
        )
      ]),
      child: ElevatedButton(
        onPressed: isLoading! ? null : onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: isLoading!
            ? SizedBox(
                height: 14,
                width: 16,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ).p(14)
            : text.text
                .buttonText(context)
                .color(colorName.white)
                .size(18)
                .make()
                .p(14),
      ),
    );
  }
}
