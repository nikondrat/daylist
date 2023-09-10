import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';

class Subsection {
  final Function()? onTap;
  final Icon? icon;
  final String title;
  final List<Widget>? trailing;

  Subsection({this.onTap, this.icon, required this.title, this.trailing});
}

class SubsectionWidget extends StatelessWidget {
  final Subsection subsection;

  const SubsectionWidget({
    super.key,
    required this.subsection,
  });

  @override
  Widget build(BuildContext context) {
    return _Body(subsection: subsection);
  }
}

class _Body extends HookConsumerWidget {
  final Subsection subsection;

  const _Body({
    Key? key,
    required this.subsection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        onTap: subsection.onTap,
        leading: subsection.icon,
        title: Text(subsection.title),
        minLeadingWidth: 0,
        iconColor: context.color.primaryColor,
        trailing: subsection.trailing != null
            ? Row(
                mainAxisSize: MainAxisSize.min, children: subsection.trailing!)
            : null);
  }
}



// class _Delete extends HookConsumerWidget {
//   final SubsectionSubject subject;
//   const _Delete({
//     required this.subject,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final Group group = ref.watch(settingsProvider).group!;

//     return isChangeSchedule && subject.isHomeView
//         ? IconButton(
//             onPressed: () async {
//               final ConnectivityResult connectivityResult =
//                   await Connectivity().checkConnectivity();

//               if (connectivityResult == ConnectivityResult.mobile ||
//                   connectivityResult == ConnectivityResult.wifi) {
//                 final User user =
//                     await AuthDataRepository(Dependencies().getIt.get())
//                         .getUser();

//                 if (subject.replacement != null) {
//                   ReplacementDataRepository(Dependencies().getIt.get())
//                       .deleteReplacement(
//                           body: DeleteReplacementBody(
//                               databaseId: dotenv.env['const databaseId']!,
//                               collectionId:
//                                   dotenv.env['const replacementsCollectionId']!,
//                               id: subject.replacement!.id));
//                 } else {
//                   ReplacementDataRepository(Dependencies().getIt.get())
//                       .addReplacement(
//                           body: AddReplacementBody(
//                               databaseId: dotenv.env['const databaseId']!,
//                               collectionId:
//                                   dotenv.env['const replacementsCollectionId']!,
//                               replacement: Replacement(
//                                   id: ID.custom(Generator.generateId()),
//                                   time: subject.time,
//                                   teacher: subject.teacher,
//                                   groupId: group.id,
//                                   date: subject.dateTime!,
//                                   mode: ReplacementMode.cancel,
//                                   undergroup: null,
//                                   createdBy: user.$id)));
//                 }
//                 ref.invalidate(replacementsProvider);
//               } else {
//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(t.errors.connection),
//                       backgroundColor: Colors.red));
//                 }
//               }
//             },
//             splashRadius: 20,
//             icon: const Icon(Icons.delete))
//         : const SizedBox.shrink();
//   }
// }
