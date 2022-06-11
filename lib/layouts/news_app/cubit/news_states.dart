abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsChangeBottomNavStates extends NewsStates {}

class NewsGetDataLoadingStates extends NewsStates {}

class NewsSuccessfullyGettingDataStates extends NewsStates {}

class NewsErrorGettingDataStates extends NewsStates {
  Error e;

  NewsErrorGettingDataStates(this.e);
}

class NewsSearchGetDataLoadingStates extends NewsStates {}

class NewsSearchSuccessfullyGettingDataStates extends NewsStates {}

class NewsSearchErrorGettingDataStates extends NewsStates {
  Error e;

  NewsSearchErrorGettingDataStates(this.e);
}
