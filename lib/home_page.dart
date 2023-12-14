import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_local_app/utils/connectivity/bloc/connectivity_bloc.dart';
import 'package:multi_local_app/utils/localization/app_localizations.dart';
import 'package:multi_local_app/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home".tr(context),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                "hello_msg".tr(context),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const Text(
                'This text will not be translated . ',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              BlocBuilder<ConnectivityBloc, ConnectivityState>(
                builder: (context, state) {
                  if (state is ConnectedState) {
                    // showSnackBar(context, state.messsage);
                    return Text(
                      state.messsage,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    );
                  } else if (state is NotConnectedState) {
                    // showSnackBar(context, state.messsage);
                    return Text(
                      state.messsage,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
