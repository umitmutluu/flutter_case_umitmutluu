part of 'home_page.dart';

extension MovieDetailInialWidget on HomeState {
  Widget buildSuccessPage() {
    return Column(
      children: [
        SizedBox(
          height: 100.sp,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeDatas!.bannerEntity.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) => Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      homeDatas!.bannerEntity[index].imageUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: context.primaryColor)),
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 12.sp),
            shrinkWrap: true,
            itemCount: homeDatas!.combinedEntity.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.titleValue(index)),
                  ],
                );
              }
              if ((index + 1) % 3 == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.titleValue(index)),
                    selectableElement(index, context),
                  ],
                );
              }
              return selectableElement(index, context);
            },
          ),
        )
      ],
    );
  }

  Padding selectableElement(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.sp),
            child: CircleAvatar(
              radius: 30.sp,
              backgroundImage: CachedNetworkImageProvider(
                  homeDatas!.combinedEntity[index].imageUrl),
            ),
          ),
          Expanded(
            child: Text(
              homeDatas!.combinedEntity[index].explanation * 2,
              maxLines: 2,
            ),
          ),
          SelectedCheckButton((){
            if (isAddedValues[index].values.first==true) {
              return context.read<HomeCubit>().removeItem(index);
            } else {
              return context.read<HomeCubit>().addItem(index);
            }
          }, isAddedValues[index].values.first, context)
        ],
      ),
    );
  }


}
