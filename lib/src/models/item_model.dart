//CLASSE DE MODELO DOS ITENS DE APRESENTAÇAO NA TELA HOME TAB

//esta classe vai ser utilizada na classe app_data e item_tile.

class ItemModel {
  //atributos ---- #1
  String itemName;
  String img;
  String unit;
  double price;
  String description;

  //construtor --- #2
  ItemModel({
    required this.itemName,
    required this.img,
    required this.unit,
    required this.price,
    required this.description,
  });



}
