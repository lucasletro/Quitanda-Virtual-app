import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

//classe para fazer o dialog que contem o codigo qr code do pix

//vamos chamar esta classe no BOTAO DE VER QR CODE PIX na classe order_tile
//e tambem no botao de concluir pedido na classe cart_tab (carrinho)

class PaymentDialog extends StatelessWidget {

  final OrderModel order;

  PaymentDialog({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {

    return Dialog(  //#1
      shape: RoundedRectangleBorder(   // #9
        borderRadius: BorderRadius.circular(20),
      ),

      //para q possamos alocar um widget em qualquer lugar q a gente queira no caso botao de fechar
      child: Stack( // #11
        alignment: Alignment.center, // alinhando o conteudo depois q adicionamos o positioned #13
        children: [

          //CONTEUDO
          Padding(  //#8
            padding: const EdgeInsets.all(8.0),

            child: Column( //#2
              mainAxisSize: MainAxisSize.min, // #3 para q a coluna cresça o minimo possivel
              children: [

                //TITULO
                const Padding(  // #14 ---------ultimo
                  //adicionando um espaçamento pra distanciar da borda superior e do qr code
                  padding: EdgeInsets.symmetric(vertical: 10),

                  child: Text( //#4
                      "Pagamento com Pix",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),

                //QR CODE  //#5
                //tivemos q importar um pluggin chamado (qr_flutter).
                QrImage( //--- #5
                  data: "fj43n4o3n3tj43", //dependendo da string q colocar aq o qr code se modifica
                  version: QrVersions.auto,
                  size: 200.0,
                ),


                //VENCIMENTO //#6
                Text(
                  "Vencimento: ${utilServices.formatDateTime(order.overdueDateTime)}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                //TOTAL  //#7
                Text(
                  "Total: ${utilServices.priceToCurrency(order.total)}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                //BOTAO COPIA E COLA // #10
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green
                    ),
                  ),
                  onPressed: (){},
                  icon: const Icon(Icons.copy, size: 15,),
                  label: const Text(
                    "Copiar codigo Pix",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),

              ],
            ),
          ),

          //parte do stack ============== // #12
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          //===========================

        ],
      ),
    );
  }
}
