import 'generic_class.dart';

main(List<String> args) {
  MyStack myStack = MyStack();
  myStack.push(5);
  myStack.push("melike");
  myStack.push(true);

  print(myStack.pop());
  print(myStack.pop());
  print(myStack.pop());

  IntMyStack intMyStack = IntMyStack();
  intMyStack.push(5);
  //intMyStack("melike"); //hata -> sadece int değer alan stack

  GenericStack<int> genericStack = GenericStack();
  genericStack.push(3);
  //genericStack.push("Melike"); // sadece int
  print(genericStack.pop());
}
