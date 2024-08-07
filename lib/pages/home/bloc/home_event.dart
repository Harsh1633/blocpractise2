part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


final class HomeInitialEvent extends HomeEvent{}


class AddFieldButtonClickedEvent extends HomeEvent{}

class DoneButtonClickedEvent extends HomeEvent{
  final String enteredItem;

  DoneButtonClickedEvent({required this.enteredItem});
}

class FieldEditButtonClickedEvent extends HomeEvent{
  final String editItem;

  FieldEditButtonClickedEvent({required this.editItem});
}