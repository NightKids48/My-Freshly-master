part of 'screens.dart';

class ListBumbu extends StatelessWidget {
  const ListBumbu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: colorName.mintLeaf,
        title: RichText(
          text: const TextSpan(
            text: 'B u m b u  D a p u r',
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
    return BlocConsumer<ListProductBumbuBloc, ListProductBumbuState>(
      listener: (context, state) {
        if (state is ListProductBumbuIsFailed) {
          Commons().showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ListProductBumbuIsLoading) {
          //Loading Widget
          return const CircularProgressIndicator();
        }
        if (state is ListProductBumbuIsSuccess) {
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
