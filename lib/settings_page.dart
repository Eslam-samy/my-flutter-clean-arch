import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_local_app/utils/localization/app_localizations.dart';
import 'package:multi_local_app/utils/localization/cubit/locale_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr(context)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
            listener: (context, state) {
              Navigator.of(context).pop();
            },
            builder: (context, state) {
              return DropdownButton<String>(
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    BlocProvider.of<LocaleCubit>(context)
                        .changeLanguage(newValue);
                  }
                },
                value: state.locale.languageCode,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ['ar', 'en'].map(
                  (String e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
