import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.text,
    required this.tooltip,
    required this.isSelected,
    required this.onPressed,
    this.child,
  }) : super(key: key);

  final String text, tooltip;
  final bool isSelected;
  final Function() onPressed;
  final Widget? child;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: isSelected ? Color(0xffff5721) : Colors.white,
          child: SvgPicture.asset(
            'assets/icon/ic_${text.toLowerCase()}.svg',
            color: isSelected ? Colors.white : const Color(0xff818384),
            width: 24.0,
            height: 24.0,
          ),
        ),
      ),
    );
  }
}
