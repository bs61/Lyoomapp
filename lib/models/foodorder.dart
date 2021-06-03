
class Foodorder {
  String pName;
  var keft;
  var pain;
  var viande;
  var mezze;
  int pQuantity;
  Foodorder(
      {this.pName,
        this.viande,
        this.pain,
        this.keft,
        this.mezze,
        this.pQuantity});
   getpname() {
     return this.pName;
   }
  getviande() {
    return this.viande;
  }
  getpain() {
    return this.pain;
  }
  getkeft() {
    return this.keft;
  }
  getmezze() {
    return this.mezze;
  }
  getpQuantity() {
    return this.pQuantity;
  }

}