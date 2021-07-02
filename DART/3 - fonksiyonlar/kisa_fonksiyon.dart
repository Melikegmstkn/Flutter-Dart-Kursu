void main(List<String> args) {

  print("çarpım : " + sayilariCarp(12, 6).toString());

  print("Büyük olan sayı : " + maxOlaniBul(14, 9).toString());

  print("Küçük olan sayı : " + minOlaniBul(14, 19).toString());
}

int sayilariCikar(int s1, int s2) {
  return (s1 - s2);
}


int maxOlaniBulUzun(int s1, int s2){
  if(s1 < s2){
    return s2;
  }else {
    return s1;
  }
}

int maxOlaniBul(int s1, int s2) => (s1 < s2) ? s2 : s1;

minOlaniBul(int s1, int s2) => (s1 < s2) ? s1 : s2;

int sayilariCarp(int s1, int s2) => s1 * s2;