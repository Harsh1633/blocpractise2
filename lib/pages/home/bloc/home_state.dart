part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState{}

class NavigateToEdit extends HomeActionState{}

class NavigateToHome extends HomeActionState{
  final List<String> items;

  NavigateToHome({required this.items});
}

class FieldEditButtonClickedState extends HomeState{
  final String editItem;

  FieldEditButtonClickedState({required this.editItem});

}