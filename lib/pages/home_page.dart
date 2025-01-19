import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter/counter_bloc.dart';
import '../blocs/theme/theme_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Task'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, int>(
          listener: (context, count) {
            if (count == 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3,
                    children: [
                      Icon(Icons.celebration, color: Colors.white,),
                      Text('Counter reached 5', style: TextStyle(fontSize: 20),),
                      Icon(Icons.celebration, color: Colors.white,),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, count) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter Value: $count',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Icon(Icons.remove, color: Colors.white,),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Icon(Icons.add, color: Colors.white,),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}