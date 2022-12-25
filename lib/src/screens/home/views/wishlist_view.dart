part of '../../screens.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorName.mintLeaf,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "My Wishlist".text.bold.color(colorName.black).make(),
            10.widthBox,
            Icon(Icons.favorite_border_rounded, color: Colors.red),
          ],
        ).expand(),
        iconTheme: const IconThemeData(color: colorName.black),
        actions: [],
      ),
      body: SafeArea(
        child: BlocBuilder<ListWishlistBloc, ListWishlistState>(
          builder: (context, state) {
            if (state is ListWishlistIsSuccess && state.data.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    VxDivider(color: colorName.grey.withOpacity(.2)).px16(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final data = state.data[index];
                  return VxBox(
                    child: Card(
                      child: Column(
                        children: [
                          HStack(
                            [
                              // _buildHeader(),
                              VxBox()
                                  .bgImage(DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        data.pictures![0],
                                      )))
                                  .roundedSM
                                  .size(context.percentWidth * 25,
                                      context.percentWidth * 25)
                                  .make(),
                              16.widthBox,
                              VStack(
                                [
                                  data.name!.text.size(15).bold.make(),
                                  24.heightBox,
                                  Commons()
                                      .setPriceToIDR(data.price!)
                                      .text
                                      .size(12)
                                      .bold
                                      .make(),
                                  4.heightBox,
                                  data.desc!.text.size(12).make(),
                                ],
                                alignment: MainAxisAlignment.start,
                              ).expand(),
                              VStack(
                                [
                                  BlocListener<WishlistCubit, WishlistState>(
                                    listener: (context, state) {
                                      if (state is WishlistIsSuccess) {
                                        BlocProvider.of<ListWishlistBloc>(
                                                context)
                                            .add(FetchListWishlist());
                                      }
                                    },
                                    child: IconButton(
                                        onPressed: () {
                                          BlocProvider.of<WishlistCubit>(
                                                  context)
                                              .removeFromWishList(data.id!);
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: colorName.accentRed,
                                        )),
                                  ),
                                  16.heightBox,
                                ],
                              ),
                              // TODO: Add up your widgets
                            ],
                            alignment: MainAxisAlignment.start,
                          ).p16(),
                        ],
                      ),
                    ).p2(),
                  )
                      .withShadow([
                        BoxShadow(
                            blurRadius: 10,
                            color: colorName.grey.withOpacity(.1))
                      ])
                      .make()
                      .onTap(() {
                        context.go(routeName.detailPath, extra: data.id);
                      });
                },
              );
            }
            return VStack(
              [
                "Belum ada data wishlist"
                    .text
                    .bodyText1(context)
                    .makeCentered(),
                8.heightBox,
                ButtonWidget(
                    color: colorName.accentBlue,
                    text: 'Cari Produk',
                    onPressed: () {
                      BlocProvider.of<BottomNavBarCubit>(context)
                          .changeIndex(0);
                    })
              ],
              crossAlignment: CrossAxisAlignment.center,
            ).centered();
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.green.shade800,
                      blurRadius: 2,
                      offset: Offset(0, 3))
                ],
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
              ),
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                ),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (userState is UserIsSuccess) {
                      return Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage("${userState.data.photoProfile}"),
                            radius: 30,
                          ),
                          18.widthBox,
                          "${userState.data.username}".text.bold.white.make()
                        ],
                      );
                    }
                    return 0.heightBox;
                  },
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 118),
            //   child: Container(
            //     height: 200,
            //     color: Colors.white,
            //   ),
            // )
          ],
        )
      ],
    );
  }
}
