part of '../../screens.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorName.mintLeaf,
        elevation: 0,
        title: const Text(
          'PROFILE',
          style: TextStyle(color: colorName.black),
        ),
        actions: [
          BlocBuilder<CartCountCubit, CartCountState>(
            builder: (context, state) {
              return ZStack(
                [
                  IconButton(
                    onPressed: () {
                      context.go(routeName.cartPath);
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: colorName.white,
                    ),
                  ),
                  (state as CartCountIsSuccess).value != 0
                      ? VxBox(
                              child: state.value.text
                                  .size(8)
                                  .white
                                  .makeCentered()
                                  .p4())
                          .roundedFull
                          .color(colorName.accentRed)
                          .make()
                          .positioned(bottom: 5, right: 2)
                      : 0.heightBox
                ],
                alignment: Alignment.bottomCenter,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserIsSuccess) {
              return VStack(
                [
                  10.heightBox,
                  ZStack(
                    [
                      Container(
                        height: 110,
                        decoration: BoxDecoration(
                          color: colorName.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            10.widthBox,
                            VxCircle(
                              radius: 75,
                              backgroundImage:
                                  (state.data.photoProfile!.isNotEmpty)
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              state.data.photoProfile!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    13.widthBox,
                                    state.data.username!.text
                                        .size(25)
                                        .bold
                                        .make(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      color: colorName.black,
                                      icon:
                                          const Icon(Icons.edit_outlined).onTap(
                                        () {
                                          BlocProvider.of<UserBloc>(context)
                                              .add(ChangePhoto());
                                        },
                                      ),
                                    ),
                                    const Text(
                                      'Ganti Poto Profil',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).p1().centered()
                    ],
                  ),
                  10.heightBox,
                  Container(
                    height: 550,
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
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.go(routeName.cartPath);
                                },
                                icon: const Image(
                                  image: AssetImage('assets/images/email.png'),
                                  height: 35,
                                ),
                              ),
                              const Text('Emai  :'),
                              75.widthBox,
                              state.data.email!.text.size(14).make(),
                            ],
                          ),
                          20.heightBox,
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.go(routeName.cartPath);
                                },
                                icon: const Image(
                                  image: AssetImage('assets/images/wa.png'),
                                  height: 35,
                                ),
                              ),
                              const Text('Whatsapp  :'),
                              42.widthBox,
                              "081283589073".text.size(14).make(),
                            ],
                          ),
                          20.heightBox,
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.go(routeName.cartPath);
                                },
                                icon: const Image(
                                  image:
                                      AssetImage('assets/images/location.png'),
                                  height: 35,
                                ),
                              ),
                              const Text('Location  :'),
                              48.widthBox,
                              "Bekasi, Tambun Selatan".text.size(14).make(),
                            ],
                          ),
                          290.heightBox,
                          Row(
                            children: [
                              140.widthBox,
                              IconButton(
                                onPressed: () {
                                  context.go(routeName.login);
                                },
                                icon: const Image(
                                  image: AssetImage('assets/images/logout.png'),
                                  height: 35,
                                ),
                              ),
                              const Text('Log Out'),
                              50.widthBox,
                            ],
                          ).onTap(
                            () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(LogOutUser());
                              context.go(routeName.login);
                              Commons().showSnackbarError(
                                  context, "youHavebeen Logout");
                            },
                          ),
                        ],
                      ),
                    ).p(5),
                  )
                ],
              );
            }
            return 0.heightBox;
          },
        ).scrollVertical(),
      ),
    );
  }
}


// class UserView extends StatelessWidget {
//   const UserView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: colorName.juneBud,
//           ),
//           onPressed: () {
//             context.go(routeName.home);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings, color: colorName.juneBud),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: BlocBuilder<UserBloc, UserState>(
//           builder: (context, state) {
//             if (state is UserIsSuccess) {
//               return VStack(
//                 [
//                   ZStack(
//                     [
//                       VxCircle(
//                         radius: 85,
//                         backgroundImage: (state.data.photoProfile!.isNotEmpty)
//                             ? DecorationImage(
//                                 image: NetworkImage(state.data.photoProfile!),
//                                 fit: BoxFit.cover,
//                               )
//                             : null,
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         color: colorName.white,
//                         icon: const Icon(
//                           Icons.edit,
//                           color: colorName.juneBud,
//                         ).onTap(
//                           () {
//                             BlocProvider.of<UserBloc>(context)
//                                 .add(ChangePhoto());
//                           },
//                         ),
//                       )
//                     ],
//                     alignment: Alignment.bottomRight,
//                   ),
//                   5.heightBox,
//                   VStack(
//                     [
//                       state.data.username!.text.size(16).bold.make(),
//                     ],
//                     crossAlignment: CrossAxisAlignment.center,
//                   ),
//                   50.heightBox,
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Full Name',
//                         icon: Icon(Icons.book),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Email',
//                         icon: Icon(Icons.email),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                         icon: Icon(Icons.lock),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Phone',
//                         hintText: '',
//                         hintStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: colorName.juneBud),
//                         icon: Icon(Icons.phone),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Addres',
//                         hintText: '',
//                         hintStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: colorName.juneBud),
//                         icon: Icon(Icons.location_city),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                       ),
//                     ),
//                   ),
//                   20.heightBox,
//                   ElevatedButton(
//                     onPressed: () {
//                       BlocProvider.of<UserBloc>(context).add(LogOutUser());
//                       context.go(routeName.login);
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: colorName.juneBud),
//                     child: const Text('LOG OUT'),
//                   ),
//                   ButtonWidget(
//                     onPressed: () {
//                       context.go(routeName.adminPath);
//                     },
//                     text: 'Add Product',
//                     color: kPrimaryColor,
//                   ),
//                   8.heightBox,
//                   ButtonWidget(
//                     onPressed: () {
//                       context.go(routeName.myOrderPath);
//                     },
//                     text: 'My Order',
//                     color: kPrimaryColor,
//                   )
//                 ],
//                 crossAlignment: CrossAxisAlignment.center,
//               ).wFull(context);
//             }
//             return 0.heightBox;
//           },
//         ),
//       ),
//     );
//   }
// }
