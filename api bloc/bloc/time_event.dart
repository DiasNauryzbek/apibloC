import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TimeEvent extends Equatable {
  const TimeEvent();
}

class LoadNewsEvent extends TimeEvent {
  @override
  List<Object?> get props => [];
}