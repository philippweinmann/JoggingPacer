class SpeedRegulator{
  double targetRunningSpeed;

  SpeedRegulator(double targetRunningSpeed) {
    this.targetRunningSpeed = targetRunningSpeed;
  }

  changeRunningSpeed(targetRunningSpeed){
    this.targetRunningSpeed = targetRunningSpeed;
    changeMusicSpeed(targetRunningSpeed);
  }

  changeMusicSpeed(double targetRunningSpeed){

  }

  playMusic(bool play) {
    if(play) {
      resumePlaying();
    } else {
      pausePlaying();
    }
  }

  resumePlaying() {

  }

  pausePlaying() {

  }
}