part of 'screens.dart';

class ListMinuman extends StatelessWidget {
  const ListMinuman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: RichText(
          text: const TextSpan(
            text: 'Kopi, Teh & Minuman',
            style: TextStyle(
                color: colorName.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'godleaf'),
          ),
        ).centered(),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go(routeName.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: colorName.white,
          ),
        ),
        actions: [
          BlocBuilder<CartCountCubit, CartCountState>(
            builder: (context, state) {
              return ZStack(
                [
                  IconButton(
                    onPressed: () {
                      context.go(routeName.cart);
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: colorName.white,
                    ),
                  ),
                  (state as CartCountIsSuccess).value != 0
                      ? VxBox(
                              child: state.value.text
                                  .size(8)
                                  .white
                                  .makeCentered()
                                  .p4())
                          .roundedFull
                          .color(colorName.primary)
                          .make()
                          .positioned(bottom: 5, right: 2)
                      : 0.heightBox
                ],
                alignment: Alignment.bottomCenter,
              );
            },
          ),
          10.widthBox,
        ],
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserIsLoading) {
                return const CircularProgressIndicator().centered();
              } else if (state is UserIsSuccess) {
                return VStack(
                  [
                    20.heightBox,
                    _buildListProductBumbu().expand(),
                  ],
                  alignment: MainAxisAlignment.start,
                  axisSize: MainAxisSize.max,
                );
              }
              return 0.heightBox;
            },
          ).p16().centered(),
        ).hFull(context).scrollVertical(),
      ),
    );
  }

  Widget _buildProductWidget(BuildContext context, ProductModel data) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: VStack(
              [
                AspectRatio(
                  aspectRatio: 9 / 6,
                  child: Image.network(
                    data.pictures![0],
                    fit: BoxFit.cover,
                  ),
                ),
                VStack(
                  [
                    data.name!.text
                        .size(15)
                        .bold
                        .color(colorName.primary)
                        .make(),
                    // .centered(),
                    5.heightBox,
                    Commons().setPriceToIDR(data.price!).text.size(12).make(),
                    // .centered(),
                    5.heightBox,
                    data.desc!.text
                        .size(15)
                        .maxLines(3)
                        // .bold
                        .color(Colors.black26)
                        .make(),
                  ],
                ).p4(),
              ],
            ).box.make().color(Colors.white))
        .onTap(
      () {
        context.go(routeName.detailPath, extra: data.id);
      },
    );
  }

  Widget _buildListProductBumbu() {
    return BlocConsumer<ListProductFrozenBloc, ListProductFrozenState>(
      listener: (context, state) {
        if (state is ListProductFrozenIsFailed) {
          Commons().showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ListProductFrozenIsLoading) {
          //Loading Widget
          return const CircularProgressIndicator();
        }
        if (state is ListProductFrozenIsSuccess) {
          //List Product Widget
          final data = state.data;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 6,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _buildProductWidget(context, data[index]);
            },
          );
        }
        return Container();
      },
    );
  }
}
