
import 'package:flutterasyncredux/core/models/movies_list_type.dart';

class InitAction {
  final MoviesListType listType;
  InitAction(this.listType);
}

class InitCompleteAction{}

class FetchComingSoonEventsIfNotLoadedAction {}
