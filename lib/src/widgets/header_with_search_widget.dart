// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
part of 'widgets.dart';

class HeaderWithSearchBox extends StatelessWidget {
  final UserModel data;
  final Size size;
  HeaderWithSearchBox({
    Key? key,
    required this.data,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          height: size.height * 0.30,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hi ${data.username}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                VxCircle(
                  radius: 80,
                  backgroundImage: (data.photoProfile != null)
                      ? DecorationImage(
                          image: NetworkImage("${data.photoProfile}"),
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(
                              "https://exoffender.org/wp-content/uploads/2016/09/empty-profile.png"),
                          fit: BoxFit.cover),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      // surffix isn't working properly  with SVG
                      // thats why we use row
                      // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
