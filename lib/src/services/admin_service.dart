part of 'services.dart';

class AdminService {
  final productCollection =
      FirebaseFirestore.instance.collection(productCollectionName);

  Future<Either<String, String>> addNewProduct(ProductModel data,
      {List<File>? files}) async {
    try {
      productCollection.doc(data.id).set(data.toMap());
      if (files!.isNotEmpty) {
        final downloadUrls = await Commons().uploadFiles(data.id!, files);
        if (downloadUrls.isNotEmpty) {
          updateProduct(
            data.id!,
            data.copyWith(
              pictures: downloadUrls,
            ),
          );
        }
      }
      return right('Berhasil Menambahkan Produk');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> updateProduct(
      String id, ProductModel data) async {
    try {
      productCollection.doc(data.id).update(data.toMap());
      return right('Berhasil Menambahkan Produk');
    } catch (e) {
      return left(e.toString());
    }
  }
}
