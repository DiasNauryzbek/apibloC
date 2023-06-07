
import 'package:dio/dio.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/bloc/bloc/time_event.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/bloc/bloc/time_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/repository.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final NewsRepository _newsRepository;

  TimeBloc(this._newsRepository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
     emit(NewsLoadingState());
      try {
        final news = await _newsRepository.getNews();
        emit(NewsLoadedState(news.toList()));
      }on DioError catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}