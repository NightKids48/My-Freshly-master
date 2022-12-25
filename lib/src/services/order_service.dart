part of 'services.dart';

// class OrderService {
//   final ordersCollection =
//       FirebaseFirestore.instance.collection(orderCollectionName);

//   //data banyak
//   Future<Either<String, List<OrderModel>>> fetchListOrder() async {
//     try {
//       String uid = await Commons().getUID();
//       final querySnapshot =
//           await ordersCollection.where('uid', isEqualTo: uid).get();
//       final data =
//           querySnapshot.docs.map((e) => OrderModel.fromMap(e.data())).toList();
//       return right(data);
//     } catch (e) {
//       return left(e.toString());
//     }
//   }

//   //data satu
//   Future<Either<String, OrderModel>> fetchDetailOrder(docId) async {
//     try {
//       final documentSnapshot = await ordersCollection.doc(docId).get();
//       final data = OrderModel.fromMap(documentSnapshot.data()!);
//       return right(data);
//     } catch (e) {
//       return left(
//         e.toString(),
//       );
//     }
//   }

//   //nambah data
//   Future<Either<String, String>> orderProcess(OrderModel model) async {
//     try {
//       await ordersCollection.doc(model.id).set(model.toMap());
//       return right("Berhasil Melakukan Check Out");
//     } catch (e) {
//       return left(e.toString());
//     }
//   }
// }

class OrderService {
  final ordersCollection =
      FirebaseFirestore.instance.collection(ordersCollectionName);

  //fetchorder
  Future<Either<String, List<OrderModel>>> fetchListOrder() async {
    try {
      String uid = await Commons().getUID();
      final querySnapshot =
          await ordersCollection.where('uid', isEqualTo: uid).get();

      final data =
          querySnapshot.docs.map((e) => OrderModel.fromMap(e.data())).toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<OrderModel>>> fetchListOrderAll() async {
    try {
      // String uid = await Commons().getUID();
      final querySnapshot =
          await ordersCollection.orderBy("dateTime", descending: true).get();

      final data =
          querySnapshot.docs.map((e) => OrderModel.fromMap(e.data())).toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  //fetchdetail
  Future<Either<String, OrderModel>> fetchDetailOrder(docId) async {
    try {
      final documentSnapshot = await ordersCollection.doc(docId).get();
      final data = OrderModel.fromMap(documentSnapshot.data()!);
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  //add order
  Future<Either<String, String>> orderProcess(OrderModel model) async {
    try {
      await ordersCollection.doc(model.id).set(model.toMap());

      return right('Berhasil Melakukan Checkout');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> onBayar(OrderModel model) async {
    try {
      await ordersCollection.doc(model.id).update(
        {
          'paymentStatus': 1,
        },
      );
      return right('Pesanan Dibatalkan');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> onKonfrimasi(OrderModel model) async {
    try {
      await ordersCollection.doc(model.id).update(
        {
          'paymentStatus': 2,
        },
      );
      return right('Pesanan Dibatalkan');
    } catch (e) {
      return left(e.toString());
    }
  }
}
