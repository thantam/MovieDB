
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/core/redux/app/app_state.dart';
import 'package:flutterasyncredux/core/redux/common/common_actions.dart';
import 'package:flutterasyncredux/core/viewmodel/movies_page_view_model.dart';
import 'package:flutterasyncredux/ui/common/info_message_view.dart';
import 'package:flutterasyncredux/ui/common/loading_view.dart';
import 'package:flutterasyncredux/ui/common/platform_adaptive_progress_indicator.dart';

import 'movie_grid.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage(this.listType);
  final MoviesListType listType;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MoviesPageViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(InitAction(listType)),
      converter: (store) => MoviesPageViewModel.fromStore(store, listType),
      builder: (_, viewModel) => MoviesPageContent(viewModel, listType),
    );
  }
}

class MoviesPageContent extends StatelessWidget {

  MoviesPageContent(this.viewModel, this.listType);
  final MoviesPageViewModel viewModel;
  final MoviesListType listType;

  @override
  Widget build(BuildContext context) {
    return LoadingView(
        status: viewModel.status,
        loadingContent: const PlatformAdaptiveProgressIndicator(),
        errorContent: ErrorView(
          description: 'Error loading events.',
          onRetry: viewModel.refeshEvents,
        ),
        successContent: MovieGrid(
          listType: listType,
          movies: viewModel.movies,
          onReloadCallback: viewModel.refeshEvents,
        ),
    );
  }

}