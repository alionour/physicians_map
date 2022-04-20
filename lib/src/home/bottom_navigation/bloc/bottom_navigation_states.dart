part of './bottom_navigation_bloc.dart';

class BottomNavagationState extends Equatable {
  final int index;

  const BottomNavagationState(this.index);
  @override
  List<Object?> get props => [index];
}
