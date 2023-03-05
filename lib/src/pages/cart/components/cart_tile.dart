import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

//essa classe vai ser usada na classe cart_Tab no listView.builder
//essa classse vai criar os cards dos produtos do carrinho
//q possuem a foto, nome, preço e quantidade dos produtos

class CartTile extends StatefulWidget {

  final CartItemModel cartItem;

  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(

        //IMAGEM
        leading: Image.asset(widget.cartItem.item.img, height: 60, width: 60,),

        //TITULO
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        //TOTAL
        subtitle: Text(
          utilServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
          color: CustomColors.customSwatchColor,
          fontWeight: FontWeight.bold
        ),),

        //QUANTIDADE
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity){
            setState(() {
              //vai receber a nova quantidade atualizada.
              widget.cartItem.quantity = quantity;
              if(quantity == 0){
                //remover item do carrinho se quantidade = 0.
                widget.remove(widget.cartItem);
              }

            });
          },
          isRemovable: true,
        ),

      ),
    );
  }
}
