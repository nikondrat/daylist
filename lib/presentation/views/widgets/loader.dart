import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class _LoadingWidget extends HookConsumerWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingAnimationWidget.fourRotatingDots(
        size: 40, color: context.color.primaryColor);
  }
}

class LoaderWidget<T> extends StatelessWidget {
  final AsyncValue<T> config;
  final Widget Function(T) builder;
  const LoaderWidget({super.key, required this.config, required this.builder});

  @override
  Widget build(BuildContext context) {
    return config.when(
        data: (data) => builder(data),
        error: (error, stackTrace) => Center(child: Text('$error')),
        loading: () => const Center(child: _LoadingWidget()));
  }
}

class SubjectsLoaderWidget extends HookConsumerWidget {
  final Widget Function(List<Subject> subjects, List<Replacement> replacements)
      builder;
  const SubjectsLoaderWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Subject>> subjects = ref.watch(subjectsProvider);
    final AsyncValue<List<Replacement>> replacements =
        ref.watch(replacementsProvider);

    return Material(
        color: context.color.backgroundColor,
        child: LoaderWidget(
            config: subjects,
            builder: (subjectsList) => LoaderWidget(
                config: replacements,
                builder: (replacementsList) =>
                    builder(subjectsList, replacementsList))));
  }
}
