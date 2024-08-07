import 'package:blocpractise2/pages/home/bloc/home_bloc.dart';
import 'package:blocpractise2/pages/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Add extends StatefulWidget {
  //final String? initialValue;
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
       if(state is NavigateToHome){
         //print("Navigate to Home");
         Navigator.of(context).push(
             MaterialPageRoute(builder: (context) => Home()));
       }
      },
      builder: (context, state) {

        if(state is FieldEditButtonClickedState){
          // print("state uis FieldEditButtonClickedState");
          nameController.text= state.editItem;
        }


        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextFormField(style: ,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
                    //initialValue: " fdsv",
                    decoration: InputDecoration(labelText: 'Name',
                        border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(
                      DoneButtonClickedEvent(enteredItem: nameController.text));
                }, child: Text("DONE"))
              ],
            ),
          ),
        );
      },
    );
  }
}

