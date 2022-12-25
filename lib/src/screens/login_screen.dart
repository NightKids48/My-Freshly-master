part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginIsFailed) {
              Commons().showSnackBar(context, state.message);
            } else if (state is LoginIsSuccess) {
              context.go(routeName.home);
            }
          },
          child: SingleChildScrollView(
            child: VStack(
              [
                8.heightBox,
                VxBox(
                  child: Image(
                    image: AssetImage("assets/images/toko.png"),
                    fit: BoxFit.contain,
                  ).pOnly(top: 20),
                )
                    .size(context.screenWidth, context.percentHeight * 25)
                    // .color(colorName.accentBlue)

                    .bottomRounded(value: 20)
                    .make(),
                'SIGN IN'.text.bold.headline5(context).makeCentered().p16(),
                Container(
                  height: 80,
                  width: 200,
                  // color: Colors.black,
                  child: Lottie.network(
                      "https://assets9.lottiefiles.com/packages/lf20_5aw3ejl3.json"),
                ).centered(),
                _buildLoginForm(),
                // 10.heightBox,
                VxBox(
                  child: VStack(
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                    [
                      "OR".text.bold.size(25).make(),
                      ButtonWidget(
                        text: "Sign Up Here",
                        onPressed: () {
                          context.go(routeName.register);
                        },
                      ).p(5)
                    ],
                  ),
                )
                    .size(context.screenWidth, context.percentHeight * 24)
                    .bgImage(DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-vector/water-drop-background-with-leaves-fresh-green-vector-illustration_534957-34.jpg"),
                        fit: BoxFit.cover))
                    .color(kPrimaryColor)
                    .topRounded(value: 180)
                    // .shadow5xl
                    .withShadow([
                  BoxShadow(
                    color: Colors.green.shade800,
                    blurRadius: 9,
                    offset: Offset(8, 0),
                  ),
                  BoxShadow(
                    color: Colors.green.shade800,
                    blurRadius: 9,
                    offset: Offset(0, -8),
                  )
                ]).make()
              ],
            ).pOnly(top: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return VStack(
      [
        TextFieldWidget(
          controller: emailController,
          title: 'Email',
          icon: Icon(
            Icons.email,
            color: Colors.amber,
          ),
        ),
        8.heightBox,
        TextFieldWidget(
          controller: passController,
          title: 'Password',
          icon: Icon(Icons.key, color: Colors.amber),
          isPassword: true,
        ),
        16.heightBox,
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return ButtonWidget(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LoginUser(
                    email: emailController.text,
                    password: passController.text));
              },
              isLoading: (state is LoginIsLoading) ? true : false,
              text: 'Login',
              // color: Color.fromARGB(255, 168, 190, 0),
            ).wFull(context);
          },
        ),
        50.heightBox,
        // 'Register here'.text.makeCentered().onTap(() {
        //   context.go(routeName.register);
        // })
      ],
    ).p16();
  }
}
