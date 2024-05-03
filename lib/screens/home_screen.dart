import 'package:counterproject/bloc/counter_bloc.dart';
import 'package:counterproject/widgets/floating_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter value is: ",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10,),
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state){
                  if(state is CounterInitial){
                    return const Text(
                      "0",
                      style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                    );
                  }else if(state is CounterValueChangedState){
                    return Text(
                      state.counter.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.blueGrey),
                    );
                  }else{
                    return Container();
                  }
                }
            ),

          ],
        ),
      ),
      floatingActionButton: const FloatingButtonsWidget(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}