part of 'bottom_navigation_bar_cubit.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();

  @override
  List<Object> get props => [];
}

final class BottmNavigationBarInitial extends BottomNavigationBarState {}
final class DashBoardChangeItemState extends BottomNavigationBarState {}

