import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/surah_details/presentation/manager/sura_details_bloc/sura_details_cubit.dart';
import 'package:islamy/features/surah_details/presentation/manager/sura_details_bloc/sura_details_states.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../../../../../core/widgets/error_message.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../../../../home/data/models/sura_model.dart';
import 'action_buttons.dart';

class SuraPages extends StatefulWidget {
  final SuraModel suraModel;
  const SuraPages({super.key, required this.suraModel});

  @override
  State<SuraPages> createState() => _SuraPagesState();
}

class _SuraPagesState extends State<SuraPages> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuraDetailsCubit, SuraDetailsStates>(
      builder: (context, state) {
        if (state is SuraDetailsLoadingState) {
          return LoadingIndicator();
        }

        if (state is SuraDetailsSuccessState) {
          return Column(
            children: [
              CustomHeader(title: widget.suraModel.nameArabic),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) => setState(() {
                    _currentPage = value;
                  }),
                  itemCount: state.suraPages.length,
                  itemBuilder: (context, index) => SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    child: Text(
                      state.suraPages[index],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 2.2,
                        wordSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              ActionButtons(
                controller: _controller,
                currentPage: _currentPage,
                totalPages: state.suraPages.length,
              ),
            ],
          );
        }

        if (state is SuraDetailsErrorState) {
          return ErrorMessage(state.errorMessage);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
