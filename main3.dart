//------------Constants-------------------
const main_text = """
/ (INCI): Tac. Titanium Dioxide.
 Ethylhexy Hydroxystearate, Paraffinum Liquidum, Phenoxyethanol, Theobroma Cacao Seed
Butter, Camellia Sinensis Leaf, Silk Powder May contain (+/-): CI 77491, CI 77492, CI 74999.
RU MaroTOBVTenb: AO 3BENMH KOCMETUKC cn.k, 05-506 NewHoBOnA, yn. KMTHA 19, Monbua.
VnonHOMo4eHHbi npegCTaBTenb MaroTOBMTens Ha npnHATHe npeTeH3M OT noTpeónrenA
 NpeacTaBTenbCTBO AKunoHepHoro KoMMaHAyTHOrO To8apmuyecTBa «06ujecTBa c orpaHHeHHOM
TBETCTBeHHOCTb0 BenWH KoCMeTKC AuCTpMóyuMR B PoccwMCKO Degepaynn B MocKBe.
125319 r. MocKBa, yn. epHAxOBcKoro A 16, Ten. +7(495) 661-15-09. UA BupoÓHMK: AT EBENIH
 KOCMETIKC Cn.K. 05-506 NeuHOBOnA. Byn KuTHR 19 lonbya
 DaTa MsroTOBneHwa/ ara BroTOBneHHA/ 6 2S706L 92L0 61S
Na napTHWI Na napTT
 opeH AO / BHKopnCTaTH AO
 01.2020
9008/01.2023
 Macca 14 rlg
""";

//var main_text = main_text1.replaceAll(",", ", ");

const allCapitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const allMarks = "()-./,&:;";
var allCapitalsTuple = allCapitals.split('');
var allMarksTuple = allMarks.split('');


//----------------------------------------------
List formatTuple(List tuple) {
  var result = [];
  
  var ingredient = "";
  for (var el in tuple) {
 
    if (el.endsWith(",") || el.endsWith(".")) {
      ingredient += el;
      result.add(ingredient.replaceAll(RegExp(r'\,|\.'), '').replaceAll(RegExp(r'\n'), ' ').replaceAll(RegExp(r'^\s*'), ''));
      ingredient = "";
      continue;
    }
    
    var is_contains_coma = el.contains(",");
    
    if (is_contains_coma || el.contains(".")) {
      var el_tuple = is_contains_coma? el.split(",") : el.split(".");
      ingredient += el_tuple[0];
      result.add(ingredient.replaceAll(RegExp(r'\,|\.'), '').replaceAll(RegExp(r'\n'), ' ').replaceAll(RegExp(r'^\s*'), ''));
      ingredient = el_tuple[1];
      continue;
    }
    
    ingredient += el + " ";
  }
  
  result.add(ingredient.replaceAll(RegExp(r'\,|\.'), '').replaceAll(RegExp(r'\n'), ' ').replaceAll(RegExp(r'^\s*'), ''));
  
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

int countElInList(List arr, int num){
  var sumEl = 0;
  
  for (var el in arr) {
    if (el == num)
      sumEl++;
  }
  //print(arr);
  return sumEl;
}
//----------------------------------------------

bool isUpperCase(String string) {
  var stringTuple = string.split('');
  var acceptCount = 0;

  for (var letter in stringTuple) {
    if (allCapitalsTuple.contains(letter)) {
      acceptCount++;
    } else if (countMarks(letter) > 0) {
      acceptCount++;
    }
  }

  if (acceptCount == string.length)
    return true;

  return false;
}

bool isCapital(String string) {
  var stringTuple = string.split('');

  if (stringTuple.length > 0) {
    if (allCapitalsTuple.contains(stringTuple[0])) {
      return true;
    } 
  }

  return false;
}

int countMarks(String string) {
  var stringTuple = string.split('');
  var countMarks = 0;
  
  for (var el in stringTuple) {
    if (allMarksTuple.contains(el)) {
      countMarks++;
    } 
  }

  return countMarks;
}

bool isNoise(String string) {
  var stringTuple = string.split('');
  var count_word = 0;
  //print(allCapitalsTuple.contains(stringTuple[stringTuple.length -1 ]));
  
  for (var el in stringTuple) {
    if (allCapitalsTuple.contains(el)) {
      count_word++;
    } else if (allMarksTuple.contains(el)) {
      count_word++;
    }
  }
  
  //print(count_word);
  
  
  if (isCapital(string) && count_word == 1 || countMarks(string) + 1 == count_word || isUpperCase(string)) {
    return false;
  } else {
    return true;
  }
}

String makeupStartText(var text_tuple) {
  var result_string = "";
  
  if (text_tuple.length > 0){
    for (var i = 0; i < text_tuple.length - 1; i++) {
      result_string += text_tuple[i] + ", ";
    }
    result_string += text_tuple[text_tuple.length - 1];
  } 
   
  return result_string;
}

void main() {
  
  var text_tuple = main_text.split(" ");
  
  var text_tuple_marks = [];
  
  for(var el in text_tuple) {
    if (!isNoise(el) && (el.endsWith(',') || el.contains('-') || isUpperCase(el) || isCapital(el)))
      text_tuple_marks.add(1);
    else if (el.endsWith(':'))
      text_tuple_marks.add(2);
    else if (el.endsWith('.'))
      text_tuple_marks.add(3);
    else
      text_tuple_marks.add(0);
  }
  
  //print(text_tuple_marks.sublist(40, text_tuple_marks.length));
  //print(text_tuple.sublist(40, text_tuple.length));
  
  //print(ff("AQUA"));
  //--------------------------------------------------------------
  
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
  print(all_results);
  
  var result = formatTuple(not_formatted_tuple);
  print(result);
  
  print(makeupStartText(result));
}
