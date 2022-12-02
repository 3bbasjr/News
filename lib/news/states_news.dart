
abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomState extends NewsStates{}
class BusinessLoading extends NewsStates{}
class Businesssuccess extends NewsStates{}
class BusinessError extends NewsStates{
  final String error;
  BusinessError(this.error);
}

class SportsLoading extends NewsStates{}
class Sportsssuccess extends NewsStates{}
class SportsError extends NewsStates{
  final String error;
  SportsError(this.error);
}

class ScienceLoading extends NewsStates{}
class Sciencesuccess extends NewsStates{}
class ScienceError extends NewsStates{
  final String error;
  ScienceError(this.error);
}

class SearchLoading extends NewsStates{}
class Searchsuccess extends NewsStates{}
class SearchError extends NewsStates{
  final String error;
  SearchError(this.error);
}
class DarkMode extends NewsStates{}