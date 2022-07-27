class CounterRepository {
  late int currentCounter = 0;

  int increaseRepoCounter(int counter) {
    currentCounter = currentCounter + counter;
    return currentCounter;
  }

  int decreaseRepoCounter(int counter) {
    currentCounter = currentCounter - counter;
    return currentCounter;
  }

  int getCurrentCounter() {
    return currentCounter;
  }
}
