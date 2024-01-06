import 'package:cat_trivia/business_logic/bloc/fact_bloc.dart';
import 'package:cat_trivia/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FactHistoryScreen extends StatelessWidget {
  const FactHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Fact History'),
      ),
      body:  BlocBuilder<FactBloc, FactState>(
        builder: (context, state) {
          if (state is FactInitialState) {
            return const Center(
              child: LoadingWidget(),
            );
          } else if (state is FactLoadingState) {
            return const Center(
              child: LoadingWidget(),
            );
          }
          if (state is FactLoadedState) {
            return ListView.builder(
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                final fact = state.facts[index];
                return ListTile(
                  onTap: (){},
                  title: Text(fact.text,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("Creation Date: ${_formatDate(state.fact.createdAt)}"),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
  String _formatDate(DateTime date) {
    return DateFormat('d-MMMM y', 'en_US').format(date);
  }
}
