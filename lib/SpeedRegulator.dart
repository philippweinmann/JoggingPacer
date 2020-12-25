import 'dart:async';

// Contains the logic to process the speed of the runner
class SpeedRegulator {
  double targetRunningSpeed;
  int steps = 0;


  String localPath = "../assets/bells.mp3";

  SpeedRegulator(double targetRunningSpeed) {
    this.targetRunningSpeed = targetRunningSpeed;
  }

  changeRunningSpeed(targetRunningSpeed) {
    this.targetRunningSpeed = targetRunningSpeed;
    changeMusicSpeed(targetRunningSpeed);
  }

  changeMusicSpeed(double targetRunningSpeed) {}

  playMusic(bool play) {
    if (play) {
      resumePlaying();
    } else {
      pausePlaying();
    }
  }

  resumePlaying() {
  }

  pausePlaying() {
  }

  void countSteps(int zAcc) {
    bool abovePart = false;
    if (zAcc > 6000) {
      if (!abovePart) {
        steps++;
      }
      abovePart = true;
    } else if (zAcc < 4500) {
      abovePart = false;
    }
  }

  Timer t;
  bool timerStarted = false;
  Duration d = Duration(seconds: 10);

  void startTimer() {
    steps = 0;
    t = Timer.periodic(d, (Timer timer) => handleTimeOut());
    print("started timer");
  }

  void stopTimer() {
    t.cancel();
    steps = 0;
    print("stopped timer");
  }

  void handleSpeedCheckTimer() async{
    if (!timerStarted) {
      startTimer();
    } else {
      stopTimer();
    }
    timerStarted = !timerStarted;
  }

  double stepsPerTime;
  void handleTimeOut() {
    print("timer firing");
    stepsPerTime = steps / 10;
    // reset amount of steps
    steps = 0;
  }
}
