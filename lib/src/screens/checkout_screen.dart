part of 'screens.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Container(
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ).onTap(() {
            context.go(routeName.home);
          }),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.check_box_outline_blank, color: Colors.red),
            // 10.widthBox,
            "Checkout".text.bold.color(colorName.black).make(),
          ],
        ),
        iconTheme: const IconThemeData(color: colorName.black),
        actions: [],
      ),
      body: SafeArea(
        child: BlocConsumer<DetailOrderBloc, DetailOrderState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is DetailOrderIsFailed) {
              Commons().showSnackbarError(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is DetailOrderIsLoading) {
              return const CircularProgressIndicator().centered();
            } else if (state is DetailOrderIsSuccess) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                      child: Container(
                        height: 1000,
                        width: double.maxFinite,
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                10.heightBox,
                                "DETAIL ORDER".text.size(26).bold.make(),
                                20.heightBox,
                                "Tanggal Order : ${state.model.dateTime}"
                                    .text
                                    .make(),
                                "Order Id : ${state.model.id}".text.make(),
                                10.heightBox,
                                Column(
                                    children: state.model.products
                                        .map((e) => ListTile(
                                              subtitle: "Price ${e.price}"
                                                  .text
                                                  .make(),
                                              title: "${e.name}".text.make(),
                                              leading: Container(
                                                  child: Image(
                                                      image: NetworkImage(
                                                          e.pictures![0]))),
                                            ))
                                        .toList()),
                                20.heightBox,
                                "Total Bayar : ${Commons().setPriceToIDR(state.model.totalPrice!)}"
                                    .text
                                    .bold
                                    .size(18)
                                    .make(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 8,
                        left: 8,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<DetailOrderBloc, DetailOrderState>(
        builder: (context, stateDetailOrder) {
          if (stateDetailOrder is DetailOrderIsSuccess) {
            return VStack(
              [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ButtonWidget(
                              isLoading: false,
                              onPressed: () {
                                context.go(routeName.myOrderPath);
                                Commons().showSnackbarError(
                                    context, "Transaksi Dibatalkan");
                              },
                              color: Colors.red,
                              text: "Batalkan Transaksi",
                            ).expand(),
                          ],
                        ),
                        10.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              ButtonWidget(
                                isLoading: false,
                                onPressed: () {
                                  BlocProvider.of<OnBayarBloc>(context).add(
                                      OnBayarClick(
                                          data: stateDetailOrder.model));
                                  context.go(
                                    routeName.paymentPath,
                                    extra: stateDetailOrder.model.id,
                                  );
                                },
                                color: kPrimaryColor,
                                text: "Pembayaran",
                              ).expand(),
                            ],
                          ),
                        ),
                      ],
                    )),
                10.heightBox,
                Container(
                  height: 00,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorName.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // child: Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 5),
                    //       child: Row(
                    //         children: [
                    //           ButtonWidget(
                    //             isLoading: false,
                    //             onPressed: () {
                    //               context.go(routeName.myOrderPath);
                    //               Commons().showSnackbarError(
                    //                   context, "Transaksi Dibatalkan");
                    //             },
                    //             color: Colors.red,
                    //             text: "Batalkan Transaksi",
                    //           ).expand(),
                    //         ],
                    //       ),
                    //     ),
                    //     10.heightBox,
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 5),
                    //       child: Row(
                    //         children: [
                    //           ButtonWidget(
                    //             isLoading: false,
                    //             onPressed: () {
                    //               BlocProvider.of<OnBayarBloc>(context).add(
                    //                   OnBayarClick(
                    //                       data: stateDetailOrder.model));
                    //               context.go(
                    //                 routeName.paymentDetailPath,
                    //                 extra: stateDetailOrder.model.id,
                    //               );
                    //               Commons().showSnackbarInfo(
                    //                   context, "Berhasil Dibayar");
                    //             },
                    //             color: kPrimaryColor,
                    //             text: "Bayar",
                    //           ).expand(),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ).p(5),
                )
              ],
            ).scrollVertical();
          } else if (stateDetailOrder is DetailOrderIsLoading) {
            return CircularProgressIndicator().centered();
          }
          return 0.heightBox;
        },
      ),
    );
  }
}
