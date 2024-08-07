import 'package:blocpractise2/pages/add/ui/add.dart';
import 'package:blocpractise2/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is NavigateToEdit) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add()));
        }
      },
      builder: (context, state) {
        List<String> items = [];

        if (state is NavigateToHome) {
          items = state.items; // Retrieve the items from the state
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Bloc practise 2"),
          ),
          body: Column(
            children: [
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(AddFieldButtonClickedEvent());

                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Add()));
                      },
                      child: Text("ADD FIELD"))),
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(items[index],
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: (){
                              BlocProvider.of<HomeBloc>(context)
                                  .add(FieldEditButtonClickedEvent(editItem: items[index]));
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Add()));
                            }, child: Icon(Icons.edit))
                          ],
                        ),
                      ),
                    );
                  }),
                  itemCount: items.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
