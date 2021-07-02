class CemberDaire {
  int _yaricap = 1;
  double _pi = 3.14;

  CemberDaire(int girilenYariCap) {
    _yaricapKontrol = girilenYariCap;
  }

  void set _yaricapKontrol(int yaricap) {
    if (yaricap > 0)
      _yaricap = yaricap;
    else
      return;
  }

  double cevre() {
    return 2 * _pi * _yaricap;
  }

  double alan() {
    return _pi * _yaricap * _yaricap;
  }
}
