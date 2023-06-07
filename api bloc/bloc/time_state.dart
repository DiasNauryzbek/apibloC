
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/data/repository/model.dart';


@immutable
abstract class TimeState extends Equatable {}

class NewsLoadingState extends TimeState {

  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends TimeState {
  final List<NewsModel> news;
  NewsLoadedState(this.news);
  @override
  List<Object?> get props => [news];
}

class NewsErrorState extends TimeState {
  final String error;
  NewsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}