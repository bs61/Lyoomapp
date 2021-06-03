
import 'package:flutter_app/models/foodmodel.dart';

final shanTounsi=Food(pCategory: 'CoolTounsi',pPrice: 12.00,pName: 'Shan Tounsi',pDescription: 'salade tunisien avec du thon,une oeuf,du poivron,du citron...',pLocation: 'shantounsi',pRating: '5.0');
final shanKaftagi=Food(pCategory: 'CoolTounsi',pPrice: 12.00,pName: 'Shan Kaftagi',pDescription: 'Kaftagi avec merguez ou poulet mariné',pLocation: 'shankaftagi',pRating: '4.0');
final mokli=Food(pCategory: 'CoolTounsi',pPrice: 13.00,pName: 'Mokli',pDescription: "des legumes et une oeuf tous frit dans l'huile",pLocation: 'mokli',pRating: '5.0');
final ojjamerguez=Food(pCategory: 'CoolTounsi',pPrice: 13.00,pName: 'Ojja Merguez',pDescription: '',pLocation: 'ojja',pRating: '4.0');
final keskroutekftegi=Food(pCategory: 'CoolTounsi',pPrice: 13.00,pName: 'Keskrout Kefteji',pDescription: '',pLocation: 'kaskroutekaftagi',pRating: '5.0');
final brick=Food(pCategory: 'CoolTounsi',pPrice: 5.50,pName: 'Brick',pDescription: '',pLocation: 'brick',pRating: '4.0');
final kemiatunisienne=Food(pCategory: 'CoolTounsi',pPrice: 5.50,pName: 'Kemia Tunisienne',pDescription: 'Sardine,Thon,Variantes,Harissa maison,Olives',pLocation: 'kemiatunisienne',pRating: '5.0');
final Brochette6mezze=Food(pCategory: 'Brochette et Mezzés',pPrice: 20.00,pName: 'Brochettes &\n 6 Mezzés',pDescription: "Omek houria, Caviar d'aubergine, Taboulé, Houmos, Féta, Salade tunisienne, Salade Mechouia, crème de toum, Tzatziki, Moutabal, Chakchouka, Riz pilaf, Pomme de terre sauté, Boulgour Pilavi, Souaba3 Fatma, Keftéji, Mderbel, Samousa",pLocation: 'brochette6mezze',pRating: '5.0');
final Brochette4mezze=Food(pCategory: 'Brochette et Mezzési',pPrice: 16.00,pName: 'Brochettes &\n 4 Mezzés',pDescription:  "Omek houria, Caviar d'aubergine, Taboulé, Houmos, Féta, Salade tunisienne, Salade Mechouia, crème de toum, Tzatziki, Moutabal, Chakchouka, Riz pilaf, Pomme de terre sauté, Boulgour Pilavi, Souaba3 Fatma, Keftéji, Mderbel, Samousa",pLocation: 'brochette4mezze',pRating: '4.0');
final Brochette2mezze=Food(pCategory: 'Brochette et Mezzés',pPrice: 13.00,pName: 'Brochettes &\n 2 Mezzés',pDescription: "Omek houria, Caviar d'aubergine, Taboulé, Houmos, Féta, Salade tunisienne, Salade Mechouia, crème de toum, Tzatziki, Moutabal, Chakchouka, Riz pilaf, Pomme de terre sauté, Boulgour Pilavi, Souaba3 Fatma, Keftéji, Mderbel, Samousa",pLocation: 'brochette2mezze',pRating: '5.0');
final mezzealacarte=Food(pCategory: 'Brochette et Mezzés',pPrice: 4.50,pName: 'Mezzés à la carte',pDescription:  "Omek houria, Caviar d'aubergine, Taboulé, Houmos, Féta, Salade tunisienne, Salade Mechouia, crème de toum, Tzatziki, Moutabal, Chakchouka, Riz pilaf, Pomme de terre sauté, Boulgour Pilavi, Souaba3 Fatma, Keftéji, Mderbel, Samousa",pLocation: 'mezzealacarte',pRating: '4.0');
final brochette=Food(pCategory: 'Cassedalle',pPrice: 9.00,pName: 'Brochette',pDescription: 'chawarma, Poulet méditerranée, Agneau Ras El Hanout, Kefta cumin, Falafel, Merguez du boucher, Boulettes à la tunisienne avec du mlawi ou du batboute comme pain',pLocation: 'brochette',pRating: '4.0');
final kalbellouze=Food(pCategory: 'Dessert',pPrice: 3.50,pName: 'Kalb Ellouze',pDescription: '',pLocation: 'kalbellouze',pRating: '5.0');
final Baklawa=Food(pCategory: 'Dessert',pPrice: 2.50,pName: 'Baklawa',pDescription: '',pLocation: 'baklawa',pRating: '5.0');
final MilleFeuille=Food(pCategory: 'Dessert',pPrice: 4.00,pName: 'Milles Feuilles Tunisien',pDescription: '',pLocation: 'millefeuilles',pRating: '4.0');
final cornegazelle=Food(pCategory: 'Dessert',pPrice: 2.50,pName: 'Corne de gazelle',pDescription: '',pLocation: 'cornedegazelle',pRating: '5.0');
final boissonmaison=Food(pCategory: 'Boisson',pPrice: 4.00,pName: 'Boisson Maison',pDescription: '',pLocation: 'boissonmaison',pRating: '4.0');
final kahwa=Food(pCategory: 'Boisson',pPrice: 2.50,pName: 'Kahwa',pDescription: '',pLocation: 'kahwa',pRating: '4.0');
final the=Food(pCategory: 'Boisson',pPrice: 2.50,pName: 'Thé Tunisien',pDescription: '',pRating: '5.0',pLocation: 'the');
final List<Food> foods=[shanTounsi,shanKaftagi,mokli,ojjamerguez,keskroutekftegi,brick,kemiatunisienne,Brochette6mezze,Brochette4mezze,Brochette2mezze,mezzealacarte,brochette,kalbellouze,Baklawa,MilleFeuille,cornegazelle,boissonmaison,kahwa,the];
Food getfood(String name){

  for(var i in foods){
    if(i.pName==name)
      return i;
  }
}