import 'package:get/get.dart';

class BottomNavState extends GetxController{
 int _currentIndex=0;
  int get stateIndex=>_currentIndex;

  void onTapIndex(int index){
     if(_currentIndex==index){
       return;
     }else{
       _currentIndex=index;
       update();
     }
  }
  void backHome(){
    onTapIndex(0);
  }
}