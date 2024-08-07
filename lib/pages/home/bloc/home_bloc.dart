import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<String> items=[];
  HomeBloc() : super(HomeInitial()) {
    on<AddFieldButtonClickedEvent>(addFieldButtonClickedEvent);
    on<DoneButtonClickedEvent>(doneButtonClickedEvent);
    on<FieldEditButtonClickedEvent>(fieldEditButtonClickedEvent);

  }

  FutureOr<void> addFieldButtonClickedEvent(
      AddFieldButtonClickedEvent event, Emitter<HomeState> emit) {

    //print("Add Field Clicked");
    emit(NavigateToEdit());
  }

  FutureOr<void> doneButtonClickedEvent(
      DoneButtonClickedEvent event, Emitter<HomeState> emit) {

    if(state is FieldEditButtonClickedState){
      final editingState = state as FieldEditButtonClickedState;
      final index = items.indexOf(editingState.editItem);

      if (index != -1 && event.enteredItem.isNotEmpty) {
        items[index] = event.enteredItem;
      }

      //items[index]= editingState.editItem;
    }

    else if (event.enteredItem.isNotEmpty){
      items.add(event.enteredItem);
    }
    emit(NavigateToHome(items: items));
  }

  FutureOr<void> fieldEditButtonClickedEvent(
      FieldEditButtonClickedEvent event, Emitter<HomeState> emit) {
    //print(event.editItem);
    emit(FieldEditButtonClickedState(editItem: event.editItem));
  }
}
