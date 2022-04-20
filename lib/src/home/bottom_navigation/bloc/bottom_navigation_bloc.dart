import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part './bottom_navigation_events.dart';
part './bottom_navigation_states.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavagationState> {
  BottomNavigationBloc() : super(const BottomNavagationState(0)) {
    on<BottomNavigationEvent>(_onNavigation);
  }
  int currentIndex = 0;
  BottomNavigationBloc get instance => this;
  void navigate(int index) {
    add(BottomNavigationEvent(index));
    print("navigating");
  }

  void _onNavigation(
      BottomNavigationEvent event, Emitter<BottomNavagationState> emit) async {
    currentIndex = event.currentIndex;
    print(event.currentIndex);
    emit(BottomNavagationState(currentIndex));
  }
}
