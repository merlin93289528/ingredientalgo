//------------Constants-------------------
const main_text1 = """
GUS reAb-YxOAAAR Ayua KpeMN Kapau6OA" OT NIVEA
TeAb AAR Ayua c MaCAOM MOHOH 3ab0THTCR O KOXe, ABAaR
ee HesepoRTHO MATKON. HexHbH apoMaTTponwveckHX pyKTOB npofu
Baww syBCTBa. NpespaTHTe exeAHeBHoe npHHATHE AYua B MOM
HCTHHHOro HaCAaxAeHHR H 3a6OTH O cebe. lpHMeNeNHe: HakecwTe
Aywa Ha Teno, noMacCHpyTe H CMONTe. MaberaRte nonaAaHMa Aasa.
D/TransportRuntime.SQLiteEventStore(29467): Storing event with priority=VERY_LOW, name=FIREBASE_ML_SDK for destination cct
AepMaTOAorwvecxH nporecTHposaNo.
pH-c6anancHpoBaHO
6HopaaAaraeMan
opMyna
opMyAa 6es MMKDOnAaCTHKa 8 CooTBeTCTBNHConpeAeneHHeM NporpaMM
He coAepxT
MHKponAaCTHK
0OH no Oxpyxaxouei cpeAe.
U reAAorARA AAR AYuy "Kpem I Kapam6oA" ala NIVEA.
38cTOcysaNHR: HBHecits reAb AMR AYIy Na tiAO, nOMacaxyire i sMwTe.
YHMKaRTe norpanARHHR B ONÍ. He BHKODHCTOayaaTH B xapvoBHx yiARX
pH s6aABNCOBaNO AepMaTOAOrivHO nporecToBano
K2 NIVEA® yCINan "Kpew xone Kapaw6OAN" AYuKa apHaaraN KyriM real.
KoNMBNny: AyuKa apHaAFaN reAhai ABHere xarbiNb3,
ykaABNS MaNe xyi3. Kaare rycyine xOA ÓepMeNis.
pH veNAecripiaren AepMaTOAOrwRAK CMNaKran oTkialiaren
0 NIVEA®-dan dush uchun "Krem va Karambol" gel-g'amxo'rilk.
Foydalanish: dush uchun gelni badanga surting, uqalang va yuvib tashlang. Ko
tushishidan saglaning, pH muvozanatiangan dermatologik sinovdan o't8
Cocraa/CxARA/Kupaw/Tarkibit: Aqua, Sodium www.NIVEA.com
Laureth Sulfate, Cocamidopropyl Betaine,
PEG-7 Glyceryl Cocoate, Parfum, Cocos Beiersdorf
Nucifera Oil, Gardenia Taitensis Flower Beiersdorf AG,
Extract, Glycerin, Sodium Chioride, PEG-3
Dstearate, Citric Acid, PEG-40 Hydrogenated -20245 Hamburg
Castor Oil, PEG-200 Hydrogenated Glycervl arerOBETA/8ipyul/lshlah chi
almate, Tocopherol, Sodium Benz0ate Bapobanc Belersdorf Manufactarlag Beri
Franklestrasse 1, D-10587, Berlia,
fepas, Germaniya/5aicpeanpe
Sepals fiL, dpanuiTacoe 1, A10
Limonene, Linalool, Citronellol, Geraniol
250 MA/mle
Cor
Saiepcaspis, 105064, PuoEs, t. Mo
Jexi Baa, &9, 5 ,
AEE 0-2000-753 Po
""";

const allCapitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const allMarks = "()-./,&:;";
var allCapitalsTuple = allCapitals.split('');
var allMarksTuple = allMarks.split('');

//---------------------Functions----------------
List formatTuple(List tuple) {
  var result = [];

  var ingredient = "";
  for (var el in tuple) {
    if (el.endsWith(",") || el.endsWith(".") || el.contains('-')) {
      ingredient += el;
      result.add(ingredient
          .replaceAll(RegExp(r'\,'), '')
          .replaceAll(RegExp(r'\n'), ' ')
          .replaceAll(RegExp(r'^\s*'), ''));
      ingredient = "";
      continue;
    }

    var is_contains_coma = el.contains(",");

    if ((is_contains_coma && countElInList(el.split(''), ',') == 1) || (el.contains(".") && countElInList(el.split(''), '.') == 1)) {
      var el_tuple = is_contains_coma ? el.split(",") : el.split(".");
      ingredient += el_tuple[0];
      result.add(ingredient
          .replaceAll(RegExp(r'\,'), '')
          .replaceAll(RegExp(r'\n'), ' ')
          .replaceAll(RegExp(r'^\s*'), ''));
      ingredient = el_tuple[1];
      continue;
    }

    ingredient += el + " ";
  }

  result.add(ingredient
      .replaceAll(RegExp(r'\,'), '')
      .replaceAll(RegExp(r'\n'), ' ')
      .replaceAll(RegExp(r'^\s*'), ''));
  
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

int countElInList(List arr, var num) {
  var sumEl = 0;

  for (var el in arr) {
    if (el == num) sumEl++;
  }

  return sumEl;
}

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

  if (acceptCount == string.length) return true;

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

  for (var el in stringTuple) {
    if (allCapitalsTuple.contains(el)) {
      count_word++;
    } else if (allMarksTuple.contains(el)) {
      count_word++;
    }
  }

  if (isCapital(string) && count_word == 1 ||
      countMarks(string) + 1 == count_word ||
      isUpperCase(string)) {
    return false;
  } else {
    return true;
  }
}

String makeupText(var text_tuple) {
  var result_string = "";

  if (text_tuple.length > 0) {
    for (var i = 0; i < text_tuple.length - 1; i++) {
      result_string += text_tuple[i] + ", ";
    }
    result_string += text_tuple[text_tuple.length - 1];
  }

  return result_string;
}

List cleanResultText(var text, int number_of_repetitions) {
  var text_tuple = text.split(" ");

  var text_tuple_marks = [];

  for (var el in text_tuple) {
    if (!isNoise(el) &&
        (el.endsWith(',') ||
            el.contains('-') ||
            isUpperCase(el) ||
            isCapital(el)))
      text_tuple_marks.add(1);
    else if (el.endsWith(':'))
      text_tuple_marks.add(2);
    else if (el.endsWith('.'))
      text_tuple_marks.add(3);
    else
      text_tuple_marks.add(0);
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

      if (el == 0) count_zero++;
      if (el == 1) count_zero = 0;

      final_tuple.add(text_tuple[i]);
      final_tuple_num.add(el);

      if (final_tuple.length == count_zero &&
          (el == 3 || count_zero == zeroPattern || el == 2)) {
        final_tuple = [];
        final_tuple_num = [];
        count_zero = 0;
        continue;
      }

      if (final_tuple.length > count_zero &&
          (el == 3 || count_zero == zeroPattern || el == 2)) {
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
    
    if (number_of_repetitions == 0)
      all_results_one.add(countElInList(result_num_tuple, 1));
    else
      all_results_one.add(countElInList(result_num_tuple, 1) - (countElInList(result_num_tuple, 0)/2));
  }

  var biggest_one_num =
      all_results_one.reduce((curr, next) => curr > next ? curr : next);

  var result_id = all_results_one.indexOf(biggest_one_num);

  var not_formatted_tuple = all_results[result_id];
  
  var result = formatTuple(not_formatted_tuple);
  return result;
}



void main() {
  var clFirstRes = makeupText(cleanResultText(main_text1, 0));
  var clSecondRes = cleanResultText(clFirstRes, 1);
  print(clSecondRes);
}
