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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage('assets/images/email.png'),
                                  height: 35,
                                ),
                              ),
                              const Text('Email'),
                              IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage('assets/images/email.png'),
                                  height: 35,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
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
                          10.heightBox,
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
