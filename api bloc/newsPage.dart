import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/bloc/bloc/time_bloc.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/bloc/bloc/time_event.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/bloc/bloc/time_state.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/data/repository/model.dart';

class NewsOb extends StatelessWidget {
  const NewsOb({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeBloc>(
          create: (BuildContext context) => TimeBloc(NewsRepository()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(title: const Text('The BloC App')),
          body: blocBody()),
    );
  }

Widget blocBody() {
    return BlocProvider(
      create: (context) => TimeBloc(
        NewsRepository(),
      )..add(LoadNewsEvent()),
      child: BlocBuilder<TimeBloc, TimeState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
           if (state is NewsErrorState) {
            return const Center(child:  Text("Error"));
          }
          if (state is NewsLoadedState) {
            List<NewsModel> newsList = state.news;
            return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${newsList[index].id}  ${newsList[index].title}',
                              style: const TextStyle(color: Colors.white),
                            ),

                            subtitle: Text(
                              '${newsList[index].starts_at}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  newsList[index].image.toString()),
                            ))),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
