part of 'utilities.dart';

mixin routeName {
  static const login = '/login';
  static const splash = '/splash';
  static const register = '/register';
  static const home = '/home';
  static const admin = 'admin';
  static const adminPath = '/home/admin';
  //---------------------------------------------------------
  static const buah = 'buah';
  static const buahPath = '/home/buah';
  static const sayur = 'sayur';
  static const sayurPath = '/home/sayur';
  static const daging = 'daging';
  static const dagingPath = '/home/daging';
  static const ikan = 'ikan';
  static const ikanPath = '/home/ikan';
  static const bumbu = 'bumbu';
  static const bumbuPath = '/home/bumbu';
  static const frozen = 'frozen';
  static const frozenPath = '/home/frozen';
  static const susu = 'susu';
  static const susuPath = '/home/susu';
  static const minuman = 'minuman';
  static const minumanPath = '/home/minuman';
  //---------------------------------------------------------
  static const cart = 'cart';
  static const cartPath = '/home/cart';
  static const detail = 'detail';
  static const detailPath = '/home/detail';
  static const myOrder = 'myOrder';
  static const myOrderPath = '/home/myOrder';
  static const search = 'search';
  static const searchPath = '/home/search';
  static const payment = 'payment';
  static const paymentPath = '/home/myOrder/payment';
  static const paymentDetail = 'paymentDetail';
  static const paymentDetailPath = '/home/myOrder/paymentDetail';
  static const adminProduct = 'adminProduct';
  static const adminProductPath = '/home/adminProduct';
  static const adminOrder = 'adminOrder';
  static const adminOrderPath = '/home/adminOrder';
  static const adminUser = 'adminUser';
  static const adminUserPath = '/home/adminUser';
  static const checkout = 'checkout';
  static const checkoutPath = '/home/myOrder/checkout';
}

final GoRouter router = GoRouter(initialLocation: routeName.splash, routes: [
  GoRoute(
    path: routeName.splash,
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser != null) {
        BlocProvider.of<UserBloc>(context).add(LoadUserData());
        return routeName.home;
      } else {
        return routeName.login;
      }
    },
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: routeName.register,
    builder: (context, state) {
      return const RegisterScreen();
    },
  ),
  GoRoute(
    path: routeName.login,
    builder: (context, state) {
      return const AnakBagong();
    },
  ),
  GoRoute(
      path: routeName.home,
      builder: (context, state) {
        BlocProvider.of<UserBloc>(context).add(LoadUserData());
        BlocProvider.of<CartCountCubit>(context).getCartCount();
        BlocProvider.of<ListProductBloc>(context).add(FetchListProduct());
        BlocProvider.of<ListProductDagingBloc>(context)
            .add(FetchListProductDaging());
        BlocProvider.of<ListProductSayurBloc>(context)
            .add(FetchListProductSayur());
        BlocProvider.of<ListProductBuahBloc>(context)
            .add(FetchListProductBuah());
        BlocProvider.of<ListProductIkanBloc>(context)
            .add(FetchListProductIkan());
        BlocProvider.of<ListProductBumbuBloc>(context)
            .add(FetchListProductBumbu());
        BlocProvider.of<ListProductFrozenBloc>(context)
            .add(FetchListProductFrozen());
        BlocProvider.of<ListProductSusuBloc>(context)
            .add(FetchListProductSusu());
        // BlocProvider.of<ListProductMinumanBloc>(context)
        //     .add(FetchListProductMinuman());

        BlocProvider.of<ListCartBloc>(context).add(FetchListCart());
        BlocProvider.of<ListOrderBloc>(context).add(FetchListOrder());
        // BlocProvider.of<UserBloc>(context).add(FetchAllUser());
        BlocProvider.of<ListOrderAdminBloc>(context)
            .add(FetchLAdministOrderAll());
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: routeName.ikan,
          builder: (context, state) {
            BlocProvider.of<ListProductIkanBloc>(context)
                .add(FetchListProductIkan());
            return const ListIkan();
          },
        ),
        GoRoute(
          path: routeName.daging,
          builder: (context, state) {
            BlocProvider.of<ListProductDagingBloc>(context)
                .add(FetchListProductDaging());
            return const ListDaging();
          },
        ),
        GoRoute(
          path: routeName.bumbu,
          builder: (context, state) {
            BlocProvider.of<ListProductBumbuBloc>(context)
                .add(FetchListProductBumbu());
            return const ListBumbu();
          },
        ),
        GoRoute(
          path: routeName.sayur,
          builder: (context, state) {
            BlocProvider.of<ListProductSayurBloc>(context)
                .add(FetchListProductSayur());
            return const ListSayur();
          },
        ),
        GoRoute(
          path: routeName.buah,
          builder: (context, state) {
            BlocProvider.of<ListProductBuahBloc>(context)
                .add(FetchListProductBuah());
            return const ListBuah();
          },
        ),
        GoRoute(
          path: routeName.frozen,
          builder: (context, state) {
            BlocProvider.of<ListProductFrozenBloc>(context)
                .add(FetchListProductFrozen());
            return const ListFrozen();
          },
        ),

        GoRoute(
          path: routeName.frozen,
          builder: (context, state) {
            BlocProvider.of<ListProductFrozenBloc>(context)
                .add(FetchListProductFrozen());
            return const ListFrozen();
          },
        ),
        GoRoute(
          path: routeName.susu,
          builder: (context, state) {
            BlocProvider.of<ListProductSusuBloc>(context)
                .add(FetchListProductSusu());
            return const ListSusu();
          },
        ),
        // GoRoute(
        //   path: routeName.minuman,
        //   builder: (context, state) {
        //     BlocProvider.of<ListProductMinumanBloc>(context)
        //         .add(FetchListProductMinuman());
        //     return const ListMinuman();
        //   },
        // ),
        GoRoute(
          path: routeName.adminUser,
          builder: (context, state) {
            BlocProvider.of<ListUserBloc>(context).add(FetchListUser());
            return const AdminUserScreen();
          },
        ),
        GoRoute(
          path: routeName.adminOrder,
          builder: (context, state) {
            BlocProvider.of<ListOrderAdminBloc>(context)
                .add(FetchLAdministOrderAll());

            return const AdminOrderScreen();
          },
        ),
        GoRoute(
          path: routeName.adminProduct,
          builder: (context, state) {
            BlocProvider.of<ListProductBloc>(context).add(FetchListProduct());

            return const AdminProductScreen();
          },
        ),
        GoRoute(
          path: routeName.cart,
          builder: (context, state) {
            BlocProvider.of<ListCartBloc>(context).add(FetchListCart());
            return const CartScreen();
          },
        ),
        GoRoute(
          path: routeName.admin,
          builder: (context, state) {
            return const AdminScreen();
          },
        ),
        GoRoute(
          path: routeName.detail,
          builder: (context, state) {
            String id = state.extra as String;
            BlocProvider.of<DetailProductBloc>(context)
                .add(FetchDetailProduct(id));
            BlocProvider.of<CheckSavedCubit>(context).checkWishList(id);
            return const DetailScreen();
          },
        ),
        GoRoute(
          path: routeName.search,
          builder: (context, state) {
            return const SearchView();
          },
        ),
        GoRoute(
          path: routeName.myOrder,
          builder: (context, state) {
            return const MyOrderScreen();
          },
          routes: [
            GoRoute(
              path: routeName.payment,
              builder: (context, state) {
                String id = state.extra as String;
                BlocProvider.of<DetailOrderBloc>(context)
                    .add(FetchDetailOrder(id));
                return const PaymentScreen();
              },
            ),
            GoRoute(
              path: routeName.paymentDetail,
              builder: (context, state) {
                String id = state.extra as String;
                BlocProvider.of<DetailOrderBloc>(context)
                    .add(FetchDetailOrder(id));
                return const DetailOrderScreen();
              },
            ),
            GoRoute(
              path: routeName.checkout,
              builder: (context, state) {
                String id = state.extra as String;
                BlocProvider.of<DetailOrderBloc>(context)
                    .add(FetchDetailOrder(id));
                return const CheckoutScreen();
              },
            ),
          ],
        ),
      ]),
]);
