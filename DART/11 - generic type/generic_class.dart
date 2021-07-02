class MyStack {
  List _listem = [];

  push(yeniEleman) {
    _listem.add(yeniEleman);
  }

  pop() {
    return _listem.removeLast();
  }
}

class IntMyStack {
  List<int> _listem = <int>[];

  push(int yeniEleman) {
    _listem.add(yeniEleman);
  }

  int pop() {
    return _listem.removeLast();
  }
}

class GenericStack<T>{
   List<T> _listem = <T>[];

  push(T yeniEleman) {
    _listem.add(yeniEleman);
  }

  T pop() {
    return _listem.removeLast();
  }
}