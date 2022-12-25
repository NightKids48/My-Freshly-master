// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class NavigationDrawer extends StatelessWidget {
  final UserModel data;
  const NavigationDrawer({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context, data),
            _buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, UserModel data) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          8.heightBox,
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("${data.photoProfile}"),
          ),
          8.heightBox,
          "${data.username}".text.white.size(28).bold.make(),
          "${data.email}".text.white.size(18).make(),
          8.heightBox,
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // ignore: prefer_const_constructors
          leading: Icon(
            Icons.home_outlined,
            color: kPrimaryColor,
          ),
          title: "Home".text.make(),
        ),
        ListTile(
          // ignore: prefer_const_constructors
          leading: Icon(
            Icons.update,
            color: kPrimaryColor,
          ),
          title: "Updates".text.make(),
        ).onInkTap(() {
          context.go(routeName.adminPath);
        }),
        Divider(),
        ListTile(
          // ignore: prefer_const_constructors
          leading: Icon(
            Icons.logout_outlined,
            color: kPrimaryColor,
          ),
          title: "Logout".text.make(),
        ),
      ],
    );
  }
}
