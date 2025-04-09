///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsCoursesEn courses = TranslationsCoursesEn._(_root);
	late final TranslationsDialogEn dialog = TranslationsDialogEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsSelectionEn selection = TranslationsSelectionEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsSubjectEn subject = TranslationsSubjectEn._(_root);
	late final TranslationsWeekEn week = TranslationsWeekEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signIn => 'Sign in';
	String get signUp => 'Sign up';
	String get account => 'account';
	String get email => 'Email';
	String get name => 'Name';
	String get surname => 'Surname';
	String get password => 'Password';
	late final TranslationsAuthHelpersEn helpers = TranslationsAuthHelpersEn._(_root);
}

// Path: courses
class TranslationsCoursesEn {
	TranslationsCoursesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Courses';
}

// Path: dialog
class TranslationsDialogEn {
	TranslationsDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get wrong => 'Wrong';
	String get initials => 'Surname Name Patronymic';
	String get start => 'Start';
	String get end => 'End';
	String get number => 'Number of subject';
	List<String> get subject_mode => [
		'usual',
		'exam',
		'practice',
		'laboratory',
		'test',
	];
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'The field should not be empty';
	String get short => 'Too short';
	String get email => 'Email is not correct';
	String get used => 'A user with such an email already exists';
	String get wrong => 'Password or email don\'t match';
	String get digits => 'The field must not contain numbers';
	String get connection => 'No internet connection';
	String get already => 'There is such data in the database';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get today => 'Today';
	String get tomorrow => 'Tomorrow';
}

// Path: selection
class TranslationsSelectionEn {
	TranslationsSelectionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get city => 'city';
	String get institution => 'institution';
	String get group => 'group';
	String get teacher => 'Teacher';
	String get day => 'Day';
	String get date => 'Date';
	String get time => 'Time';
	String get add => 'Add';
	String get title => 'Title';
	String get shortTitle => 'Short title';
	late final TranslationsSelectionAddTextEn addText = TranslationsSelectionAddTextEn._(_root);
	String select({required SelectType context}) {
		switch (context) {
			case SelectType.city:
				return 'Select ${_root.selection.city}';
			case SelectType.institution:
				return 'Select ${_root.selection.institution}';
			case SelectType.group:
				return 'Select ${_root.selection.group}';
		}
	}
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get app_name => 'Daylist';
	String get scheduler => 'Change schedule';
	String get back => 'Back';
	String get cancel => 'Cancel';
	String get title => 'Settings';
	String get general => 'General';
	String get city => 'City';
	String get institution => 'Institution';
	String get group => 'Group';
	String get undergroup => 'Undergroup';
	String get not_set_name => 'Not set';
	String get theme => 'Theme';
	late final TranslationsSettingsThemeModeEn theme_mode = TranslationsSettingsThemeModeEn._(_root);
	String get pick_color => 'Pick color';
	String get primary_color => 'Main color';
	String get background_color => 'Background color';
	String get radius => 'Block angle';
	String get short_initials => 'Abbreviated name of the teacher';
	String get show_time => 'Show time';
	late final TranslationsSettingsSupportEn support = TranslationsSettingsSupportEn._(_root);
}

// Path: subject
class TranslationsSubjectEn {
	TranslationsSubjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Subject';
	String get classroom => 'classroom';
}

// Path: week
class TranslationsWeekEn {
	TranslationsWeekEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'week';
	List<String> get isEven => [
		'Even ${_root.week.title}',
		'Odd ${_root.week.title}',
		'Regular ${_root.week.title}',
	];
	late final TranslationsWeekDaysEn days = TranslationsWeekDaysEn._(_root);
}

// Path: auth.helpers
class TranslationsAuthHelpersEn {
	TranslationsAuthHelpersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthHelpersTitlesEn titles = TranslationsAuthHelpersTitlesEn._(_root);
	TextSpan signUp({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account? '),
		tapHere('Sign up'),
	]);
}

// Path: selection.addText
class TranslationsSelectionAddTextEn {
	TranslationsSelectionAddTextEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	TextSpan city({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		TextSpan(text: 'There is no your ${_root.selection.city}? '),
		tapHere(_root.selection.add),
	]);
	TextSpan institution({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		TextSpan(text: 'There is no your ${_root.selection.institution}? '),
		tapHere(_root.selection.add),
	]);
	TextSpan group({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		TextSpan(text: 'There is no your ${_root.selection.group}? '),
		tapHere(_root.selection.add),
	]);
}

// Path: settings.theme_mode
class TranslationsSettingsThemeModeEn {
	TranslationsSettingsThemeModeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get light => 'Light';
	String get dark => 'Dark';
}

// Path: settings.support
class TranslationsSettingsSupportEn {
	TranslationsSettingsSupportEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get questions => 'Write questions and suggestions in Telegram:';
	String get tag => 'studbin';
	late final TranslationsSettingsSupportMoneyEn money = TranslationsSettingsSupportMoneyEn._(_root);
}

// Path: week.days
class TranslationsWeekDaysEn {
	TranslationsWeekDaysEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get short => [
		'Mo',
		'Tu',
		'We',
		'Th',
		'Fr',
		'Sa',
		'Su',
	];
	List<String> get full => [
		'Monday',
		'Tuesday',
		'Wednesday',
		'Thursday',
		'Friday',
		'Saturday',
		'Sunday',
	];
}

// Path: auth.helpers.titles
class TranslationsAuthHelpersTitlesEn {
	TranslationsAuthHelpersTitlesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signIn => 'Sign in to your account';
	String get signUp => 'Create your account';
}

// Path: settings.support.money
class TranslationsSettingsSupportMoneyEn {
	TranslationsSettingsSupportMoneyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Support the author for project development and server payment';
	String get url => 'https://yoomoney.ru/to/4100117575409230';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.signIn': return 'Sign in';
			case 'auth.signUp': return 'Sign up';
			case 'auth.account': return 'account';
			case 'auth.email': return 'Email';
			case 'auth.name': return 'Name';
			case 'auth.surname': return 'Surname';
			case 'auth.password': return 'Password';
			case 'auth.helpers.titles.signIn': return 'Sign in to your account';
			case 'auth.helpers.titles.signUp': return 'Create your account';
			case 'auth.helpers.signUp': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Don\'t have an account? '),
				tapHere('Sign up'),
			]);
			case 'courses.title': return 'Courses';
			case 'dialog.wrong': return 'Wrong';
			case 'dialog.initials': return 'Surname Name Patronymic';
			case 'dialog.start': return 'Start';
			case 'dialog.end': return 'End';
			case 'dialog.number': return 'Number of subject';
			case 'dialog.subject_mode.0': return 'usual';
			case 'dialog.subject_mode.1': return 'exam';
			case 'dialog.subject_mode.2': return 'practice';
			case 'dialog.subject_mode.3': return 'laboratory';
			case 'dialog.subject_mode.4': return 'test';
			case 'errors.empty': return 'The field should not be empty';
			case 'errors.short': return 'Too short';
			case 'errors.email': return 'Email is not correct';
			case 'errors.used': return 'A user with such an email already exists';
			case 'errors.wrong': return 'Password or email don\'t match';
			case 'errors.digits': return 'The field must not contain numbers';
			case 'errors.connection': return 'No internet connection';
			case 'errors.already': return 'There is such data in the database';
			case 'home.today': return 'Today';
			case 'home.tomorrow': return 'Tomorrow';
			case 'selection.city': return 'city';
			case 'selection.institution': return 'institution';
			case 'selection.group': return 'group';
			case 'selection.teacher': return 'Teacher';
			case 'selection.day': return 'Day';
			case 'selection.date': return 'Date';
			case 'selection.time': return 'Time';
			case 'selection.add': return 'Add';
			case 'selection.title': return 'Title';
			case 'selection.shortTitle': return 'Short title';
			case 'selection.addText.city': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				TextSpan(text: 'There is no your ${_root.selection.city}? '),
				tapHere(_root.selection.add),
			]);
			case 'selection.addText.institution': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				TextSpan(text: 'There is no your ${_root.selection.institution}? '),
				tapHere(_root.selection.add),
			]);
			case 'selection.addText.group': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				TextSpan(text: 'There is no your ${_root.selection.group}? '),
				tapHere(_root.selection.add),
			]);
			case 'selection.select': return ({required SelectType context}) {
				switch (context) {
					case SelectType.city:
						return 'Select ${_root.selection.city}';
					case SelectType.institution:
						return 'Select ${_root.selection.institution}';
					case SelectType.group:
						return 'Select ${_root.selection.group}';
				}
			};
			case 'settings.app_name': return 'Daylist';
			case 'settings.scheduler': return 'Change schedule';
			case 'settings.back': return 'Back';
			case 'settings.cancel': return 'Cancel';
			case 'settings.title': return 'Settings';
			case 'settings.general': return 'General';
			case 'settings.city': return 'City';
			case 'settings.institution': return 'Institution';
			case 'settings.group': return 'Group';
			case 'settings.undergroup': return 'Undergroup';
			case 'settings.not_set_name': return 'Not set';
			case 'settings.theme': return 'Theme';
			case 'settings.theme_mode.light': return 'Light';
			case 'settings.theme_mode.dark': return 'Dark';
			case 'settings.pick_color': return 'Pick color';
			case 'settings.primary_color': return 'Main color';
			case 'settings.background_color': return 'Background color';
			case 'settings.radius': return 'Block angle';
			case 'settings.short_initials': return 'Abbreviated name of the teacher';
			case 'settings.show_time': return 'Show time';
			case 'settings.support.questions': return 'Write questions and suggestions in Telegram:';
			case 'settings.support.tag': return 'studbin';
			case 'settings.support.money.title': return 'Support the author for project development and server payment';
			case 'settings.support.money.url': return 'https://yoomoney.ru/to/4100117575409230';
			case 'subject.title': return 'Subject';
			case 'subject.classroom': return 'classroom';
			case 'week.title': return 'week';
			case 'week.isEven.0': return 'Even ${_root.week.title}';
			case 'week.isEven.1': return 'Odd ${_root.week.title}';
			case 'week.isEven.2': return 'Regular ${_root.week.title}';
			case 'week.days.short.0': return 'Mo';
			case 'week.days.short.1': return 'Tu';
			case 'week.days.short.2': return 'We';
			case 'week.days.short.3': return 'Th';
			case 'week.days.short.4': return 'Fr';
			case 'week.days.short.5': return 'Sa';
			case 'week.days.short.6': return 'Su';
			case 'week.days.full.0': return 'Monday';
			case 'week.days.full.1': return 'Tuesday';
			case 'week.days.full.2': return 'Wednesday';
			case 'week.days.full.3': return 'Thursday';
			case 'week.days.full.4': return 'Friday';
			case 'week.days.full.5': return 'Saturday';
			case 'week.days.full.6': return 'Sunday';
			default: return null;
		}
	}
}

