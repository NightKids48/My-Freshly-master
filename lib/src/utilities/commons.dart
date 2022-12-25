part of 'utilities.dart';

class Commons {
  final prefs = SharedPreferences.getInstance();
  final picker = ImagePicker();

  void setUID(String uid) async {
    final storage = await prefs;
    await storage.setString(myUID, uid);
  }

  Future<String> getUID() async {
    final storage = await prefs;
    return storage.getString(myUID)!;
  }

  Future<bool> removeUID() async {
    final storage = await prefs;
    return storage.remove(myUID);
  }

  String setPriceToIDR(double price) {
    return NumberFormat.currency(locale: 'id_ID', decimalDigits: 0)
        .format(price)
        .toString();
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: message.text.make()));
  }

  void showSnackbarError(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.error(message: msg));
  }

  void showSnackbarInfo(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.info(message: msg));
  }

  Future<String> uploadFile(String id, File file, {String? fileName}) async {
    String imageName = fileName ??
        file.path.substring(
            file.path.lastIndexOf("/") + 1, file.path.lastIndexOf("."));
    Reference ref = FirebaseStorage.instance.ref('$id/$imageName');
    TaskSnapshot snapshot = await ref.putFile(file);
    return await snapshot.ref.getDownloadURL();
  }

  Future<List<String>> uploadFiles(String id, List<File> files) async {
    var imageUrls =
        await Future.wait(files.map((file) => uploadFile(id, file)));
    return imageUrls;
  }

  //fungsi untuk get Image from gallery
  Future<File> getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );
    return File(pickedFile!.path);
  }
}
