import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';

import '../models/cart_item_model.dart';
import '../models/order_model.dart';

//AQUI VAMOS ADICIONAR TODOS OS DADOS Q VAMOS UTILIZAR NO APP
//tivemos q descomentar o trecho assets no pubspec e colocar o caminho
//das imagens.
//nessa classe vamos criar instancias da classe itemModel.
//essa classe vai ser utilizada na home_tab, no gridView.

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  img: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  img: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  img: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  img: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  img: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  img: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos #2
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

//Lista das categorias //#3
List<String> categories = [
  "Frutas",
  "Legumes",
  "Verduras",
  "Temperos",
  "Cereais",
];


//lista de produtos do carrinho (cart_tab)
//para q eu consiga estruturar os produtos no carrinho
//precisamos de alguns dados

//lista do tipo cartItemModel
List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 1,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 3,
  ),
];


UserModel user = UserModel(
    phone: "31 9 9488-9999",
    cpf: "999.999.999-99",
    email: "lucas@gmail.com",
    name: "Lucas Dias",
    password: "senha",
);



//lista de orderModel (AQ ESTAO OS PEDIDOS)
//dentro da lista vamos passar instancias de OrderModel
List<OrderModel> orders = [
  //PEDIDO 01
  OrderModel(
    copyAndPaste: "qwe333kfk6",
    createdDateTime: DateTime.parse("2024-02-03 18:00:10.458"),
    overdueDateTime: DateTime.parse("2024-02-03 19:00:10.458"),
    id: "alsmmdm4mrmm5n5mo",
    status: "pending_payment",
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
  ),

  //PEDIDO 02
  OrderModel(
    copyAndPaste: "dk4ngnkg44",
    createdDateTime: DateTime.parse("2024-02-03 18:00:10.458"),
    overdueDateTime: DateTime.parse("2024-02-03 19:00:10.458"),
    id: "a65k6jgjrk7kle456",
    status: "delivered",
    total: 11.0,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),

];
