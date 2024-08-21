import 'package:basic/import.dart';

AppBar headerFix(
  BuildContext context, {
  PreferredSizeWidget? bottom,
  Widget? title,
  String? label,
  double? elevation,
  double? toolbarHeight,
  Color? backgroundColor,
  bool automaticallyImplyLeading = true,
  bool? centerTitle,
  List<Widget>? actions,
  Widget? leading,
  bool hideSearchIcon = false,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    elevation: elevation ?? 0.6,
    centerTitle: centerTitle ?? true,
    leading: leading,
    toolbarHeight: toolbarHeight ?? 60,
    title: (label != null)
        ? Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        : (title),
    bottom: bottom,
    actions: actions,
  );
}
