// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Widget? icon;
  final bool? isPassword;
  final bool? isEnabled;
  final int? maxLines;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      this.isPassword = false,
      this.isEnabled = true,
      this.maxLines = 1,
      this.icon});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      enabled: widget.isEnabled!,
      maxLines: widget.maxLines,
      textAlignVertical: TextAlignVertical.center,
      obscureText: (widget.isPassword!) ? isObscure : false,
      decoration: InputDecoration(
          label: "${widget.title}".text.make(),
          enabledBorder: OutlineInputBorder(),
          prefixIcon: widget.icon,
          border: InputBorder.none,
          // hintText: widget.title,
          suffixIcon: (widget.isPassword!)
              ? IconButton(
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  })
              : 0.heightBox),
    ).pSymmetric(h: 12).box.white.withRounded(value: 10).make();
  }
}
