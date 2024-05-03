import 'package:counterproject/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingButtonsWidget extends StatelessWidget{
  const FloatingButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
            child: const Icon(Icons.add),
        ),
        const SizedBox(height: 10,),
        FloatingActionButton(
          onPressed: (){
            BlocProvider.of<CounterBloc>(context).add(ResetEvent());
          },
          child: const Icon(Icons.exposure_zero),
        ),
        const SizedBox(height: 10,),
        FloatingActionButton(
          onPressed: (){
            context.read<CounterBloc>().add(DecrementEvent());
          },
          child: const Icon(Icons.remove),
        )
      ],
    );
  }
}