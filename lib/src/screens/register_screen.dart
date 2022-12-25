part of 'screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterIsFailed) {
              Commons()
                  .showSnackbarError(context, "Harap masukkan data yang benar");
            } else if (state is RegisterIsSuccess) {
              context.go(routeName.home);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/register_image.png',
                  height: 450,
                  width: 450,
                ).p(0),
                5.heightBox,
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          label: Text(
                            'User Name',
                            style: TextStyle(fontSize: 13),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline_rounded,
                              color: Colors.amber),
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(fontSize: 13),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(fontSize: 13),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_clock_rounded,
                              color: Colors.amber),
                        ),
                      ),
                      20.heightBox,
                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return ButtonWidget(
                            color: kPrimaryColor,
                            onPressed: () {
                              BlocProvider.of<RegisterBloc>(context).add(
                                RegisterUser(
                                    username: usernameController.text,
                                    email: emailController.text,
                                    password: passController.text),
                              );
                            },
                            isLoading:
                                (state is RegisterIsLoading) ? true : false,
                            text: 'Register',
                          ).wFull(context);
                        },
                      ),
                      40.heightBox,
                      "Already Have Account"
                          .richText
                          .size(12)
                          .withTextSpanChildren(
                            [
                              " Login Here"
                                  .textSpan
                                  .size(14)
                                  .bold
                                  .amber500
                                  .make()
                            ],
                          )
                          .makeCentered()
                          .onTap(
                            () {
                              context.go(routeName.login);
                            },
                          )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
