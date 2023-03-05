import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//classe do campo de texto customizado

class CustomTextField extends StatefulWidget {

  //VARIAVEIS================================================================
  final IconData icon; //icone
  final String label; //label text

  //variavel pra indicar que temos um campo cujo
  // seu valor vai ser secreto senhas por exemplo
  //vai ser responsavel apenas pra apresentar o botao de visibilidade
  final bool isSecret;

  //variavel dos formatters do cpf e celular da sign up screen
  final List<TextInputFormatter>? inputFormatters;

  //variavel do valor inicial q vamos usar na profile_tab
  final String? initialValue;
  //variavel pro campo ser apenas de leitura pra usar na profile_tab
  final bool readOnly;

  //=========================================================================


  //em seguida passar essas variaveis no parametro do construtor
  //isSecret = false pra nao ter que chamar ele toda hora
  // nos campos de texto vou passar ele somente quando precisar

  //CONSTRUTOR
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool isObscure = false; //variavel para alternar entre apresentar o valor e ocultar o valor das senhas

  //initState é um widget que se inicia
  //antes mesmo do nosso widget(campo de texto)ser apresentado na tela.
  @override
  void initState() {
    super.initState();
    //se isSecret = true isObscure tbm vai ser true
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      //espaçamento abaixo do campo de texto pra que eles nao fiquem colados
      padding: const EdgeInsets.only(bottom: 15),

      child: TextFormField(


        //-----------------usar na profile_tab-------------------
        //o valor q vai ser apresentado inicialmente no campo de texto
        //assim q ele for criado vamos usar isto no perfil do usuario(profile_tab)
        initialValue: widget.initialValue,
        //faz com q o campo seja apenas de leitura,
        //desta forma nao consigo alterar os valores do campo
        readOnly: widget.readOnly,
        //----------------------------------------------------------


        inputFormatters: widget.inputFormatters, //formatters do cpf e celular da sign up screen
        obscureText: isObscure, //obscureText para ocultar e apresentar os valores de senhas por exemplo
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon), //icone do inicio do campo de texto

          //isObscure = true vai apresentar o botao IconButton e se falso retorna null
          suffixIcon: widget.isSecret ? IconButton( //icone que é um botao no final do campo de texto
            onPressed: (){
              setState(() {
                //ao clicar no botao vai acontacer o valor inverso
                //do isObscure. se ele for true vira false e se falso vira true
                isObscure = !isObscure;
              });
            },
            //se isObscure = true apresnta um icone senao apresenta outro.
            icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          ) : null,

          labelText: widget.label,
          //campo fica mais denso mais baixo e ocupa menos espaço na tela
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
