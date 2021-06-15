//------------Constants-------------------
const main_text = """aHOBne HonHH0 npeoopa3 OcnabneHHble n @HHO-TIapKne v eT noeBp nOMKMe Bon 6necTAWe. BOCCTAHOBNEHnE yCHIEHHAR AKTMBHbIM +TNAAKOCTh +B1O COPMA CHNEHH uEPAMHA ywacTKH MAbl rnyboko poHWKakOT B nOB 8onoC, 3anonHas MBaR KyTMKynpHblM Cno ne BGCTE akdnbTaeCA rnapkMMW W OnecTR pOHO OCTb, CTaHosHiCH napkuMMnl BOnocbl BHOBB 06peTa bl, npeiore 0BpexAeHWA, 00ecnewBaer p.TAHTEHO yTONjaeT oe yBnaxHeH n nTaHne. nPMMEHEHWE: HaHecnTe waMnyHA Te MaccWpylouyum pBWxeHRM CMO KonuecTBOM BOAbl. IIpn HeobxopVM0 XroMKOCTE Ha MOKpbie OOMTbHbIM K n08TOpWTe npoLeaypy. COCTAB/INGREDIENTS: BETAINE CYCERYL COcOATE,ODIOMC14-C1 SEC ALKYL Sug AURYL GLUCOsIDE LAUROYL PG-IRIMONIUM CHLORIDE CAPRYLICICAPRIC GLYCERIDES, TROECETH-6, TRIDECETH-12, PANHENOL, PARFUM (FRAGRANC GUAR HYDROXYPROPYLTRIMONIUM CHLORIDE, DIPROPYLENE GNOD PROPYLENE GLYCOL TRIDECETH-9, PEG-5 ETHYLHEXANCAE CERAMDE 3, PEG-120 METHYL GLUCOSE TRIOLEATE PROPAEDO DIUM EDTA, BENZYL ALCOHOL, METHYLCHLOROISOTHAZOUNOE VETHYLISOTHIAZOLINONE, CITRIC ACID (WATER) COCAMIDOPRP SULFATE, COCO-BETAINEP AQUA SODIUM LAURETH SILICONE QUATERNIJMAS paHMT npH TeMneparype He HMXe 5 'CW He Bbue 2 lo10n63083Tb no Ha3HayeHMIO nO MCTeyeHwA cpora ro aroroBWTEb: Cn «6ENVTA» 000 DEnapycb, 220089, r. MMHCK, yn. AekaópnCTOB, 29a Ten, +375(17) 222-91-17, www.belila.by PA3PASOTKA HAYYHOro LEHTPA c5E IMTA-BMISAG ERL 2017 400 M""";

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

List formatTuple(List tuple) {
  var result = [];
  
  var ingredient = "";
  for (var el in tuple) {
 
    if (el.endsWith(",") || el.endsWith(".")) {
      ingredient += " " + el;
      result.add(ingredient.replaceAll(RegExp(r'\,|\.'), ''));
      ingredient = "";
      continue;
    }
    
    var is_contains_coma = el.contains(",");
    
    if (is_contains_coma || el.contains(".")) {
      var el_tuple = is_contains_coma? el.split(",") : el.split(".");
      ingredient += " " + el_tuple[0];
      result.add(ingredient);
      ingredient = el_tuple[1];
      continue;
    }
    
    ingredient += " " + el;
  }
  
  result.add(ingredient.replaceAll(RegExp(r'\,|\.'), ''));
  
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
    if(!text_tuple[i].endsWith(':') && isUpperCase(text_tuple[i]))
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

    all_results_one.add(countElInList(result_num_tuple, 1));
  }
  
  var biggest_one_num = all_results_one.reduce((curr, next) => curr > next? curr: next);

  var result_id = all_results_one.indexOf(biggest_one_num);
  
  var not_formatted_tuple = all_results[result_id];
  
  var result = formatTuple(not_formatted_tuple);
  print(result);
}