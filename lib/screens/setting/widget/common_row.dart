import 'package:all_games2/utils/config/config.dart';

class CommonRow extends StatelessWidget {
  const CommonRow({
    Key? key,
    this.orientation,
    this.title,
    this.onTap,
    this.icon,
    this.isVersion,
  }) : super(key: key);
  final String? title;
  final bool? isVersion;

  final IconData? icon;
  final void Function()? onTap;
  final Orientation? orientation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            splashColor: colorAppTheme.withOpacity(0.5),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 4.w),
              child: Row(children: [
                Icon(icon, color: colorAppTheme),
                SizedBox(width: 20.w),
                Text(title ?? '',
                    style: TextStyle(
                        fontSize:
                            orientation == Orientation.portrait ? 15.sp : 10.sp,
                        color: colorAppTheme,
                        letterSpacing: 0.2)),
                const Spacer(),
                isVersion ?? false
                    ? Text(adResponseModel.adsData?.gameVersion ?? '',
                        style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? 15.sp
                                : 10.sp,
                            color: colorAppTheme))
                    : Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: colorAppTheme,
                      )
              ]),
            )),
        const Divider(color: colorAppTheme, height: 2),
      ],
    );
  }
}
