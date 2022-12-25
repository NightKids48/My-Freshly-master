// ignore_for_file: prefer_const_constructors

part of 'screens.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> images = [
    // 'https://www.pngall.com/wp-content/uploads/2016/05/ATM-Card-Download-PNG.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_4Xe3PG4JrN9V1yx-LjoW-6DSawAKk9Xa5GlksUzNlSIC5CY7-3lWy43BwVdmW37rm2w&usqp=CAU',
    'https://pngimg.com/uploads/credit_card/credit_card_PNG188.png',
    'https://freepngimg.com/save/9534-atm-card-png-clipart/2000x1294',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _buildListImage2(
              context,
              _current,
              _controller,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: _buildInfo(),
            )
          ],
        ),
      ).centered(),
    );
  }

  Widget _buildInfo() {
    return BlocBuilder<DetailOrderBloc, DetailOrderState>(
      builder: (context, stateDetailOrder) {
        if (stateDetailOrder is DetailOrderIsSuccess) {
          return VStack(
            [
              10.heightBox,
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 70,
                  // width: 100,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorName.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      "Ketentuan".text.bold.size(14).make(),
                      "Lakukan Pembayaran Dengan Transfer Ke rekening Bersama Dibawah ini, hati- hati penipuan Jika ada yang mengatas namakan pihak Freshly untuk melakukan transaksi selain ke rekening tersebut"
                          .text
                          .size(10)
                          .center
                          .make(),
                    ],
                  )),
              10.heightBox,
              Container(
                height: 370,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorName.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      10.heightBox,
                      Row(
                        // ignore: sort_child_properties_last
                        children: [
                          IconButton(
                            onPressed: () {
                              context.go(routeName.cartPath);
                            },
                            icon: const Image(
                              image: AssetImage('assets/images/card.png'),
                              height: 35,
                            ),
                          ),
                          const Text('Rekening Number'),
                          73.widthBox,
                          Container(
                            child: "0092-0998-0233-00".text.size(14).make(),
                          )
                        ],
                      ),
                      10.heightBox,
                      Row(
                        // ignore: sort_child_properties_last
                        children: [
                          IconButton(
                            onPressed: () {
                              context.go(routeName.cartPath);
                            },
                            icon: const Image(
                              image: AssetImage('assets/images/user.png'),
                              height: 35,
                            ),
                          ),
                          const Text('User'),
                          175.widthBox,
                          Container(
                            alignment: Alignment.centerRight,
                            child: "Lee M Chardoler".text.size(14).make(),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        // ignore: sort_child_properties_last
                        children: [
                          IconButton(
                            onPressed: () {
                              context.go(routeName.cartPath);
                            },
                            icon: const Image(
                              image: AssetImage('assets/images/location.png'),
                              height: 35,
                            ),
                          ),
                          const Text('Location'),
                          90.widthBox,
                          Container(
                            alignment: Alignment.centerRight,
                            child: "70 Jellicoe Road, Lavender"
                                .text
                                .size(14)
                                .make(),
                          ),
                        ],
                      ),
                      60.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
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
                                    OnBayarClick(data: stateDetailOrder.model));
                                context.go(
                                  routeName.paymentDetailPath,
                                  extra: stateDetailOrder.model.id,
                                );
                                Commons().showSnackbarInfo(
                                    context, "Berhasil Dibayar");
                              },
                              color: kPrimaryColor,
                              text: "Bayar",
                            ).expand(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).p(5),
              )
            ],
          );
        } else if (stateDetailOrder is DetailOrderIsLoading) {
          return CircularProgressIndicator().centered();
        }
        return 0.heightBox;
      },
    );
  }

  Widget _buildListImage2(BuildContext context, curent, controller) {
    // int _current = 0;
    // final CarouselController _controller = CarouselController();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    aspectRatio: 1.6,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                  ),
                  items: images
                      .map(
                        (e) => Container(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image(
                                    image: NetworkImage(e),
                                    fit: BoxFit.contain,
                                    width: 700,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 11,
                        height: 11,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : kPrimaryColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
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
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ).onTap(() {
                  // context.go(routeName.myOrderPath);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyOrderScreen()),
                  );
                }),
              ),
              Container(
                child: "CARD CHECKOUT"
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
    );
  }
}
