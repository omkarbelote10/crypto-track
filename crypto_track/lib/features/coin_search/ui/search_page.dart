import 'package:crypto_track/core/connectivity/ui/connectivity_banner.dart';
import 'package:crypto_track/features/coin_search/bloc/search_bloc.dart';
import 'package:crypto_track/features/coin_search/bloc/search_event.dart';
import 'package:crypto_track/features/coin_search/bloc/search_state.dart';
import 'package:crypto_track/features/coin_search/header_bloc/header_bloc.dart';
import 'package:crypto_track/features/coin_search/ui/coins_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coins_list_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchBloc>().add(SearchEvent.started());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 47,
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'Search for coins',
              labelStyle: TextStyle(color: Colors.white,),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onChanged: (value) {
              if(value.isEmpty){
                context.read<HeaderBloc>().add(HeaderEmptyEvent());
              }else{
                context.read<HeaderBloc>().add(HeaderSearchedEvent());
              }
              context.read<SearchBloc>().add(SearchEvent.queryChanged(value));
            },
            textInputAction: TextInputAction.done,
            autofocus: true,
          ),
        ),
      ),
      body: Column(
        children: [
          const ConnectivityBanner(),
          const CoinListHeader(),
          const Divider(thickness: 2.5,),
          Expanded(
            child: BlocBuilder<SearchBloc,SearchState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => const SizedBox(),
                      notFound: ()=> const Text('Coins not found'),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      loaded: (coinsList) => CoinsListWidget(coinsList: coinsList,),
                      error: () => const Text('Something went Wrong'),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
