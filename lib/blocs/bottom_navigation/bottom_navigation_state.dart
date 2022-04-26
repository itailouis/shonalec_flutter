import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  BottomNavigationState() ;
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex}) : super([currentIndex]);

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';

  @override
  List<Object?> get props => [currentIndex];
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';

  @override
  List<Object?> get props => [];
}

class FirstPageLoaded extends BottomNavigationState {
  final String text;

  FirstPageLoaded({required this.text}) : super([text]);

  @override
  String toString() => 'FirstPageLoaded with text: $text';

  @override
  List<Object?> get props => [text];
}

class SecondPageLoaded extends BottomNavigationState {
  final int number;

  SecondPageLoaded({required this.number}) : super([number]);

  @override
  String toString() => 'SecondPageLoaded with number: $number';

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}