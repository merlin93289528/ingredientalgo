//------------Constants-------------------
const main_text = """NPMMEHEHME
YrpoM H BeMepoM,
CHOVHB BATHBIM
AMCK.
HaHecHTe Ha nHYO
MOBTOpMTe po Tex
M wero. He TpeőyeT TpeHAA nop noka BaTHBIM
AMCK He CraHer
MneanbHo 4HCTBIM.
M CMbIBaHMA.
6E3 CNMPTA. BE3 OTAYLWEK
ipOTecTwpoBAHO NOA AEpMaToNornyecKUM M OdDTONBManormyeckUM
KOHTpOneM.
LEHHOCTH L'OREAL PARIS
Be3onacHocTb M 3hheKTMBHOCTb AOKa3aHa He3aBW
CMMBIMM MHCTHTyTaMM npM MMHMMyM 600 HaHeceHMAX Ha
KOXy, BKNKO4aA uyBCTBMTeibHylo.
LOréal npwaepxeH MeTOgaM TeCTHPOBaHHA 6e3
KMBOTHBIX 6onee 30 neT.
781988 1-COCTABICKNAD: AQUA /WATER HEXYLENE GLYCOL
GLYCERIN .POLOXAMER 184 DISODIUM COCOAMPHODIACETAIE
DISODIUM EDTA POLYAMINOPROPYL BIGUANIDE. (FIL.L. B548942
FOEAU IOpeare), 119180, . Mooxsa, 4HTanyreHwHcoAÁ nep, 18, Cīp.1-2. Ten: (454913
EHE. TEaTb Iporyayion poinuaNg| TMBX 34p Ko. KT Hertzstrasse 175 DI6187 KARLSRURE,
GEmay epk3ARL IQgeH pO: CHL H2 ynaoere. TenepOH TopAe HEHM NOpeanb 1lapex8 800 10 9 0. b
CTHpTa-He CopepoAT 3THTIOBAĂ CTHDT. "YnonHoMOHEeHHBN nOepCraBHTens k3roT08MTenol HMNODTeP.
28T602 06/23
3MHBaHR BOONO. 33cnoxowe Wipy. HawociTH 8a
Wpy Donwn 3 ponooroo BaTHOTO AMCKY BpaHI
Ta bB1epi. Apeca pna 38epHeHs 8 Yipai: TO3
lopeanb Ypaira', ayn. MIpirvena, 4, KAia,
C3680. Bupo6eMc NOpeanb Tlapwx,14,po PyaAnt
75008, lapux, opania. BupoonenO B Hwevwa.
praTN npM Teweparypi +6C.+25C. TepuiH
MpaTocni ta Howep napni HasegeH Ka ynaioe
AaTa BwpoHALTE a36 icauis AO KIBepeoi
ATM. BHICpHCTaH nporarow 6 uicauja nicna
IDany opcnysaM. He BMIODHCTOBYSaTM nICTIR
30NE TEpMIHY 1pMJaTHOCTL
M
N
LOREAL PARIS
14, rue Royale 75008 Paris FRANCE
SA 75000 93584 ST OUEN CEDEXER
www.loreal-paris.ru""";

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