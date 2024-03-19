part of 'widgets_imports.dart';

class BuildDesc extends StatelessWidget {
  final String txt, desc;

  const BuildDesc({Key? key, required this.txt, required this.desc, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        children: [
          Text(
            txt,
            style: TextStyleManager.hintFieldStyle,
          ),

          Flexible(
            child: Text(
              desc,
              style: TextStyleManager.labelFieldStyle.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
