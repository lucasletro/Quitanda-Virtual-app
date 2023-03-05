
//classe q vai ter os dados do usuario
//q vamos usar no profile_tab (perfil)
//vamos instanciar esta classe(user_model) no app_data
//e vamos importar a classe app_data no profile _tab

class UserModel{
  String name;
  String email;
  String phone;
  String cpf;
  String password;

  UserModel({
    required this.phone,
    required this.cpf,
    required this.email,
    required this.name,
    required this.password,
  });

}