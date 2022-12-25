// ignore_for_file: prefer_const_constructors

part of 'screens.dart';

class DetailOrderScreen extends StatefulWidget {
  const DetailOrderScreen({super.key});

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "On Progress",
          textStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_one, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Preparing"),
        // subtitle: StepperText("Your order is being prepared"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText("On the way"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
    StepperData(
      title: StepperText("Delivered",
          textStyle: const TextStyle(
            color: Colors.grey,
          )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                      height: 270,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_eop7ymay.json",
                          fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 280),
                      child: AnotherStepper(
                        stepperList: stepperData,
                        stepperDirection: Axis.horizontal,
                        iconWidth:
                            40, // Height that will be applied to all the stepper icons
                        iconHeight:
                            40, // Width that will be applied to all the stepper icons
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 350, right: 10, left: 10),
                      child: Container(
                        height: 500,
                        width: double.maxFinite,
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                10.heightBox,
                                "INVOICE".text.size(26).bold.make(),
                                20.heightBox,
                                "Tanggal Order : ${state.model.dateTime}"
                                    .text
                                    .make(),
                                "Order Id : ${state.model.id}".text.make(),
                                20.heightBox,
                                "Sudah dibayar : ${Commons().setPriceToIDR(state.model.totalPrice!)}"
                                    .text
                                    .bold
                                    .size(18)
                                    .make(),
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
                                        .toList())
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              radius: 20,
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                            ).onTap(() {
                              // context.go(routeName.myOrderPath);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyOrderScreen()),
                              );
                            }),
                          ),
                          Container(
                            child: "STATUS TRANSAKSI"
                                .text
                                // .color(kPrimaryColor)
                                .bold
                                .size(24)
                                .make(),
                          ),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              radius: 20,
                              child: Icon(Icons.menu, color: Colors.white),
                            ).onTap(() {
                              context.go(routeName.myOrderPath);
                            }),
                          ),
                        ],
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
    );
  }
}
