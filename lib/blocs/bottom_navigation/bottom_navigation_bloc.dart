import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shonalec/repositories/first_page_repository.dart';
import 'package:shonalec/repositories/second_page_repository.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final FirstPageRepository firstPageRepository;
  final SecondPageRepository secondPageRepository;
  int currentIndex = 0;

  BottomNavigationBloc({
    required this.firstPageRepository,
    required this.secondPageRepository
  }) : assert(firstPageRepository != null),
        assert(secondPageRepository != null), super();

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.dispatch(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getFirstPageData();
        yield FirstPageLoaded(text: data);
      }
      if (this.currentIndex == 1) {
        int data = await _getSecondPageData();
        yield SecondPageLoaded(number: data);
      }
    }
  }

  Future<String> _getFirstPageData() async {
    String data = firstPageRepository.data;
    if (data == null) {
      await firstPageRepository.fetchData();
      data = firstPageRepository.data;
    }
    return data;
  }

  Future<int> _getSecondPageData() async {
    int data = secondPageRepository.data;
    if (data == null) {
      await secondPageRepository.fetchData();
      data = secondPageRepository.data;
    }
    return data;
  }
}