part of 'services.dart';

class ProductService {
  final productCollection =
      FirebaseFirestore.instance.collection(productCollectionName);
  final usersCollection =
      FirebaseFirestore.instance.collection(usersCollectionName);
  Future<Either<String, List<ProductModel>>> fetchListProduct() async {
    try {
      final querySnapshot = await productCollection.get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListProductSayur() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'sayur')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListProductSearch(
      String search) async {
    try {
      final querySnapshot =
          await productCollection.where('name', isGreaterThan: search).get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListProductIkan() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'ikan')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> FetchListProductBumbu() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'bumbu')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> FetchListProductFrozen() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'frozen')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListProductbuah() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'buah')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListProductDaging() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'daging')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> FetchListProductSusu() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'susu')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> FetchListProductMinuman() async {
    try {
      final querySnapshot = await productCollection
          .where('category', arrayContains: 'minuman')
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ProductModel>> fetchDetailProduct(String docId) async {
    try {
      final documentSnapshot = await productCollection.doc(docId).get();

      final data = ProductModel.fromMap(documentSnapshot.data()!);
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListProductCaraKedua() async {
    try {
      final querySnapshot = await productCollection.get();

      final dataSatu = <ProductModel>[];
      for (var element in querySnapshot.docs) {
        dataSatu.add(ProductModel.fromMap(element.data()));
      }
      return right(dataSatu);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> addToCart(ProductModel model) async {
    try {
      String uid = await Commons().getUID();
      final doc = await usersCollection
          .doc(uid)
          .collection(cartCollectionName)
          .add(model.toMap());

      await usersCollection
          .doc(uid)
          .collection(cartCollectionName)
          .doc(doc.id)
          .update(model.copyWith(id: doc.id).toMap());

      return right('Berhasil Memasukkan Ke Keranjang');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> addToChartcount(ProductModel model) async {
    try {
      String uid = await Commons().getUID();
      final doc = await usersCollection
          .doc(uid)
          .collection(cartCollectionName)
          .add(model.toMap());

      await usersCollection
          .doc(uid)
          .collection(cartCollectionName)
          .doc(doc.id)
          .update(model.copyWith(id: doc.id).toMap());

      return right("Berhasil menambahkan Product");
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListCart() async {
    try {
      String uid = await Commons().getUID();
      final querySnapshot =
          await usersCollection.doc(uid).collection(cartCollectionName).get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      data.sort(
        (a, b) => a.name!.compareTo(b.name!),
      );
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, int>> getCartItemCount() async {
    try {
      String uid = await Commons().getUID();
      final querySnapshot =
          await usersCollection.doc(uid).collection(cartCollectionName).get();
      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      final dataFiltered = <dynamic>{}; //variabel penampung untuk hasil filter
      data.retainWhere(
          (x) => dataFiltered.add(x.variant![0])); //mengahpus data yang kembar
      return right(dataFiltered.length);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> removeCartItemCount(ProductModel model) async {
    try {
      String uid = await Commons().getUID();

      await usersCollection
          .doc(uid)
          .collection(cartCollectionName)
          .doc(model.id)
          .delete();

      return right('Berhasil Dihapus');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> addToWishlist(ProductModel model) async {
    try {
      String uid = await Commons().getUID();
      usersCollection
          .doc(uid)
          .collection(wishListCollectionName)
          .doc(model.id)
          .set(
            model.toMap(),
          );

      return right('Berhasil Menyimpan');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> removeFromWishlist(String id) async {
    try {
      String uid = await Commons().getUID();
      usersCollection
          .doc(uid)
          .collection(wishListCollectionName)
          .doc(id)
          .delete();

      return right('Berhasil Menghapus dari wishlist');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> checkWishList(String id) async {
    try {
      String uid = await Commons().getUID();
      final querySnapshot = await usersCollection
          .doc(uid)
          .collection(wishListCollectionName)
          .doc(id)
          .get();

      return right(querySnapshot.exists);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchListWishlist() async {
    try {
      String uid = await Commons().getUID();
      final querySnapshot = await usersCollection
          .doc(uid)
          .collection(wishListCollectionName)
          .get();

      final data = querySnapshot.docs
          .map((e) => ProductModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }
}

//Query Snapshot => banyak document

//Document Snapshot => satu document