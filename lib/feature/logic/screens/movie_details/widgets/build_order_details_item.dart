

part of'widgets_imports.dart';
class BuildMovieItem extends StatelessWidget {
  final String txt;
    final MovieDetailsModel orderDetailsModel;
  const BuildMovieItem({
    Key? key, required this.txt,     required this.orderDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.greyDiv.withOpacity(.25),
            blurRadius: 3,
            offset: const Offset(1, 3),
          )
        ], // Shadow position
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 11.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   orderDetailsModel.title??'' ,
                    style: TextStyleManager.labelFieldStyle,
                  ),
                  const SizedBox(height: 5,),

                  Text(
                    orderDetailsModel.releaseDate??'',
                    style: TextStyleManager.labelFieldStyle.copyWith(
                        color: ColorManager.greyNav,
                        fontSize: 10,
                        fontWeight: FontWeightManager.bold),
                  ),
                  const SizedBox(height: 5,),
                  Text(

                    orderDetailsModel.originalLanguage??'',
                    style: TextStyleManager.labelFieldStyle
                        .copyWith(color: ColorManager.greyNav, fontSize: 9),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.greyDiv.withOpacity(.25),
                            blurRadius: 3,
                            offset: const Offset(1, 3),
                          )
                        ], // Shadow position
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(  orderDetailsModel.voteCount.toString() ,
                            style: TextStyleManager.primaryStyle),
                      )),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    txt,
                    style: TextStyleManager.labelFieldStyle
                        .copyWith(fontSize: 10, color: ColorManager.error),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
