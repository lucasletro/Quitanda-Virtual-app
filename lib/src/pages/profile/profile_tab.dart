import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;

//Tela de perfil

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //APP BAR========================= //#1
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      //================================

      //CAMPOS DE TEXTO ======================= //#2
      //podemos usar o list view ao inves da coluna
      body: ListView(
        physics: const BouncingScrollPhysics(), //rolagem da tela
        padding:  const EdgeInsets.fromLTRB(16, 32, 16, 16), //espaçamento
        children:  [

          //EMAIL
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: "Email",
          ),

          //NOME
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: "Nome",
          ),
          //CELULAR
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: "Celular",
          ),
          //CPF
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: "CPF",
            isSecret: true,
          ),
          //========================================

          //BOTAO PRA ATUALIZAR SENHA =============== //#3
          SizedBox(
            //sizedBox pra aumentar a altura do botao.
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: (){
                updatePassword();
              },
              child: const Text("Atualizar Senha"),
            ),
          ),
          //====================================================

        ],
      ),

    );
  }

  //DIALOG PRA ATUALIZAR SENHA ========= //#4
  Future<bool?>updatePassword(){
    return showDialog(
        context: context,
        builder: (context){
          return Dialog( //#1
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Stack( //#5
              children: [
                Padding( //#4
                  padding: const EdgeInsets.all(16),
                  child: Column( //#2
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //indica q o crecimento no eixo vertical da coluna vai ser o minimo possivel
                    mainAxisSize: MainAxisSize.min,
                    children: [ //#3

                      //TITULO
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Atualização de senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //SENHA ATUAL
                      const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock,
                        label: "Senha atual",
                      ),

                      //NOVA SENHA
                      const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: "Nova senha",
                      ),

                      //CONFIRMAÇAO NOVA SENNHA
                      const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: "Confirmar nova senha",
                      ),

                      //BOTAO DE CONFIRMAÇAO
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: (){},
                          child: const Text(
                            "Atualizar",
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                //botao de fechar o dialog //#6
                Positioned( //#6
                  top: 5,
                  right: 5,
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
        },
    );
  }
  //=====================================
}
