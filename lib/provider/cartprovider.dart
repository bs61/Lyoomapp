import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/panier.dart';

class CartItems extends ChangeNotifier {
  List<CartItem> products = [];
  double _totalPrice = 0.0;
  List<String> _mail = [];





  addProduct(CartItem product,) {
    products.add(product);
    _totalPrice += product.productPrice;

    notifyListeners();
  }

  deleteProduct(CartItem product,) {
    products.remove(product);
    _totalPrice -= product.productPrice;
    notifyListeners();
  }

  double get totalPrice {
    return _totalPrice;
  }
  List<String> ToString(){
    _mail=[];
    for(int i=0;i<products.length;i++){
      String spec='';
      spec+="plat  ${i+1}:</h2>\n<h2>";
      spec+="nom:${products[i].productName}</h2>\n<h2>";
      spec+="prix:${products[i].productPrice}</h2>\n<h2>";
      spec+="Quantité:${products[i].productQuantity}</h2>\n<h2>";
      if(products[i].viande[0] != 'Choisir un viande'){
        spec+="viande: ${products[i].viande[0]}</h2>\n<h2>";
      }
      if(products[i].pain[0] != 'Choisir un pain'){
        spec+="Pain: ${products[i].pain[0]}</h2>\n<h2>";
      }
      if(products[i].keft[0] != 'Choisir un viande'){
        spec+="viande du keftegi: ${products[i].keft[0]}</h2>\n<h2>";
      }
      if(products[i].mezze[0]!=
          'Choisir un sauce'
          ){
        spec+="mézzés:${products[i].mezze.join(',')}</h2>\n<h2>";
      }
      _mail.add(spec);
    }

    return _mail;
  }
  mail(){
    ToString();
    return _mail ;
  }

}