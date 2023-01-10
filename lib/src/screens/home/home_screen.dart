// ignore_for_file: prefer_const_constructors

part of '../screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Beranda',
      activeIcon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline_rounded),
      label: 'Wishlist',
      activeIcon: Icon(Icons.favorite),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_rounded),
      label: 'Profil',
      activeIcon: Icon(Icons.person),
    ),
  ];

  final pageItems = const [DashboardView(), WishlistView(), UserView()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (userState is UserIsLoading) {
          return Container(
              color: Colors.grey.shade200,
              child: const CircularProgressIndicator().centered());
        }
        if (userState is UserIsSuccess) {
          if (userState.data.admin == true) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: kPrimaryColor,
                  centerTitle: true,
                  elevation: 0,
                  actions: [
                    Icon(Icons.logout_outlined).onTap(() {
                      BlocProvider.of<UserBloc>(context).add(LogOutUser());
                      context.go(routeName.login);
                      Commons()
                          .showSnackbarError(context, "You Havebeen Logout");
                    }),
                  ],
                  title: "Welcome Admin".text.make(),
                ),
                body: Container(
                  color: Colors.grey.shade200,
                  child: Stack(
                    children: [
                      Container(
                        // ignore: sort_child_properties_last
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://static.standard.co.uk/s3fs-public/thumbnails/image/2016/03/31/14/peakyblinders3003a.jpg?width=1200&auto=webp&quality=75",
                              ),
                            ),
                            "Hay Tayo".text.white.makeCentered(),
                            4.heightBox,
                            "IDR 5.204.000".text.bold.white.size(20).make(),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 170,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    gradient: LinearGradient(colors: [
                                      Colors.pinkAccent,
                                      Colors.pink.shade200,
                                    ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.speed_outlined,
                                        color: Colors.grey.shade200,
                                        size: 40,
                                      ),
                                      "Dashboard"
                                          .text
                                          .bold
                                          .size(16)
                                          .color(Colors.grey.shade200)
                                          .make(),
                                      24.heightBox,
                                      "Tap to view"
                                          .text
                                          .size(12)
                                          .color(Colors.grey.shade200)
                                          .make(),
                                    ],
                                  ),
                                ),
                                16.widthBox,
                                Container(
                                  height: 130,
                                  width: 170,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    gradient: LinearGradient(colors: [
                                      Colors.orangeAccent,
                                      Colors.orange.shade200,
                                    ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: Colors.grey.shade200,
                                        size: 40,
                                      ),
                                      "User"
                                          .text
                                          .bold
                                          .size(16)
                                          .color(Colors.grey.shade200)
                                          .make(),
                                      "4"
                                          .text
                                          .bold
                                          .color(Colors.grey.shade200)
                                          .size(20)
                                          .make(),
                                      8.heightBox,
                                      "Tap to view"
                                          .text
                                          .size(12)
                                          .color(Colors.grey.shade200)
                                          .make(),
                                    ],
                                  ),
                                ).onTap(() {
                                  context.go(routeName.adminUserPath);
                                }),
                              ],
                            ),
                            16.heightBox,
                            Row(
                              children: [
                                BlocBuilder<ListOrderAdminBloc,
                                    ListOrderAdminState>(
                                  builder: (context, listOrderState) {
                                    if (listOrderState
                                        is ListOrderAdminIsSuccess) {
                                      return Container(
                                        height: 130,
                                        width: 170,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          gradient: LinearGradient(colors: [
                                            Colors.purpleAccent,
                                            Colors.purple.shade200,
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.grey.shade200,
                                              size: 40,
                                            ),
                                            "Order Process"
                                                .text
                                                .bold
                                                .size(16)
                                                .color(Colors.grey.shade200)
                                                .make(),
                                            "${listOrderState.model.length}"
                                                .text
                                                .bold
                                                .color(Colors.grey.shade200)
                                                .size(20)
                                                .make(),
                                            8.heightBox,
                                            "Tap to view"
                                                .text
                                                .size(12)
                                                .color(Colors.grey.shade200)
                                                .make(),
                                          ],
                                        ),
                                      ).onTap(() {
                                        context.go(routeName.adminOrderPath);
                                      });
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                                16.widthBox,
                                BlocBuilder<ListProductBloc, ListProductState>(
                                  builder: (context, productState) {
                                    if (productState is ListProductIsSuccess) {
                                      return Container(
                                        height: 130,
                                        width: 170,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          gradient: LinearGradient(colors: [
                                            Colors.blueAccent,
                                            Colors.blue.shade300,
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.grey.shade200,
                                              size: 40,
                                            ),
                                            "Product"
                                                .text
                                                .bold
                                                .size(16)
                                                .color(Colors.grey.shade200)
                                                .make(),
                                            "${productState.products.length}"
                                                .text
                                                .bold
                                                .color(Colors.grey.shade200)
                                                .size(20)
                                                .make(),
                                            8.heightBox,
                                            "Tap to view"
                                                .text
                                                .size(12)
                                                .color(Colors.grey.shade200)
                                                .make(),
                                          ],
                                        ),
                                      ).onTap(() {
                                        context.go(routeName.adminProductPath);
                                      });
                                    }
                                    return 0.heightBox;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).centered().pOnly(top: 130, left: 20),
                      Container(
                        child: LineChartSample2(),
                      ).pOnly(top: 420, right: 10, left: 10)
                    ],
                  ),
                ));
          } else {
            return Scaffold(
                backgroundColor: colorName.background,
                bottomNavigationBar:
                    BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
                  builder: (context, state) {
                    return BottomNavigationBar(
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      selectedItemColor: colorName.mintLeaf,
                      type: BottomNavigationBarType.shifting,
                      unselectedItemColor: colorName.grey,
                      items: bottomNavBarItems,
                      currentIndex: (state as BottomNavBarIsChanged).index,
                      onTap: (value) {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changeIndex(value);
                        if (value == 1) {
                          BlocProvider.of<ListWishlistBloc>(context)
                              .add(FetchListWishlist());
                        }
                        if (value == 2) {
                          BlocProvider.of<ListOrderBloc>(context)
                              .add(FetchListOrder());
                        }
                      },
                    );
                  },
                ),
                body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
                  builder: (context, state) {
                    return pageItems[(state as BottomNavBarIsChanged).index];
                  },
                ));
          }
        }
        return Scaffold(
            backgroundColor: colorName.background,
            bottomNavigationBar:
                BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
              builder: (context, state) {
                return BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  selectedItemColor: kPrimaryColor,
                  type: BottomNavigationBarType.shifting,
                  unselectedItemColor: colorName.grey,
                  items: bottomNavBarItems,
                  currentIndex: (state as BottomNavBarIsChanged).index,
                  onTap: (value) {
                    BlocProvider.of<BottomNavBarCubit>(context)
                        .changeIndex(value);
                    if (value == 1) {
                      BlocProvider.of<ListWishlistBloc>(context)
                          .add(FetchListWishlist());
                    }
                    if (value == 2) {
                      BlocProvider.of<ListOrderBloc>(context)
                          .add(FetchListOrder());
                    }
                  },
                );
              },
            ),
            body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
              builder: (context, state) {
                return pageItems[(state as BottomNavBarIsChanged).index];
              },
            ));
      },
    );
  }
}
