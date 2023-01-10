part of '../../screens.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with TickerProviderStateMixin {
  final TextEditingController productSearchController = TextEditingController();
  void reset() {
    productSearchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: colorName.mintLeaf,
        actions: [
          HStack(
            [
              Container(
                height: 40,
                width: 260,
                decoration: BoxDecoration(
                  color: colorName.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: productSearchController,
                  style: const TextStyle(color: colorName.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: BlocBuilder<ListSearchProductBloc,
                          ListSearchProductState>(
                        builder: (context, state) {
                          return const Icon(Icons.search,
                                  color: colorName.mintLeaf)
                              .onTap(
                            () {
                              BlocProvider.of<ListSearchProductBloc>(context)
                                  .add(
                                FetchListProductSearch(
                                    search: productSearchController.text),
                              );
                              context.go(routeName.searchPath);
                            },
                          );
                        },
                      ),
                      hintText: 'Cari produk segar di Freshly'),
                ),
              ).p(6),
              20.widthBox,
              BlocBuilder<ListOrderBloc, ListOrderState>(
                builder: (context, listOrderState) {
                  return ZStack(
                    [
                      IconButton(
                        onPressed: () {
                          context.go(routeName.myOrderPath);
                        },
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: colorName.white,
                        ),
                      ),
                      (listOrderState is ListOrderIsSuccess)
                          ? VxBox(
                                  child: Text(
                              "${listOrderState.model.length}",
                              style: TextStyle(
                                fontSize: 8,
                              ),
                            ))
                              .p4
                              .roundedFull
                              .color(colorName.primary)
                              .make()
                              .positioned(top: 7, right: 5)
                          : 0.heightBox
                    ],
                    alignment: Alignment.topRight,
                  );
                },
              ),
              BlocBuilder<CartCountCubit, CartCountState>(
                builder: (context, state) {
                  return ZStack(
                    [
                      IconButton(
                        onPressed: () {
                          context.go(routeName.cartPath);
                        },
                        icon: const Icon(
                          Icons.shopping_cart_checkout_outlined,
                          color: colorName.white,
                        ),
                      ),
                      (state as CartCountIsSuccess).value != 0
                          ? VxBox(
                                  child: state.value.text
                                      .size(8)
                                      .white
                                      .makeCentered()
                                      .p2())
                              .p4
                              .roundedFull
                              .color(colorName.primary)
                              .make()
                              .positioned(top: 7, right: 5)
                          : 0.heightBox
                    ],
                    alignment: Alignment.topRight,
                  );
                },
              ),
            ],
          ).expand(),
          2.widthBox,
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserIsLoading) {
              return const CircularProgressIndicator().centered();
            } else if (state is UserIsSuccess) {
              return VStack(
                [
                  _buildAppBar(context, state.data),
                  // 20.heightBox,
                  _buildListProduct(),
                  20.heightBox,
                ],
                alignment: MainAxisAlignment.start,
                axisSize: MainAxisSize.max,
              );
            }
            return 0.heightBox;
          },
        ).p8().centered().scrollVertical(),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, UserModel data) {
    return VxBox(
      child: Container(
        height: 220,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorName.background,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<CartCountCubit, CartCountState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.go(routeName.buahPath);
                              },
                              icon: const Image(
                                image: AssetImage('assets/images/buah.png'),
                              ),
                            ),
                            const Text(
                              'Buah',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    20.widthBox,
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.go(routeName.sayurPath);
                          },
                          icon: const Image(
                            image: AssetImage('assets/images/sayur.png'),
                          ),
                        ),
                        const Text(
                          'Sayuran',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    20.widthBox,
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.go(routeName.dagingPath);
                          },
                          icon: const Image(
                            image: AssetImage('assets/images/daging.png'),
                          ),
                        ),
                        const Text(
                          'Daging',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    20.widthBox,
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.go(routeName.ikanPath);
                          },
                          icon: const Image(
                            image: AssetImage('assets/images/ikan.png'),
                          ),
                        ),
                        const Text(
                          'Ikan & Sea Food',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    20.widthBox,
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.go(routeName
                                .bumbuPath); // context.go(routeName.bumbu);
                          },
                          icon: const Image(
                            image: AssetImage('assets/images/bumbu.png'),
                          ),
                        ),
                        const Text(
                          'Bumbu Dapur',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorName.background,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<CartCountCubit, CartCountState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.go(routeName.frozenPath);
                              },
                              icon: const Image(
                                image: AssetImage('assets/images/frozen.png'),
                              ),
                            ),
                            const Text(
                              'Frozen Food',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    15.widthBox,
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.go(routeName.susuPath);
                          },
                          icon: const Image(
                            image: AssetImage('assets/images/susu.png'),
                          ),
                        ),
                        const Text(
                          'Produk Susu & Olahan',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    15.widthBox,
                  ],
                ),
              ),
            ),
            Container(
              child: _buildPromo(),
            )
          ],
        ),
      ),
    ).make();
  }

  Widget _buildPromo() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 80,
          aspectRatio: 1.4,
        ),
        items: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage("assets/images/banner4.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage("assets/images/banner1.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage("assets/images/banner3.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage("assets/images/banner2.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListProduct() {
    return BlocConsumer<ListProductBloc, ListProductState>(
      listener: (context, state) {
        if (state is ListProductIsFailed) {
          Commons().showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ListProductIsLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ListProductIsSuccess) {
          final data = state.products;
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 7,
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

  Widget _buildProductWidget(BuildContext context, ProductModel data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: VStack(
        [
          AspectRatio(
            aspectRatio: 16 / 13,
            child: Image.network(
              data.pictures![0],
              fit: BoxFit.cover,
            ),
          ),
          20.heightBox,
          VStack(
            [
              data.name!.text.size(15).bold.color(colorName.primary).make(),
              // .centered(),
              5.heightBox,
              Commons().setPriceToIDR(data.price!).text.bold.size(12).make(),
              5.heightBox,
              data.desc!.text.maxLines(3).size(12).make(),
              // .centered(),
              5.heightBox,
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.topLeft,
                // color: Colors.blue,
                child: Image(
                  image: AssetImage("assets/images/bebas_ongkir.png"),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ).pOnly(left: 15),
        ],
      ).box.make().color(Colors.white),
    ).onTap(
      () {
        context.go(routeName.detailPath, extra: data.id);
      },
    );
  }
}
