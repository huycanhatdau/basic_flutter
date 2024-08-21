import 'package:basic/import.dart';

class ButtonBase extends StatelessWidget {
  const ButtonBase({
    super.key,
    required this.onTap,
    required this.title,
    this.isFull = false,
    this.keyButton,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = const Color(0xffffffff),
    this.borderColor = const Color(0x00ffffff),
    this.borderRadius,
  });

  final Function() onTap;
  final String title;
  final bool isFull;
  final Key? keyButton;
  final Color? backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double? borderRadius;

  factory ButtonBase.outlined({
    required Function() onTap,
    required String title,
    bool isFull = false,
    Key? keyButton,
    double? borderRadius
  }) {
    return ButtonBase(
      onTap: onTap,
      title: title,
      isFull: isFull,
      keyButton: keyButton,
      backgroundColor: Colors.transparent,
      textColor: AppColors.primaryColor,
      borderColor: AppColors.primaryColor,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: keyButton,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: isFull ? double.infinity : 200,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            border: Border.all(width: 1, color: borderColor),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
