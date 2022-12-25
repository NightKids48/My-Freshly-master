part of 'screens.dart';

class AdminOrderScreen extends StatefulWidget {
  const AdminOrderScreen({super.key});

  @override
  State<AdminOrderScreen> createState() => _AdminOrderScreenState();
}

class _AdminOrderScreenState extends State<AdminOrderScreen> {
  List<String> list = <String>[
    'Update Pesanan',
    'Di Proses',
    'Sedang Diantar',
    'Sampai'
  ];
  // final String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            "List of Order".text.color(Colors.black54).make(),
            BlocBuilder<ListOrderAdminBloc, ListOrderAdminState>(
              builder: (context, stateListOrder) {
                if (stateListOrder is ListOrderAdminIsSuccess) {
                  return "${stateListOrder.model.length}"
                      .text
                      .color(Colors.black54)
                      .make();
                }
                return Container();
              },
            )
          ],
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: kPrimaryColor).onTap(() {
          context.go(routeName.home);
        }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
          Container(child: BlocBuilder<ListOrderAdminBloc, ListOrderAdminState>(
        builder: (context, listOrderState) {
          if (listOrderState is ListOrderAdminIsSuccess) {
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
                        ((listOrderState.model[index].paymentStatus == 0)
                            ? "Belum Dibayar".text.make()
                            : (listOrderState.model[index].paymentStatus == 1)
                                ? ButtonWidget(
                                    isLoading: false,
                                    onPressed: () {
                                      Commons().showSnackbarInfo(
                                          context, "Pesanan Dikonfrimasi");
                                    },
                                    text: "Konfrimasi Pesanan",
                                  )
                                : (listOrderState.model[index].paymentStatus ==
                                        2)
                                    ? "selesai".text.make()
                                    : "Pesanan Dibatalkan".text.make())
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
                          .objectBottomRight(),
                      DropdownButton(
                        value: list.first,
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                        },
                      ) // TODO: Add up your widgets
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
                            routeName.paymentPath,
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
      )).centered(),
    );
  }
}
