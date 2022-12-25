import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly/src/blocs/blocs.dart';
import 'package:freshly/src/blocs/detail_product/detail_product_bloc.dart';
import 'package:freshly/src/blocs/list_user/list_user_bloc.dart';
import 'package:freshly/src/cubits/cubits.dart';
import 'package:freshly/src/utilities/utilities.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => ProductPictureCubit()),
        BlocProvider(create: (context) => ListProductBloc()),
        BlocProvider(create: (context) => ListProductSayurBloc()),
        BlocProvider(create: (context) => ListProductBuahBloc()),
        BlocProvider(create: (context) => ListProductDagingBloc()),
        BlocProvider(create: (context) => ListProductIkanBloc()),
        BlocProvider(create: (context) => ListSearchProductBloc()),
        BlocProvider(create: (context) => DetailProductBloc()),
        BlocProvider(create: (context) => DetailOrderBloc()),
        BlocProvider(create: (context) => OnBayarBloc()),
        BlocProvider(create: (context) => ListWishlistBloc()),
        BlocProvider(create: (context) => CheckSavedCubit()),
        BlocProvider(create: (context) => CheckVariantCubit()),
        BlocProvider(create: (context) => CartCountCubit()),
        BlocProvider(create: (context) => BottomNavBarCubit()),
        BlocProvider(create: (context) => ListCartBloc()),
        BlocProvider(create: (context) => CheckboxCartCubit()),
        BlocProvider(create: (context) => AddToCartBloc()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ListOrderBloc()),
        BlocProvider(create: (context) => ListOrderAdminBloc()),
        BlocProvider(create: (context) => AddToOrderBloc()),
        BlocProvider(create: (context) => ListUserBloc()),
        BlocProvider(create: (context) => ListProductBumbuBloc()),
        BlocProvider(create: (context) => ListProductFrozenBloc()),
        BlocProvider(create: (context) => ListProductSusuBloc()),
        // BlocProvider(create: (context) => ListProductMinumanBloc()),
        BlocProvider(
            create: (context) =>
                WishlistCubit(BlocProvider.of<CheckSavedCubit>(context))),
        BlocProvider(
            create: (context) =>
                AdminBloc(BlocProvider.of<ProductPictureCubit>(context))),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
