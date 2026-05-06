import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/surah_details/view_model/bloc/sura_details_bloc.dart';
import 'package:islamy/features/surah_details/view_model/bloc/sura_details_state.dart';
import 'package:islamy/features/surah_details/view_model/bloc/sura_details_event.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../../../../../core/widgets/error_message.dart';
import 'package:islamy/features/home/tabs/quran/data/models/sura_model.dart';
import '../../../../core/widgets/loading_indicator.dart';
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
    return BlocBuilder<SuraDetailsBloc, SuraDetailsState>(
      builder: (context, state) {
        if (state is SuraDetailsLoading) {
          return LoadingIndicator();
        }

        if (state is SuraDetailsSuccess) {
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

        if (state is SuraDetailsError) {
          return ErrorMessage(
            state.message,
            onRetry: () {
              context.read<SuraDetailsBloc>().add(
                LoadSuraContentEvent(suraModel: widget.suraModel),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
