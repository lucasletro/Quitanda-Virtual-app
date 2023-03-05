
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

//classe para colocar o R$ no price dos produtos
//e mudar o formato do preço tirando o ponto e colocar virgula.
// importamos um pacote na pubspec (intl)
//essa classe vai ser usada na classe item_tile.

class UtilServices {
  String priceToCurrency(double price) {
    //numberFormat vai formatar pra real
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    //vai converter o preço para uma moeda
    return numberFormat.format(price);
  }

  //METODO PARA RETORNAR UMA DATA FORMATADA q
  // VAMOS USAR NA CLASSE ORDER_TILE

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    //vai apresentar uma data, hora e minuto com formato especifico
    DateFormat dateFormat = DateFormat.yMd("pt_BR").add_Hm();
    return dateFormat.format(dateTime);
  }


}
