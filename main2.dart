//------------Constants-------------------
const main_text = """Aqua Sodium Laureth Sulfate Sodium Chloride-Cocamidopropyi Be
taine-Hydrolyzed Soy Protein -Niacinamide-Magnesium Chloride-Camitine-Taurine-TartaricAod-an
 neno-Simnmondsia Chinensis Seed 01 Disodium Cocoamphodiacetate Sodium Benzoate -Cic
Ad-Cocamide MEA-PEG-7 Gyceryl Cocoate-Parfum-Polyquatemium-10-PEG-40 Hydirogenated Casto
O1-Propylene Glycol-d 19140-C 16035-C 15985
bProducător: Wsapuond & Xewwenb lpogaxwen KOpon TM6X& Ko. KISchwarzkopt &
Ucion Europe GmbH & Co.KG, XenKenbuTpacce/Henkelstrasse 67, 40589 AoccenbAOpO/DUesseo
THGermania, ImnopTep 8 Vkpaini: TOB «XeHKenb Ykpaina», Byn. CaxcarawcbkOrO 120 01051, Ten; 0800210035 (a3eiHKW B MeMax ykpaiHn 6e3KouTOBHI). Importator/Distnauio
plica Moldoya: lM eReputaian St, str. Otovasca 17, mun. Chişindu tel/tax: 029
 Nanuausng date =ata pMIOGFOBSEHHN AMB Ha ynaoBu HoMiHanbHMN O0 EME
 Ebpisydate=ata KiHeeor0 CIOHMIEaHHR, AMB. Ha yaKoBL
400 MnNMLe
 9913202590
 M08/20 E08/23
Schwarzkopf & Henkel
 12 M
 "OO0100"8602462
 s9LZ0""";

const allCapitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ./,&:;";
var allCapitalsTuple = allCapitals.split('');

//------------Functions-------------------

int countElInList(List arr, int num){
  var sumEl = 0;
  
  for (var el in arr) {
    if (el == num)
      sumEl++;
  }
  //print(arr);
  return sumEl;
}

bool isUpperCase(String string) {
    var stringTuple = string.split('');
    var acceptCount = 0;
  
    for (var letter in stringTuple) {
      if (allCapitalsTuple.contains(letter)) {
        acceptCount++;
      }
    }
  
    if (acceptCount == string.length)
      return true;
    
    return false;
}

bool isCapital(String string) {
    var stringTuple = string.split('');
  
    if (allCapitalsTuple.contains(stringTuple[0])) {
      return true;
    }
    
    return false;
}

List formatTuple(List tuple) {
  var result = [];
  
  var ingredient = "";
  for (var el in tuple) {
 
    if (el.endsWith(",") || el.endsWith(".")) {
      ingredient += el;
      result.add(ingredient.replaceAll(RegExp(r'\,|\.'), '').replaceAll(RegExp(r'\n'), ' '));
      ingredient = "";
      continue;
    }
    
    var is_contains_coma = el.contains(",");
    
    if (is_contains_coma || el.contains(".")) {
      var el_tuple = is_contains_coma? el.split(",") : el.split(".");
      ingredient += el_tuple[0];
      result.add(ingredient.replaceAll(RegExp(r'\,|\.'), '').replaceAll(RegExp(r'\n'), ' '));
      ingredient = el_tuple[1];
      continue;
    }
    
    ingredient += el + " ";
  }
  
  result.add(ingredient.replaceAll(RegExp(r'\,|\.'), '').replaceAll(RegExp(r'\n'), ' '));
  
  return result;
}

List maxTuple(List tuples) {
  var maxLength = 0;
  var maxTuple = [];
  
  for (List el in tuples) {
    if (el.length > maxLength) {
      maxLength = el.length;
      maxTuple = el;
    }
  }
  return maxTuple;
}

//------------Algorithm-------------------

void main() {
  
  var text_tuple = main_text.split(" ");
  
  var text_tuple_marks = [];
  
  for(var el in text_tuple) {
    if (el.endsWith(','))
      text_tuple_marks.add(1);
    else if (el.endsWith(':'))
      text_tuple_marks.add(2);
    else if (el.endsWith('.'))
      text_tuple_marks.add(3);
    else
      text_tuple_marks.add(0);
  }
  
  for (var i = 0; i < text_tuple_marks.length; i++) {
    if(!text_tuple[i].endsWith(':') && (isCapital(text_tuple[i]) || isUpperCase(text_tuple[i])))
      text_tuple_marks[i] = 1;
  }
  
  var all_results = [];
  var all_results_one = [];

  for (var zeroPattern = 1; zeroPattern < 100; zeroPattern++) {
    var variety_tuples = [];
    var final_tuple = [];
    var count_zero = 0;
  
    var variety_tuples_num = [];
    var final_tuple_num = [];
    
    for (var i = 0; i < text_tuple_marks.length; i++) {
      var el = text_tuple_marks[i];
    
      if (el == 0)
        count_zero++;
      if (el == 1)
        count_zero = 0;
     
      final_tuple.add(text_tuple[i]);
      final_tuple_num.add(el);
    
      if (final_tuple.length == count_zero && (el == 3 || count_zero == zeroPattern || el == 2)) {
        final_tuple = [];
        final_tuple_num = [];
        count_zero = 0;
        continue;
      }
    
      if (final_tuple.length > count_zero && (el == 3 || count_zero == zeroPattern || el == 2)) {
        variety_tuples.add(final_tuple);
        variety_tuples_num.add(final_tuple_num);
        final_tuple = [];
        final_tuple_num = [];
        count_zero = 0;
        continue;
      }
    }
  
    variety_tuples.add(final_tuple);
    variety_tuples_num.add(final_tuple_num);
  
    var result = maxTuple(variety_tuples);
  
    all_results.add(result);
    
    List result_num_tuple = variety_tuples_num[variety_tuples.indexOf(result)];

    all_results_one.add(countElInList(result_num_tuple, 1) - countElInList(result_num_tuple, 0));
  }
  
  var biggest_one_num = all_results_one.reduce((curr, next) => curr > next? curr: next);

  var result_id = all_results_one.indexOf(biggest_one_num);
  
  var not_formatted_tuple = all_results[result_id];
  
  var result = formatTuple(not_formatted_tuple);
  print(result);
}