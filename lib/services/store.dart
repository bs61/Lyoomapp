
import 'package:flutter_app/widgets/global.dart';
import 'package:flutter_app/pages/panier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  storeOrders(data, List<CartItem> products) {
    var documentRef = _firestore.collection(kOrders).doc();
    documentRef.set(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).doc().set({
        kProductName: product.productName,
        kProductPrice: product.productPrice,
        kProductQuantity: product.productQuantity,
        kmezze:product.mezze,
        kpain:product.pain[0],
        kviande:product.viande[0],
        kkeft:product.keft[0],


      });
    }
  }



  storeOrders2(data, List products) {
    var documentRef = _firestore.collection(khistory).doc();
    documentRef.set(data);
    for (var product in products) {
      documentRef.collection(khistorydetails).doc().set({
        kProductName: product.getpname(),
        kProductQuantity: product.getpQuantity(),
        kmezze:product.getmezze(),
        kpain:product.getpain(),
        kviande:product.getviande(),
        kkeft:product.getkeft(),
      });
    }
  }

  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(kOrders).snapshots();
  }

  Stream<QuerySnapshot> loadOrders2() {
    return _firestore.collection(khistory).snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firestore
        .collection(kOrders)
        .doc(documentId)
        .collection(kOrderDetails)
        .snapshots();
  }
  Stream<QuerySnapshot> loadOrderDetails2(documentId) {
    return _firestore
        .collection(khistory)
        .doc(documentId)
        .collection(khistorydetails)
        .snapshots();
  }
  // deleteProduct(documentId) {
  //   // ignore: deprecated_member_use
  //   _firestore.collection(kOrders).doc(documentId).collection(kOrderDetails).getDocuments().then((snapshot) {
  //     // ignore: deprecated_member_use
  //     for (DocumentSnapshot doc in snapshot.documents) {
  //       // ignore: unnecessary_statements
  //       doc.reference.delete;
  //     }
  //   });
  // }
}