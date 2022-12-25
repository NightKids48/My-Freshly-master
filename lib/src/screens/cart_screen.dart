// ignore_for_file: sort_child_properties_last, prefer_const_constructors

part of 'screens.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorName.background,
      bottomNavigationBar: BlocBuilder<ListCartBloc, ListCartState>(
        builder: (context, state) {
          if (state is ListCartIsSuccess) {
            return BlocBuilder<CheckboxCartCubit, CheckboxCartState>(
              builder: (context, checkState) {
                if (checkState is CheckboxCartIsChecked) {
                  List tempList = <ProductModel>[];

                  double cartTotalPrice() {
                    double total = 0;

                    for (var item in checkState.model) {
                      for (var u in state.data) {
                        if (u.variant![0] == item.variant![0]) {
                          tempList.add(u);
                          total += item.price!;
                        }
                      }
                    }
                    return total * 70 / 100;
                  }

                  return HStack([
                    VStack([
                      'Total,\n'.richText.withTextSpanChildren([
                        Commons()
                            .setPriceToIDR(cartTotalPrice())
                            .textSpan
                            .size(16)
                            .bold
                            .make()
                      ]).make(),
                    ]).expand(),
                    BlocListener<AddToOrderBloc, AddToOrderState>(
                      listener: (context, orderState) {
                        if (orderState is AddToOrderIsSuccess) {
                          Commons()
                              .showSnackbarInfo(context, orderState.message);
                        } else if (orderState is AddToOrderIsFailed) {
                          Commons()
                              .showSnackbarError(context, orderState.message);
                        }
                      },
                      child: BlocBuilder<CheckboxCartCubit, CheckboxCartState>(
                        builder: (context, state) {
                          return BlocBuilder<AddToOrderBloc, AddToOrderState>(
                            builder: (context, orderState) {
                              return ButtonWidget(
                                text: 'Checkout',
                                isLoading: (orderState is AddToOrderIsLoading
                                    ? true
                                    : false),
                                color: kPrimaryColor,
                                onPressed: () {
                                  BlocProvider.of<AddToOrderBloc>(context).add(
                                    OrderRequest(cartTotalPrice(),
                                        (state as CheckboxCartIsChecked).model),
                                  );
                                  context.go(
                                    routeName.myOrderPath,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    )
                  ]).p16().box.white.withShadow([
                    BoxShadow(
                        blurRadius: 10, color: colorName.grey.withOpacity(.1))
                  ]).make();
                }
                return 0.heightBox;
              },
            );
          }
          return 0.heightBox;
        },
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorName.white,
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
            Icon(Icons.shopping_cart, color: Colors.red),
            5.widthBox,
            "My Cart".text.bold.color(Colors.black).make()
          ],
        ),
        iconTheme: const IconThemeData(color: colorName.black),
        actions: [
          BlocBuilder<ListCartBloc, ListCartState>(
            builder: (context, state) {
              return (state is ListCartIsSuccess)
                  ? BlocBuilder<CheckboxCartCubit, CheckboxCartState>(
                      builder: (context, checkState) {
                        if (checkState is CheckboxCartIsChecked) {
                          return ((checkState.model
                                      .containsAll(state.retrainData))
                                  ? 'Batalkan'
                                  : 'Pilih Semua')
                              .text
                              .medium
                              .color((checkState.model
                                      .containsAll(state.retrainData))
                                  ? colorName.accentRed
                                  : kPrimaryColor)
                              .makeCentered()
                              .pOnly(right: 16)
                              .onTap(() {
                            if ((checkState.model
                                .containsAll(state.retrainData))) {
                              BlocProvider.of<CheckboxCartCubit>(context)
                                  .removeAllCheckBox();
                            } else {
                              BlocProvider.of<CheckboxCartCubit>(context)
                                  .addAllCheckBox(state.retrainData);
                            }
                          });
                        }
                        return 0.heightBox;
                      },
                    )
                  : 0.heightBox;
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   height: 100,
            //   width: double.maxFinite,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("Total Cart",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 20)),
            //       8.heightBox,
            //       BlocBuilder<ListCartBloc, ListCartState>(
            //         builder: (context, cartState) {
            //           if (cartState is ListCartIsSuccess) {
            //             return "${cartState.data.length} Item"
            //                 .text
            //                 .bold
            //                 .size(16)
            //                 .make();
            //           }
            //           return Container();
            //         },
            //       )
            //     ],
            //   ),
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.green.shade800,
            //           blurRadius: 1,
            //           offset: Offset(0, 4)),
            //     ],
            //     color: kPrimaryColor,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(30),
            //       topRight: Radius.circular(30),
            //     ),
            //   ),
            // ),
            // 16.heightBox,
            // Container(
            //   height: 190,
            //   // color: Colors.black,
            //   padding: EdgeInsets.only(right: 50, left: 50, top: 50),
            //   child: Image(
            //     image: AssetImage("assets/images/bag.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Container(
              height: 670,
              padding: EdgeInsets.only(top: 10),
              child: BlocBuilder<ListCartBloc, ListCartState>(
                builder: (context, state) {
                  if (state is ListCartIsSuccess) {
                    final data = state.data;

                    return ListView.separated(
                      separatorBuilder: (context, index) => VxDivider(
                        color: colorName.grey.withOpacity(0),
                      ),
                      itemCount: state.retrainData.length,
                      itemBuilder: (context, index) {
                        List tempList = <ProductModel>[];
                        for (var u in data) {
                          if (u.variant![0] ==
                              state.retrainData[index].variant![0]) {
                            tempList.add(u);
                          }
                        }

                        return Card(
                          child: VxBox(
                            child: HStack(
                              [
                                BlocBuilder<CheckboxCartCubit,
                                    CheckboxCartState>(
                                  builder: (context, checkState) {
                                    if (checkState is CheckboxCartIsChecked) {
                                      return checkState.model.contains(
                                              state.retrainData[index])
                                          ? Icon(
                                              Icons.check_box,
                                              color: kPrimaryColor,
                                            ).onTap(() {
                                              BlocProvider.of<
                                                          CheckboxCartCubit>(
                                                      context)
                                                  .removeCheckBox(
                                                      state.retrainData[index]);
                                            })
                                          : Icon(
                                              Icons
                                                  .check_box_outline_blank_rounded,
                                              color: kPrimaryColor,
                                            ).onTap(() {
                                              BlocProvider.of<
                                                          CheckboxCartCubit>(
                                                      context)
                                                  .addCheckBox(
                                                      state.retrainData[index]);
                                            });
                                    }
                                    return 0.heightBox;
                                  },
                                ),
                                16.widthBox,
                                VxBox()
                                    .bgImage(DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          state.retrainData[index].pictures![0],
                                        )))
                                    .roundedSM
                                    .size(context.percentWidth * 27,
                                        context.percentWidth * 27)
                                    .make(),
                                16.widthBox,
                                VStack(
                                  [
                                    state.retrainData[index].name!.text
                                        .size(16)
                                        .bold
                                        .make(),
                                    4.heightBox,
                                    Row(
                                      children: [
                                        Text(
                                          "${Commons().setPriceToIDR(state.retrainData[index].price!)}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        8.widthBox,
                                        Text(
                                          "${Commons().setPriceToIDR(state.retrainData[index].price! * 70 / 100)}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    4.heightBox,
                                    state.retrainData[index].variant![0].text
                                        .size(12)
                                        .make()
                                        .pSymmetric(h: 12, v: 6)
                                        .box
                                        .color(colorName.grey.withOpacity(.1))
                                        .make(),
                                    4.heightBox,
                                    HStack([
                                      const Icon(Icons
                                              .remove_circle_outline_rounded)
                                          .onTap(() {
                                        BlocProvider.of<ListCartBloc>(context)
                                            .add(DecrementCart(
                                                state.retrainData[index]));
                                      }),
                                      4.widthBox,
                                      tempList.length.text
                                          .size(12)
                                          .make()
                                          .pSymmetric(h: 12, v: 6)
                                          .box
                                          .color(colorName.grey.withOpacity(.1))
                                          .make(),
                                      4.widthBox,
                                      BlocListener<AddToCartBloc,
                                          AddToCartState>(
                                        listener: (context, state) {
                                          if (state is AddToCartIsSuccess) {
                                            BlocProvider.of<ListCartBloc>(
                                                    context)
                                                .add(FetchListCart());
                                          }
                                        },
                                        child: const Icon(Icons
                                                .add_circle_outline_rounded)
                                            .onTap(() {
                                          BlocProvider.of<AddToCartBloc>(
                                                  context)
                                              .add(
                                            AddToCart(
                                              state.retrainData[index],

                                              // state.retrainData[index].total!,
                                            ),
                                          );
                                        }),
                                      )
                                    ])
                                  ],
                                  alignment: MainAxisAlignment.start,
                                ).expand(),
                                BlocListener<ListCartBloc, ListCartState>(
                                  listener: (context, state) {},
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: colorName.accentRed,
                                      )),
                                )
                              ],
                              alignment: MainAxisAlignment.start,
                            ).p16(),
                          ).make(),
                        );
                      },
                    );
                  }
                  return 0.heightBox;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
