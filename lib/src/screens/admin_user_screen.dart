part of 'screens.dart';

class AdminUserScreen extends StatelessWidget {
  const AdminUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            "Total User".text.color(Colors.black54).make(),
            BlocBuilder<ListUserBloc, ListUserState>(
              builder: (context, stateAllUser) {
                if (stateAllUser is ListUserIsSuccess) {
                  return "${stateAllUser.data.length}  User"
                      .text
                      .color(Colors.black54)
                      .make();
                }
                return Container();
              },
            )
          ],
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black54).onTap(() {
          context.go(routeName.home);
        }),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 3),
            child: Container(
              // margin: EdgeInsets.only(bottom: 8),
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ).centered().onTap(() {
              context.go(routeName.adminPath);
            }),
            height: 50,
            decoration: BoxDecoration(
              color: colorName.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: Container(
        child: BlocBuilder<ListUserBloc, ListUserState>(
          builder: (context, listUserState) {
            if (listUserState is ListUserIsLoading) {
              return CircularProgressIndicator().centered();
            }
            if (listUserState is ListUserIsSuccess) {
              final data = listUserState.data;
              return ListView.separated(
                separatorBuilder: (context, index) => 16.heightBox,
                itemCount: data.length,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(14),
                    minLeadingWidth: 20,
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: Colors.black54,
                        ),
                        4.heightBox,
                        Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    // style: ListTileTheme(),
                    tileColor: Colors.white,
                    focusColor: Colors.blue,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        "${data[index].username}".text.bold.size(22).make(),
                        "IDR ${data[index].email}"
                            .text
                            .color(Colors.black54)
                            .size(18)
                            .make(),
                      ],
                    ),
                    subtitle: "${data[index].email}".text.make(),
                    leading: Container(
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: NetworkImage((data[index].photoProfile! == "")
                              ? "https://www.sdgdental.com.au/wp-content/uploads/2018/05/user-placeholder-1.jpg"
                              : '${data[index].photoProfile!}'),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container(
              child: "Tidak Ada User Terdaftar".text.make(),
            );
          },
        ),
      ).centered(),
    );
  }
}
