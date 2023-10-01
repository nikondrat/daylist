import 'package:daylist/data/api/request/put/put_vote_body.dart';
import 'package:daylist/data/repository/voiting_data_repository.dart';
import 'package:daylist/domain/model/voiting.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/voitings/voitings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/text.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

class VoitingItemWidget extends StatelessWidget {
  final Voiting voiting;
  const VoitingItemWidget({super.key, required this.voiting});

  @override
  Widget build(BuildContext context) {
    String subtitle = '';
    String title = '';

    if (voiting.time != null) {
      title = t.selection.time;
      subtitle = '${voiting.time!.start}:${voiting.time!.end}';
    } else if (voiting.title != null) {
      title = t.selection.title;
      subtitle = voiting.title!.title;
    } else if (voiting.teacher != null) {
      title = t.selection.teacher;
      subtitle = voiting.teacher!.shortInitials();
    } else if (voiting.subject != null) {
      title = t.subject.title;
      subtitle = voiting.subject!.teacher.title.title;
    } else if (voiting.classroom != null) {
      title = t.subject.classroom;
      subtitle = voiting.classroom!.title;
    } else if (voiting.replacement != null) {
      title = t.subject.replacement;
      subtitle = voiting.replacement!.teacher.title.title;
    }

    return ListTile(
        titleTextStyle: context.text.mediumText,
        subtitleTextStyle: context.text.largeText,
        leading: _Leading(type: voiting.type),
        title: Text(title.capitalize()),
        subtitle: Text(subtitle),
        trailing: _Trailing(
            documentId: voiting.id, pros: voiting.pros, cons: voiting.cons));
  }
}

class _Leading extends HookConsumerWidget {
  final VoitingType type;
  const _Leading({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color? color = ref.watch(primaryColorProvider);
    final double radius = ref.watch(radiusProvider);
    final Widget item = switch (type) {
      VoitingType.post => const Icon(Icons.add),
      VoitingType.put => const Icon(Icons.edit),
      VoitingType.delete => const Icon(Icons.delete_outline),
    };

    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius / 2),
            border: Border.all(color: color ?? context.color.primaryColor)),
        child: Padding(
            padding: const EdgeInsets.all(Insets.small / 4), child: item));
  }
}

class _Trailing extends HookConsumerWidget {
  final String documentId;
  final List pros;
  final List cons;
  const _Trailing(
      {required this.documentId, required this.pros, required this.cons});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.watch(settingsProvider).userId;
    final int prosCount = pros.length;
    final int consCount = cons.length;

    Future change(bool isUserPros) async {
      final bool userVotedPros = pros.contains(userId);
      final bool userVotedCons = cons.contains(userId);

      if (isUserPros) {
        if (!userVotedPros) {
          pros.add(userId);
          cons.remove(userId);
        } else {
          pros.remove(userId);
        }
      } else {
        if (!userVotedCons) {
          cons.add(userId);
          pros.remove(userId);
        } else {
          cons.remove(userId);
        }
      }
      VoitingDataRepository(Dependencies().getIt.get())
          .change(
              body: PutVoteBody(
                  databaseId: dotenv.env['databaseId']!,
                  collectionId: dotenv.env['voitingCollectionId']!,
                  documentId: documentId,
                  pros: pros,
                  cons: cons))
          .then((value) => ref.invalidate(voitingsProvider));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$prosCount vs $consCount'),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: const EdgeInsets.only(right: Insets.small),
              child: GestureDetector(
                  onTap: () => change(true),
                  child: const Icon(UniconsLine.thumbs_up))),
          GestureDetector(
              onTap: () => change(false),
              child: const Icon(UniconsLine.thumbs_down))
        ])
      ],
    );
  }
}
