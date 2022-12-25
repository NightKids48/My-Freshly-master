part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: VStack([
        Container(
          height: 400,
          width: 500,
          // color: Colors.black,
          child: Lottie.network(
              "https://assets9.lottiefiles.com/packages/lf20_5aw3ejl3.json"),
        ).centered(),
        'Freshly'
            .text
            .bold
            .size(25)
            .color(Color.fromARGB(255, 10, 191, 219))
            .makeCentered(),
      ]).centered(),
    );
  }
}

//VStack == Column
//HStack == Row
//ZStack == Stack
