import 'package:quitanda_virtual/src/models/item_model.dart';

//vai ser usada na app_data pra criar instancias de cartItem.

class CartItemModel {
  ItemModel item;
  int quantity;

  //construtor
  CartItemModel({
    required this.item,
    required this.quantity,
  });

  //vai retornar um simples calculo q é o preço total dos produtos
  double totalPrice(){
    return item.price * quantity;
  }
}
