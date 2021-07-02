/**
 * Dartta interface kavramı yok ama sınıfları implements anahtar kelimesi ile 
 * interfaceymiş gibi kullanabiliriz
 * 
 * imnterfaceler sayesinde dart dilinde olmayan çoklu kalıtım sağlanabilir.
 * bir sınıf birden fazla sınıfı implements diyerek gerçekleştirebilir.
 * 
 * Interfaceler sayesinde ortak özelliği olan ama kalıtımsal olarak alakalı 
 * olmayan sınıfları tek çatı altında toplayabiliriz.
 */

main(List<String> args) {}

abstract class Hayvan {
  
}

abstract class Ucabilenler {
  void fly();
}

abstract class Havlayabilenler {
  void bark();
}

abstract class Kosabilenler {
  void run();
}

class Kopek implements Havlayabilenler, Kosabilenler{

  @override //Kus koşamaz dikkat!
  void run() {
    
  }

  @override
  void bark() {
    
  }
}

class Kus extends Hayvan implements Ucabilenler{
  @override
  void fly() {
    
  }
}

class Insan implements Kosabilenler{
  @override
  void run() {
  }
}


//HOCANIN GİTHUBINDAN
/*
main(List<String> args) {

var tv=Televizyon();
nesneleriCalistir(tv);

var sesSistemi = SesSistemi();
nesneleriCalistir(sesSistemi);

List<Kumanda> sss=List();

sss.add(tv);
sss.add(sesSistemi);

  
}

void nesneleriCalistir(Kumanda k){
  k.sesAc();
  k.sesAzalt();
}

class Kumanda{

  void sesAc(){
    print("Kumanda sınıfı ses aç metodu");
  }

  void sesAzalt(){
    print("Kumanda sınıfı ses azalt metodu");
  }

}

class BirDigerSinif{
  void herhangiBirMethot(){
    print("Herhangi bir metot tetiklendi");
  }
}

class Televizyon  implements Kumanda, BirDigerSinif{
  
   @override
  void sesAc(){
    print("Televizyon sınıfı ses aç metodu");
  }

  @override
   void herhangiBirMethot(){
    print("Herhangi bir metot tetiklendi");
  }

  @override
  void sesAzalt(){
    print("Televisyon sınıfı ses azalt metodu");
  }

 
 
}

 class SesSistemi implements Kumanda{
    @override
  void sesAc(){
    print("Ses sistemi sınıfı ses aç metodu");
  }

  @override
  void sesAzalt(){
    print("Ses sistemi sınıfı ses azalt metodu");
  }

 }
 */

