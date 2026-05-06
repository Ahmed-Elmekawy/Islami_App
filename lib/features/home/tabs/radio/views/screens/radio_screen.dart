import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/error_message.dart';
import '../../view_model/bloc/radio_bloc.dart';
import '../../view_model/bloc/radio_event.dart';
import '../../view_model/bloc/radio_state.dart';
import '../widgets/radio_list_view.dart';
import '../widgets/radio_tab_bar.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RadioScreenView();
  }
}

class RadioScreenView extends StatelessWidget {
  const RadioScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RadioBloc, RadioState>(
        listener: (context, state) {
          if (state is RadioError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is RadioLoading || state is RadioInitial) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFE2BE7F)),
            );
          }

          if (state is RadioLoaded) {
            return CustomBackground(
              imagePath: AppImages.radioBg,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  RadioTabBar(isRadioSelected: state.isRadioSelected),
                  const SizedBox(height: 16),
                  Expanded(child: RadioListView(state: state)),
                ],
              ),
            );
          }

          if (state is RadioError) {
            return ErrorMessage(
              state.message,
              onRetry: () =>
                  context.read<RadioBloc>().add(FetchRadiosAndRecitersEvent()),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
