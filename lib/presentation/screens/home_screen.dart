import 'package:cat_trivia/business_logic/bloc/fact_bloc.dart';
import 'package:cat_trivia/presentation/screens/fact_history_screen.dart';
import 'package:cat_trivia/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Random Cat',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const FactHistoryScreen()));
            },
            icon: const Icon(Icons.history),
          )
        ],
      ),
      body: BlocBuilder<FactBloc, FactState>(
        builder: (context, state) {
          if (state is FactInitialState) {
            return const LoadingWidget();
          } else if (state is FactLoadingState) {
            return const LoadingWidget();
          } else if (state is FactLoadedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "https://cataas.com/cat",
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
                    child: Text(state.fact.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Creation Date: ${_formatDate(state.fact.createdAt)}",
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        BlocProvider.of<FactBloc>(context).add(FetchFactEvent());
                      },
                      child: const Text("New Fact",style: TextStyle(color: Colors.white),)),
                ],
              ),
            );
          } else if (state is FactErrorState) {
            return Text('Error: ${state.error}');
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
