import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shonalec/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:shonalec/repositories/first_page_repository.dart';
import 'package:shonalec/repositories/second_page_repository.dart';
import 'package:shonalec/ui/app_screen.dart';

import 'blocs/bottom_navigation/bottom_navigation_bloc.dart';


class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}


void main() {
  BlocOverrides.runZoned(() {},
    blocObserver: SimpleBlocDelegate(),
  );

  //BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<BottomNavigationBloc>(
          builder: (context) =>
          BottomNavigationBloc(
            firstPageRepository: FirstPageRepository(),
            secondPageRepository: SecondPageRepository(),
          )
            ..dispatch(AppStarted()),
          child: AppScreen(),
        )
    );
  }
}