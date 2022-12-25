// ignore_for_file: prefer_const_constructors

part of '../../screens.dart';

// class DashboardView extends StatefulWidget {
//   // DefaultTabController tabController =
//   //     DefaultTabController(length: 3, child: null);
//   const DashboardView({super.key});

//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView>
//     with TickerProviderStateMixin {
//   final TextEditingController productSearchController = TextEditingController();
//   void reset() {
//     productSearchController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     TabController _tabController = TabController(length: 6, vsync: this);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         shadowColor: Colors.transparent,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: Row(
//               children: [
//                 PreferredSize(
//                   preferredSize: Size.fromHeight(10),
//                   child: Container(
//                     width: 160,
//                     // height: 40,
//                     decoration: BoxDecoration(
//                       color: colorName.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextField(
//                       controller: productSearchController,
//                       style: TextStyle(color: colorName.black),
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           prefixIcon: BlocBuilder<ListSearchProductBloc,
//                               ListSearchProductState>(
//                             builder: (context, state) {
//                               return Icon(Icons.search, color: kPrimaryColor)
//                                   .onTap(() {
//                                 BlocProvider.of<ListSearchProductBloc>(context)
//                                     .add(
//                                   FetchListProductSearch(
//                                       search: productSearchController.text),
//                                 );
//                                 context.go(routeName.searchPath);
//                               });
//                             },
//                           ),
//                           hintText: 'Cari produk segar di Freshly'),
//                     ),
//                   ).pOnly(right: 10),
//                 ),
//                 Stack(children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.grey,
//                     radius: 20,
//                     child:
//                         Icon(Icons.shopping_bag_outlined, color: Colors.white),
//                   ).onTap(() {
//                     context.go(routeName.myOrderPath);
//                   }),
//                   Positioned(
//                     // bottom: 5,
//                     left: 15,
//                     right: 1,
//                     child: Container(
//                       // padding: EdgeInsets.all(3),
//                       height: 20,
//                       width: 27,
//                       padding: EdgeInsets.all(3),
//                       child: BlocBuilder<ListOrderBloc, ListOrderState>(
//                         builder: (context, cartState) {
//                           if (cartState is ListOrderIsSuccess) {
//                             return cartState.model.length.text.size(5).make();
//                           }
//                           return Container();
//                         },
//                       ),
//                       decoration: BoxDecoration(
//                           color: Colors.redAccent.shade200,
//                           borderRadius: BorderRadius.circular(50)),
//                     ),
//                   ),
//                 ]),
//                 8.widthBox,
//                 Stack(children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.grey,
//                     radius: 20,
//                     child: Icon(Icons.shopping_cart, color: Colors.white),
//                   ).onTap(() {
//                     context.go(routeName.cartPath);
//                   }),
//                   Positioned(
//                     // bottom: 5,
//                     left: 15,
//                     right: 1,
//                     child: Container(
//                       height: 20,
//                       width: 40,
//                       padding: EdgeInsets.all(3),
//                       child: BlocBuilder<ListCartBloc, ListCartState>(
//                         builder: (context, cartState) {
//                           if (cartState is ListCartIsSuccess) {
//                             return cartState.data.length.text.size(5).make();
//                           }
//                           return Container();
//                         },
//                       ),
//                       decoration: BoxDecoration(
//                           color: Colors.redAccent.shade200,
//                           borderRadius: BorderRadius.circular(50)),
//                     ),
//                   ),
//                 ]),
//                 8.widthBox,
//                 CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   radius: 20,
//                   child: Icon(
//                     Icons.segment,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//       body: SafeArea(child: BlocBuilder<UserBloc, UserState>(
//         builder: (context, state) {
//           if (state is UserIsLoading) {
//             return const CircularProgressIndicator().centered();
//           } else if (state is UserIsSuccess) {
//             return SingleChildScrollView(
//               child: VStack(
//                 alignment: MainAxisAlignment.start,
//                 [
//                   _buildHeader(),
//                   // HeaderWithSearchBox(
//                   //   size: size,
//                   //   data: state.data,
//                   // ),
//                   // _buildAppBar(context, state.data),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: TabBar(
//                         indicatorColor: kPrimaryColor,
//                         controller: _tabController,
//                         isScrollable: true,
//                         labelColor: kPrimaryColor,
//                         unselectedLabelColor: Colors.grey,
//                         tabs: [
//                           Tab(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 40,
//                                   child: Image(
//                                     image: AssetImage("assets/images/all.jpg"),
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 2.heightBox,
//                                 "All".text.size(8).make()
//                               ],
//                             ),
//                             // icon: Icon(Icons.face),
//                           ),
//                           Tab(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 40,
//                                   child: Image(
//                                     image:
//                                         AssetImage("assets/images/sayur.jpg"),
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 2.heightBox,
//                                 "Sayur".text.size(8).make()
//                               ],
//                             ),
//                           ),
//                           Tab(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 40,
//                                   child: Image(
//                                     image: AssetImage("assets/images/buah.jpg"),
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 2.heightBox,
//                                 "Buah".text.size(8).make()
//                               ],
//                             ),
//                           ),
//                           Tab(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 40,
//                                   child: Image(
//                                     image:
//                                         AssetImage("assets/images/daging.png"),
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 2.heightBox,
//                                 "Daging".text.size(8).make()
//                               ],
//                             ),
//                           ),
//                           Tab(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 40,
//                                   child: Image(
//                                     image: AssetImage("assets/images/ikan.png"),
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 2.heightBox,
//                                 "Ikan".text.size(8).make()
//                               ],
//                             ),
//                           ),
//                           Tab(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 40,
//                                   child: Image(
//                                     image: AssetImage("assets/images/susu.png"),
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 2.heightBox,
//                                 "Ikan".text.size(8).make()
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // 16.heightBox,
//                   Container(
//                     width: double.maxFinite,
//                     height: 500,
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         SizedBox(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: _buildListProduct().expand(),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: _buildListProductSayur().expand(),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: _buildListProductBuah().expand(),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: _buildListProductDaging().expand(),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: _buildListProductIkan().expand(),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: _buildListProductDaging().expand(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // 24.heightBox,
//                   // _buildListProduct().expand(),
//                 ],
//                 // alignment: MainAxisAlignment.start,
//                 // axisSize: MainAxisSize.max,
//               ),
//             );
//           }
//           return 0.heightBox;
//         },
//       )),
//     );
//   }

//   // Widget _buildAppBar(BuildContext context, UserModel data) {
//   //   return VxBox(
//   //     child: HStack(
//   //       [
//   //         //USER Profile
//   //         HStack([
//   //           VxCircle(
//   //             radius: 56,
//   //             backgroundImage: (data.photoProfile!.isNotEmpty)
//   //                 ? DecorationImage(
//   //                     image: NetworkImage(data.photoProfile!),
//   //                     fit: BoxFit.cover,
//   //                   )
//   //                 : null,
//   //           ).onTap(() {
//   //             context.go(routeName.adminPath);
//   //           }),
//   //           16.widthBox,
//   //           "Selamat Datang,\n".richText.size(11).withTextSpanChildren([
//   //             data.username!.textSpan.size(14).bold.make(),
//   //           ]).make(),
//   //         ]).expand(),

//   //         Container(
//   //           child: TabBar(
//   //             controller: _tab, tabs: [
//   //             Tab(
//   //               text: "here1",
//   //             ),
//   //             Tab(
//   //               text: "here2",
//   //             ),
//   //             Tab(
//   //               text: "here3",
//   //             ),
//   //           ]),
//   //         ),

//   //         Container(
//   //           child: TabBarView(controller: context, children: [
//   //             Text("hi1"),
//   //             Text("hi2"),
//   //             Text("hi3"),
//   //           ]),
//   //         ),
//   //         //ICON Cart
//   //         BlocBuilder<CartCountCubit, CartCountState>(
//   //           builder: (context, state) {
//   //             return ZStack(
//   //               [
//   //                 IconButton(
//   //                   onPressed: () {
//   //                     context.go(routeName.cartPath);
//   //                   },
//   //                   icon: const Icon(
//   //                     Icons.shopping_cart_outlined,
//   //                     color: colorName.black,
//   //                   ),
//   //                 ),
//   //                 (state as CartCountIsSuccess).value != 0
//   //                     ? VxBox(
//   //                             child: state.value.text
//   //                                 .size(8)
//   //                                 .white
//   //                                 .makeCentered()
//   //                                 .p4())
//   //                         .roundedFull
//   //                         .color(colorName.accentRed)
//   //                         .make()
//   //                         .positioned(right: 8, top: 2)
//   //                     : 0.heightBox
//   //               ],
//   //               alignment: Alignment.topRight,
//   //             );
//   //           },
//   //         )
//   //       ],
//   //       // alignment: MainAxisAlignment.spaceBetween,
//   //       // axisSize: MainAxisSize.max,
//   //     ),
//   //   ).make();
//   // }

//   Widget _buildListProduct() {
//     return BlocConsumer<ListProductBloc, ListProductState>(
//       listener: (context, state) {
//         if (state is ListProductIsFailed) {
//           Commons().showSnackBar(context, state.message);
//         }
//       },
//       builder: (context, state) {
//         if (state is ListProductIsLoading) {
//           //Loading Widget
//           return const CircularProgressIndicator();
//         }
//         if (state is ListProductIsSuccess) {
//           //List Product Widget
//           final data = state.products;

//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3.5 / 4,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return _buildProductWidget(context, data[index]);
//             },
//           );
//         }
//         return Container();
//       },
//     );
//   }

//   Widget _buildListProductSayur() {
//     return BlocConsumer<ListProductSayurBloc, ListProductSayurState>(
//       listener: (context, state) {
//         if (state is ListProductSayurIsFailed) {
//           Commons().showSnackBar(context, state.message);
//         }
//       },
//       builder: (context, state) {
//         if (state is ListProductSayurIsLoading) {
//           //Loading Widget
//           return const CircularProgressIndicator();
//         }
//         if (state is ListProductSayurIsSuccess) {
//           //List Product Widget
//           final data = state.products;

//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3.5 / 4,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return _buildProductWidget(context, data[index]);
//             },
//           );
//         }
//         return Container();
//       },
//     );
//   }

//   Widget _buildListProductDaging() {
//     return BlocConsumer<ListProductDagingBloc, ListProductDagingState>(
//       listener: (context, state) {
//         if (state is ListProductDagingIsFailed) {
//           Commons().showSnackBar(context, state.message);
//         }
//       },
//       builder: (context, state) {
//         if (state is ListProductDagingIsLoading) {
//           //Loading Widget
//           return const CircularProgressIndicator();
//         }
//         if (state is ListProductDagingIsSuccess) {
//           //List Product Widget
//           final data = state.data;

//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3.5 / 4,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return _buildProductWidget(context, data[index]);
//             },
//           );
//         }
//         return Container();
//       },
//     );
//   }

//   Widget _buildListProductIkan() {
//     return BlocConsumer<ListProductIkanBloc, ListProductIkanState>(
//       listener: (context, state) {
//         if (state is ListProductIkanIsFailed) {
//           Commons().showSnackBar(context, state.message);
//         }
//       },
//       builder: (context, state) {
//         if (state is ListProductIkanIsLoading) {
//           //Loading Widget
//           return const CircularProgressIndicator();
//         }
//         if (state is ListProductIkanIsSuccess) {
//           //List Product Widget
//           final data = state.products;

//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3.5 / 4,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return _buildProductWidget(context, data[index]);
//             },
//           );
//         }
//         return Container();
//       },
//     );
//   }

//   Widget _buildListProductBuah() {
//     return BlocConsumer<ListProductBuahBloc, ListProductBuahState>(
//       listener: (context, state) {
//         if (state is ListProductBuahIsFailed) {
//           Commons().showSnackBar(context, state.message);
//         }
//       },
//       builder: (context, state) {
//         if (state is ListProductBuahIsLoading) {
//           //Loading Widget
//           return const CircularProgressIndicator();
//         }
//         if (state is ListProductBuahIsSuccess) {
//           //List Product Widget
//           final data = state.data;

//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3.5 / 4,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return _buildProductWidget(context, data[index]);
//             },
//           );
//         }
//         return Container();
//       },
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.green.shade800,
//                       blurRadius: 2,
//                       offset: Offset(0, 3))
//                 ],
//                 color: kPrimaryColor,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(70),
//                     bottomRight: Radius.circular(70)),
//               ),
//               height: 110,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 25,
//                 ),
//                 child: BlocBuilder<UserBloc, UserState>(
//                   builder: (context, userState) {
//                     if (userState is UserIsSuccess) {
//                       return Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage:
//                                 NetworkImage("${userState.data.photoProfile}"),
//                             radius: 30,
//                           ),
//                           18.widthBox,
//                           "${userState.data.username}".text.bold.white.make()
//                         ],
//                       );
//                     }
//                     return 0.heightBox;
//                   },
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.only(top: 118),
//             //   child: Container(
//             //     height: 200,
//             //     color: Colors.white,
//             //   ),
//             // )
//           ],
//         )
//       ],
//     );
//   }

//   Widget _buildProductWidget(BuildContext context, ProductModel data) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: VStack(
//         [
//           AspectRatio(
//             aspectRatio: 16 / 10,
//             child: Image.network(
//               data.pictures![0],
//               fit: BoxFit.cover,
//             ),
//           ),
//           VStack([
//             data.name!.text.size(16).bold.make(),
//             4.heightBox,
//             Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   color: kPrimaryColor,
//                   size: 15,
//                 ),
//                 Icon(Icons.star, size: 15, color: kPrimaryColor),
//                 Icon(Icons.star, size: 15, color: kPrimaryColor),
//                 const Icon(Icons.star, size: 15, color: Colors.black),
//                 const Icon(Icons.star, size: 15, color: Colors.black),
//               ],
//             ),
//             4.heightBox,
//             Commons().setPriceToIDR(data.price!).text.size(12).make(),
//             4.heightBox,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               // mainAxisSize: MainAxisSize.max,
//               children: data.category!
//                   .map((e) => Container(
//                         padding: EdgeInsets.only(right: 5),
//                         child:
//                             e.text.color(Colors.grey.withOpacity(0.4)).make(),
//                       ))
//                   .toList(),
//             )
//           ]).p8()
//         ],
//       ).box.white.make(),
//     ).onTap(() {
//       context.go(routeName.detailPath, extra: data.id);
//     });
//   }
// }

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
                          return const Icon(Icons.search, color: kPrimaryColor)
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
              // IconButton(
              //   onPressed: () {
              //     context.go(routeName.myOrderPath);
              //   },
              //   icon: const Icon(
              //     Icons.shopping_cart,
              //     color: colorName.white,
              //   ),
              // ),
              // BlocBuilder<ListOrderBloc, ListOrderState>(
              //   builder: (context, listOrderState) {
              //     if (listOrderState is ListOrderIsSuccess) {
              //       return VxBox(child: Text("${listOrderState.model.length}"))
              //           .roundedFull
              //           .color(colorName.primary)
              //           .make()
              //           .positioned(bottom: 5, right: 30);
              //     }
              //     return Container();
              //   },
              // ),
              25.widthBox,
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
                              .positioned(bottom: 7, right: 30)
                          : 0.heightBox
                    ],
                    alignment: Alignment.bottomCenter,
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
                                      .size(12)
                                      .white
                                      .makeCentered()
                                      .p2())
                              .p4
                              .roundedFull
                              .color(colorName.primary)
                              .make()
                              .positioned(bottom: 5, right: 30)
                          : 0.heightBox
                    ],
                    alignment: Alignment.bottomCenter,
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
            // 8.heightBox,
            Container(
              child: _buildPromo(),
            )
            // const Divider(color: kPrimaryColor),
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
