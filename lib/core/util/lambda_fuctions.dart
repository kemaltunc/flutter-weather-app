void delay(int duration, Function f) {
  Future.delayed(Duration(milliseconds: duration), () {
    f();
  });
}
