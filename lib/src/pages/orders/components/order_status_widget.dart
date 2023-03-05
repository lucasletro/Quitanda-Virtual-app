import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

//vai ser usado na classe orders_tile
//vai ser responsavel por mostrar o status,
//as etapas do andamento do pedido como : pedido confirmado, pagamento etc...

class OrderStatusWidget extends StatelessWidget {

  final String status;
  final bool isOverdue; //indica se o pagamento esta vencido


  //vamos estruturar nossos possiveis status dentro de um map
  //map de string e int
  final Map<String, int> allStatus = <String, int>{
    "pending_payment": 0,
    "refunded": 1, //estornado
    "paid": 2,
    "prepering_purchase": 3,
    "shiping": 4,
    "delivered": 5,
  };

  //a ideia agora é receber da variavel status algum dos valores do allStatus
  //entao uma forma de recuperarmos o valor inteiro com base no valor que recebemos no status
  //é criando um getter.
  //currentStatus vai retornar o status atual na chave status
  //! (pra especificar q nao vai ser nulo sempre vai ser uma das chaves q criamos no allStatus)
  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //alinhando o divisor

      children: [
        
        const _statusDot(
          isActive: true,
          title: "Pedido confirmado",
        ),

        const _CustomDivider(),

        //condicional pra pedido estornado
        //se o currentStatus = 1 eu sei q o pedido foi estorndado
        if(currentStatus == 1) ...[
          const _statusDot(
            isActive: true,
            title: "Pix estornado",
            backGroundColor: Colors.orange,
          ),

          //condidional se tivermos um pedido vencido de pagamento
        ] else if(isOverdue) ...[
          const _statusDot(
            isActive: true,
            title: "Pagamento pix vencido",
            backGroundColor: Colors.red,
          ),

          //caso nenhuma das condiçoes seja verdadeira
        ] else ...[
          
          _statusDot(
            isActive: currentStatus >= 2,
            title: "Pagamento",
          ),

          const _CustomDivider(),

          _statusDot(
            isActive: currentStatus >= 3,
            title: "Preparando",
          ),

          const _CustomDivider(),

          _statusDot(
            isActive: currentStatus >= 4,
            title: "Envio",
          ),

          const _CustomDivider(),

          _statusDot(
            isActive: currentStatus == 5,
            title: "Entregue",
          ),
          
        ],

      ],
    );
  }
}






//DIVISOR QUE VAI FICAR ENTRE OS BOTOES DE STATUS
class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), //alinhando o divisor
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}




//WIDGET BOTAO(dot) E TEXTO DE STATUS
class _statusDot extends StatelessWidget {

  //variavel pra dizer se o botao esta ativo
  final bool isActive;
  final String title;

  final Color? backGroundColor;

  const _statusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot (botao redondo de verificaçao) =================
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color: isActive ? backGroundColor?? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive ? const Icon(Icons.check, size: 13, color: Colors.white,) : const SizedBox.shrink(),
        ),
        //====================================================

        //espaçamento na horizontal entre o dot(botao) e o texto=========
        const SizedBox(width: 5,),
        //==============================

        //Texto =======================
        Expanded(
            child: Text(
                title,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
        ),
        //==============================

      ],
    );
  }
}

