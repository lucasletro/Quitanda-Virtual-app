import 'package:quitanda_virtual/src/models/cart_item_model.dart';

//VAMOS CRIAR AS INSTANCIAS DESTA CLASSE NO APP_DATA,
//E ENTAO PASSAR PARA A CLASSE ORDERS_TAB
//NESTA CLASSE VAMOS COLOCAR TODOS OS ATRIBUTOS QUE VAMOS ESTAR UTILIZANDO
//PRA APRESENTAR OS DADOS DO NOSSO PEDIDO.

class OrderModel {
  //VARIAVEIS
  String id; //id do pedido

  //hora e data a qual foi criado o pedido
  DateTime createdDateTime;

  //quando o qr code do pix ja venceu e nao conseguimos mais fazer pagamentos
  DateTime overdueDateTime;

  //listagem de todos os produtos
  List<CartItemModel> items;

  String status; //status do pedido
  String copyAndPaste; //copia e cola do pix
  double total; //valor total

  //CONSTRUTOR
  OrderModel({
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.id,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.total
  });

}