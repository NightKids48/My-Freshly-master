// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

part of 'screens.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

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
          children: [
            Icon(Icons.shopping_bag_outlined, color: Colors.red),
            10.widthBox,
            "My Order".text.bold.color(colorName.black).make(),
          ],
        ),
        iconTheme: const IconThemeData(color: colorName.black),
        actions: [],
      ),
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserIsSuccess) {
              return Container(
                // decoration: BoxDecoration(color: kPrimaryColor),
                child: ZStack(
                  [
                    // _buildHeader(),

                    PromoCard().p(5),
                    8.heightBox,
                    _buildOrder().pOnly(top: 180, right: 10, left: 10),
                    // Container(
                    //         margin: const EdgeInsets.only(right: 4, left: 4),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             // ignore: prefer_const_literals_to_create_immutables
                    //             boxShadow: [
                    //               const BoxShadow(
                    //                   color: Colors.black,
                    //                   blurRadius: 3,
                    //                   offset: Offset(2, 0)),
                    //               const BoxShadow(
                    //                   color: Colors.black,
                    //                   blurRadius: 3,
                    //                   offset: Offset(0, 5))
                    //             ],
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: const _buildOrder())
                    //     .pOnly(top: 180, right: 10, left: 10),
                  ],
                  // crossAlignment: CrossAxisAlignment.center,
                ).wFull(context),
              );
            }
            return 0.heightBox;
          },
        ).scrollVertical(),
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
                        offset: const Offset(0, 3))
                  ],
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    // bottomRight: Radius.circular(80),
                  ),
                ),
                height: 310,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 120,
                      color: kPrimaryColor,
                      child: const Image(
                          image: AssetImage('assets/images/order.png'),
                          fit: BoxFit.contain),
                    ).pOnly(bottom: 130, left: 5, top: 10),
                    // 5.widthBox,
                    Container(
                      child: "My Order"
                          .text
                          .bold
                          .color(Colors.white)
                          .size(25)
                          .make(),
                    ).pOnly(bottom: 130, left: 5, top: 10)
                  ],
                )),

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

class PromoCard extends StatelessWidget {
  const PromoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        children: [
          18.widthBox,
          BuildCard(
            promoCode: "ThksFreshly",
            colors1: Colors.blue,
            colors2: Colors.blue.shade900,
            promo: '30%',
          ).onTap(() {
            Commons().showSnackbarInfo(
                context, "Selamat Anda Mendapatkan Potongan 30%");
          }),
          6.widthBox,
          BuildCard(
            promoCode: "FreshlySemakinDidepan",
            colors1: Colors.red,
            colors2: Colors.red.shade900,
            promo: '50%',
          ),
          BuildCard(
            promoCode: "YukKitaJ4j4n",
            colors1: Colors.yellow,
            colors2: Colors.yellow.shade900,
            promo: '20%',
          )
        ],
      ).scrollHorizontal(physics: ScrollPhysics()),
    );
  }
}

class BuildCard extends StatelessWidget {
  final String promoCode;
  final String promo;
  final Color colors1;
  final Color colors2;
  const BuildCard({
    Key? key,
    required this.promoCode,
    required this.promo,
    required this.colors1,
    required this.colors2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  gradient: LinearGradient(
                    colors: [colors1, colors2],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "Save".text.bold.white.size(18).make(),
                  "${promo}".text.bold.size(28).white.make(),
                  "on your".text.white.size(5).make(),
                  "next order".text.white.size(5).make(),
                ],
              ),
            ).expand(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Your Promo Code".text.bold.size(18).color(colors1).make(),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: promoCode.text.bold.color(colors1).make(),
                    decoration:
                        BoxDecoration(border: Border.all(color: colors1)),
                  ),
                  3.heightBox,
                  "Dapatkan Promo Akhir Tahun".text.bold.size(5).make(),
                  "Lorem Ipsum is simply dummy,".text.size(2).make(),
                  "Lorem Ipsum has been the".text.size(2).make(),
                ],
              ),
            ).p(10),
          ],
        ),
      ),
    );
  }
}

class _buildOrder extends StatelessWidget {
  const _buildOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOrderBloc, ListOrderState>(
      builder: (context, listOrderState) {
        if (listOrderState is ListOrderIsSuccess) {
          return ListView.separated(
            separatorBuilder: (context, index) =>
                VxDivider(color: colorName.white.withOpacity(.8)).px20(),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: listOrderState.model.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  shadowColor: Colors.blue,
                  child: VStack([
                    HStack([
                      listOrderState.model[index].productName!.text
                          .make()
                          .expand(),
                      ((listOrderState.model[index].paymentStatus! == 0
                                  ? 'Belum Dibayar'
                                  : listOrderState
                                              .model[index].paymentStatus! ==
                                          1
                                      ? 'Menunggu Konfrimasi...'
                                      : listOrderState.model[index]
                                                  .paymentStatus! ==
                                              2
                                          ? 'Pesanan Diproses'
                                          : 'Pesanan Dibatalkan')
                              .text)
                          .color((listOrderState.model[index].paymentStatus! ==
                                  0
                              ? colorName.accentRed
                              : listOrderState.model[index].paymentStatus! == 1
                                  ? colorName.accentBlue
                                  : colorName.accentGreen))
                          .make() // TODO: Add up your widgets
                    ]),
                    const VxDivider(type: VxDividerType.horizontal).py8(),
                    VStack(listOrderState.model[index].products
                        .map((e) => HStack([
                              VxBox()
                                  .size(40, 40)
                                  .bgImage(DecorationImage(
                                    image: NetworkImage(
                                      e.pictures![0],
                                    ),
                                    fit: BoxFit.cover,
                                  ))
                                  .roundedSM
                                  .make(),
                              4.widthBox,
                              e.name!.text.make(),
                            ]).py4())
                        .toList()),
                    16.heightBox,
                    'Total: ${Commons().setPriceToIDR(listOrderState.model[index].totalPrice!)}'
                        .text
                        .bold
                        .make()
                        .objectBottomRight(), // TODO: Add up your widgets
                  ])
                      .p16()
                      .box
                      .roundedSM
                      .color(colorName.white)
                      .make()
                      .p16()
                      .onTap(() {
                    switch (listOrderState.model[index].paymentStatus!) {
                      case 0:
                        // //TODO: Belum dibayar
                        // Commons().showSnackBar(context, 'Ke Halaman Pembayaran');
                        context.go(
                          routeName.checkoutPath,
                          extra: listOrderState.model[index].id,
                        );
                        break;
                      case 1:
                        //TODO: Diproses
                        // Commons().showSnackBar(context, 'Ke Halaman Detail');

                        context.go(
                          routeName.paymentDetailPath,
                          extra: listOrderState.model[index].id,
                        );

                        break;
                      case 2:
                        //TODO: Selesai
                        Commons().showSnackBar(context, 'Ke Halaman Selesai');
                        break;
                      default:
                    }
                  }),
                ),
              );
            },
          );
        }
        return 0.heightBox;
      },
    );
  }
}
