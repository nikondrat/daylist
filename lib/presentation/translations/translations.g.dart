/// Generated file. Do not edit.
///
/// Original: lib/presentation/translations/dialog
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 162 (81 per locale)
///
/// Built on 2023-08-30 at 14:24 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
	en(languageCode: 'en', build: _TranslationsEn.build),
	ru(languageCode: 'ru', build: _TranslationsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _TranslationsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_TranslationsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _TranslationsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_TranslationsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// context enums

enum SelectType {
	city,
	institution,
	group,
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsDialogEn dialog = _TranslationsDialogEn._(_root);
	late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
	late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	late final _TranslationsSelectionEn selection = _TranslationsSelectionEn._(_root);
	late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(_root);
	late final _TranslationsWeekEn week = _TranslationsWeekEn._(_root);
	late final _TranslationsSubjectEn subject = _TranslationsSubjectEn._(_root);
}

// Path: dialog
class _TranslationsDialogEn {
	_TranslationsDialogEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

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

// Path: auth
class _TranslationsAuthEn {
	_TranslationsAuthEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get signIn => 'Sign in';
	String get signUp => 'Sign up';
	String get account => 'account';
	String get email => 'Email';
	String get name => 'Name';
	String get surname => 'Surname';
	String get password => 'Password';
	late final _TranslationsAuthErrorsEn errors = _TranslationsAuthErrorsEn._(_root);
	late final _TranslationsAuthHelpersEn helpers = _TranslationsAuthHelpersEn._(_root);
}

// Path: home
class _TranslationsHomeEn {
	_TranslationsHomeEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get today => 'Today';
	String get tomorrow => 'Tomorrow';
}

// Path: selection
class _TranslationsSelectionEn {
	_TranslationsSelectionEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get city => 'city';
	String get institution => 'institution';
	String get group => 'group';
	String get teacher => 'Teacher';
	String get day => 'Day';
	String get time => 'Time';
	String get add => 'Add';
	String get title => 'Title';
	String get shortTitle => 'Short title';
	late final _TranslationsSelectionAddTextEn addText = _TranslationsSelectionAddTextEn._(_root);
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
class _TranslationsSettingsEn {
	_TranslationsSettingsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get app_name => 'daylist';
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
	late final _TranslationsSettingsThemeModeEn theme_mode = _TranslationsSettingsThemeModeEn._(_root);
	String get pick_color => 'Pick color';
	String get primary_color => 'Main color';
	String get background_color => 'Background color';
	String get radius => 'Block angle';
	String get short_initials => 'Abbreviated name of the teacher';
	String get show_time => 'Show time';
}

// Path: week
class _TranslationsWeekEn {
	_TranslationsWeekEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'week';
	List<String> get isEven => [
		'Even ${_root.week.title}',
		'Odd ${_root.week.title}',
		'Regular ${_root.week.title}',
	];
	late final _TranslationsWeekDaysEn days = _TranslationsWeekDaysEn._(_root);
}

// Path: subject
class _TranslationsSubjectEn {
	_TranslationsSubjectEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get classroom => 'classroom';
}

// Path: auth.errors
class _TranslationsAuthErrorsEn {
	_TranslationsAuthErrorsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get empty => 'The field should not be empty';
	String get short => 'Too short';
	String get email => 'Email is not correct';
	String get used => 'A user with such an email already exists';
	String get wrong => 'Password or email don\'t match';
	String get digits => 'The field must not contain numbers';
}

// Path: auth.helpers
class _TranslationsAuthHelpersEn {
	_TranslationsAuthHelpersEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	late final _TranslationsAuthHelpersTitlesEn titles = _TranslationsAuthHelpersTitlesEn._(_root);
	TextSpan signUp({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account? '),
		tapHere('Sign up'),
	]);
}

// Path: selection.addText
class _TranslationsSelectionAddTextEn {
	_TranslationsSelectionAddTextEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	TextSpan city({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		TextSpan(text: 'There is no your ${_root.selection.city}? '),
		tapHere('${_root.selection.add}'),
	]);
	TextSpan institution({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		TextSpan(text: 'There is no your ${_root.selection.institution}? '),
		tapHere('${_root.selection.add}'),
	]);
	TextSpan group({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		TextSpan(text: 'There is no your ${_root.selection.group}? '),
		tapHere('${_root.selection.add}'),
	]);
}

// Path: settings.theme_mode
class _TranslationsSettingsThemeModeEn {
	_TranslationsSettingsThemeModeEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get light => 'Light';
	String get dark => 'Dark';
}

// Path: week.days
class _TranslationsWeekDaysEn {
	_TranslationsWeekDaysEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

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
class _TranslationsAuthHelpersTitlesEn {
	_TranslationsAuthHelpersTitlesEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get signIn => 'Sign in to your account';
	String get signUp => 'Create your account';
}

// Path: <root>
class _TranslationsRu implements _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsDialogRu dialog = _TranslationsDialogRu._(_root);
	@override late final _TranslationsAuthRu auth = _TranslationsAuthRu._(_root);
	@override late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	@override late final _TranslationsSelectionRu selection = _TranslationsSelectionRu._(_root);
	@override late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
	@override late final _TranslationsWeekRu week = _TranslationsWeekRu._(_root);
	@override late final _TranslationsSubjectRu subject = _TranslationsSubjectRu._(_root);
}

// Path: dialog
class _TranslationsDialogRu implements _TranslationsDialogEn {
	_TranslationsDialogRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get wrong => 'Неправильно';
	@override String get initials => 'Фамилия Имя Отчество';
	@override String get start => 'Начало';
	@override String get end => 'Конец';
	@override String get number => 'Номер пары';
	@override List<String> get subject_mode => [
		'Обычный',
		'Экзамен',
		'Практика',
		'Лабораторная',
		'Тест',
	];
}

// Path: auth
class _TranslationsAuthRu implements _TranslationsAuthEn {
	_TranslationsAuthRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Вход';
	@override String get signUp => 'Зарегистрироваться';
	@override String get account => 'аккаунт';
	@override String get email => 'Почта';
	@override String get name => 'Имя';
	@override String get surname => 'Фамилия';
	@override String get password => 'Пароль';
	@override late final _TranslationsAuthErrorsRu errors = _TranslationsAuthErrorsRu._(_root);
	@override late final _TranslationsAuthHelpersRu helpers = _TranslationsAuthHelpersRu._(_root);
}

// Path: home
class _TranslationsHomeRu implements _TranslationsHomeEn {
	_TranslationsHomeRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get today => 'Сегодня';
	@override String get tomorrow => 'Завтра';
}

// Path: selection
class _TranslationsSelectionRu implements _TranslationsSelectionEn {
	_TranslationsSelectionRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get city => 'город';
	@override String get institution => 'учреждение';
	@override String get group => 'группа';
	@override String get teacher => 'Преподаватель';
	@override String get day => 'День';
	@override String get time => 'Время';
	@override String get add => 'Добавить';
	@override String get title => 'Название';
	@override String get shortTitle => 'Короткое название';
	@override late final _TranslationsSelectionAddTextRu addText = _TranslationsSelectionAddTextRu._(_root);
	@override String select({required SelectType context}) {
		switch (context) {
			case SelectType.city:
				return 'Выбери ${_root.selection.city}';
			case SelectType.institution:
				return 'Выбери ${_root.selection.institution}';
			case SelectType.group:
				return 'Выбери группу';
		}
	}
}

// Path: settings
class _TranslationsSettingsRu implements _TranslationsSettingsEn {
	_TranslationsSettingsRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get app_name => 'daylist';
	@override String get back => 'Назад';
	@override String get cancel => 'Отмена';
	@override String get title => 'Настройки';
	@override String get general => 'Общие';
	@override String get city => 'Город';
	@override String get institution => 'Учреждение';
	@override String get group => 'Группа';
	@override String get undergroup => 'Подгруппа';
	@override String get not_set_name => 'Не задано';
	@override String get theme => 'Тема';
	@override late final _TranslationsSettingsThemeModeRu theme_mode = _TranslationsSettingsThemeModeRu._(_root);
	@override String get pick_color => 'Выбери цвет';
	@override String get primary_color => 'Главный цвет';
	@override String get background_color => 'Цвет фона';
	@override String get radius => 'Угол блоков';
	@override String get short_initials => 'Сокращённое имя преподавателя';
	@override String get show_time => 'Показывать время';
}

// Path: week
class _TranslationsWeekRu implements _TranslationsWeekEn {
	_TranslationsWeekRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'неделя';
	@override List<String> get isEven => [
		'Чётная ${_root.week.title}',
		'Нечётная ${_root.week.title}',
		'Обычная ${_root.week.title}',
	];
	@override late final _TranslationsWeekDaysRu days = _TranslationsWeekDaysRu._(_root);
}

// Path: subject
class _TranslationsSubjectRu implements _TranslationsSubjectEn {
	_TranslationsSubjectRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get classroom => 'кабинет';
}

// Path: auth.errors
class _TranslationsAuthErrorsRu implements _TranslationsAuthErrorsEn {
	_TranslationsAuthErrorsRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Поле не должно быть пустым';
	@override String get short => 'Слишком короткий';
	@override String get email => 'Почта введена не правильно';
	@override String get used => 'Пользователь с такой почтой уже существует';
	@override String get wrong => 'Пароль или почта введены не верно';
	@override String get digits => 'Поле не должно содержать цифры';
}

// Path: auth.helpers
class _TranslationsAuthHelpersRu implements _TranslationsAuthHelpersEn {
	_TranslationsAuthHelpersRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthHelpersTitlesRu titles = _TranslationsAuthHelpersTitlesRu._(_root);
	@override TextSpan signUp({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет аккаунта? '),
		tapHere('Зарегистрироваться'),
	]);
}

// Path: selection.addText
class _TranslationsSelectionAddTextRu implements _TranslationsSelectionAddTextEn {
	_TranslationsSelectionAddTextRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override TextSpan city({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет твоего города? '),
		tapHere('${_root.selection.add}'),
	]);
	@override TextSpan institution({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет твоего учреждения? '),
		tapHere('${_root.selection.add}'),
	]);
	@override TextSpan group({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет твоей группы? '),
		tapHere('${_root.selection.add}'),
	]);
}

// Path: settings.theme_mode
class _TranslationsSettingsThemeModeRu implements _TranslationsSettingsThemeModeEn {
	_TranslationsSettingsThemeModeRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get light => 'Светлая';
	@override String get dark => 'Тёмная';
}

// Path: week.days
class _TranslationsWeekDaysRu implements _TranslationsWeekDaysEn {
	_TranslationsWeekDaysRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override List<String> get short => [
		'Пн',
		'Вт',
		'Ср',
		'Чт',
		'Пт',
		'Сб',
		'Вс',
	];
	@override List<String> get full => [
		'Понедельник',
		'Вторник',
		'Среда',
		'Четверг',
		'Пятница',
		'Суббота',
		'Воскресенье',
	];
}

// Path: auth.helpers.titles
class _TranslationsAuthHelpersTitlesRu implements _TranslationsAuthHelpersTitlesEn {
	_TranslationsAuthHelpersTitlesRu._(this._root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Вход в аккаунт';
	@override String get signUp => 'Создай новый аккаунт';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
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
			case 'auth.signIn': return 'Sign in';
			case 'auth.signUp': return 'Sign up';
			case 'auth.account': return 'account';
			case 'auth.email': return 'Email';
			case 'auth.name': return 'Name';
			case 'auth.surname': return 'Surname';
			case 'auth.password': return 'Password';
			case 'auth.errors.empty': return 'The field should not be empty';
			case 'auth.errors.short': return 'Too short';
			case 'auth.errors.email': return 'Email is not correct';
			case 'auth.errors.used': return 'A user with such an email already exists';
			case 'auth.errors.wrong': return 'Password or email don\'t match';
			case 'auth.errors.digits': return 'The field must not contain numbers';
			case 'auth.helpers.titles.signIn': return 'Sign in to your account';
			case 'auth.helpers.titles.signUp': return 'Create your account';
			case 'auth.helpers.signUp': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Don\'t have an account? '),
				tapHere('Sign up'),
			]);
			case 'home.today': return 'Today';
			case 'home.tomorrow': return 'Tomorrow';
			case 'selection.city': return 'city';
			case 'selection.institution': return 'institution';
			case 'selection.group': return 'group';
			case 'selection.teacher': return 'Teacher';
			case 'selection.day': return 'Day';
			case 'selection.time': return 'Time';
			case 'selection.add': return 'Add';
			case 'selection.title': return 'Title';
			case 'selection.shortTitle': return 'Short title';
			case 'selection.addText.city': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				TextSpan(text: 'There is no your ${_root.selection.city}? '),
				tapHere('${_root.selection.add}'),
			]);
			case 'selection.addText.institution': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				TextSpan(text: 'There is no your ${_root.selection.institution}? '),
				tapHere('${_root.selection.add}'),
			]);
			case 'selection.addText.group': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				TextSpan(text: 'There is no your ${_root.selection.group}? '),
				tapHere('${_root.selection.add}'),
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
			case 'settings.app_name': return 'daylist';
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
			case 'subject.classroom': return 'classroom';
			default: return null;
		}
	}
}

extension on _TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'dialog.wrong': return 'Неправильно';
			case 'dialog.initials': return 'Фамилия Имя Отчество';
			case 'dialog.start': return 'Начало';
			case 'dialog.end': return 'Конец';
			case 'dialog.number': return 'Номер пары';
			case 'dialog.subject_mode.0': return 'Обычный';
			case 'dialog.subject_mode.1': return 'Экзамен';
			case 'dialog.subject_mode.2': return 'Практика';
			case 'dialog.subject_mode.3': return 'Лабораторная';
			case 'dialog.subject_mode.4': return 'Тест';
			case 'auth.signIn': return 'Вход';
			case 'auth.signUp': return 'Зарегистрироваться';
			case 'auth.account': return 'аккаунт';
			case 'auth.email': return 'Почта';
			case 'auth.name': return 'Имя';
			case 'auth.surname': return 'Фамилия';
			case 'auth.password': return 'Пароль';
			case 'auth.errors.empty': return 'Поле не должно быть пустым';
			case 'auth.errors.short': return 'Слишком короткий';
			case 'auth.errors.email': return 'Почта введена не правильно';
			case 'auth.errors.used': return 'Пользователь с такой почтой уже существует';
			case 'auth.errors.wrong': return 'Пароль или почта введены не верно';
			case 'auth.errors.digits': return 'Поле не должно содержать цифры';
			case 'auth.helpers.titles.signIn': return 'Вход в аккаунт';
			case 'auth.helpers.titles.signUp': return 'Создай новый аккаунт';
			case 'auth.helpers.signUp': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет аккаунта? '),
				tapHere('Зарегистрироваться'),
			]);
			case 'home.today': return 'Сегодня';
			case 'home.tomorrow': return 'Завтра';
			case 'selection.city': return 'город';
			case 'selection.institution': return 'учреждение';
			case 'selection.group': return 'группа';
			case 'selection.teacher': return 'Преподаватель';
			case 'selection.day': return 'День';
			case 'selection.time': return 'Время';
			case 'selection.add': return 'Добавить';
			case 'selection.title': return 'Название';
			case 'selection.shortTitle': return 'Короткое название';
			case 'selection.addText.city': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет твоего города? '),
				tapHere('${_root.selection.add}'),
			]);
			case 'selection.addText.institution': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет твоего учреждения? '),
				tapHere('${_root.selection.add}'),
			]);
			case 'selection.addText.group': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет твоей группы? '),
				tapHere('${_root.selection.add}'),
			]);
			case 'selection.select': return ({required SelectType context}) {
				switch (context) {
					case SelectType.city:
						return 'Выбери ${_root.selection.city}';
					case SelectType.institution:
						return 'Выбери ${_root.selection.institution}';
					case SelectType.group:
						return 'Выбери группу';
				}
			};
			case 'settings.app_name': return 'daylist';
			case 'settings.back': return 'Назад';
			case 'settings.cancel': return 'Отмена';
			case 'settings.title': return 'Настройки';
			case 'settings.general': return 'Общие';
			case 'settings.city': return 'Город';
			case 'settings.institution': return 'Учреждение';
			case 'settings.group': return 'Группа';
			case 'settings.undergroup': return 'Подгруппа';
			case 'settings.not_set_name': return 'Не задано';
			case 'settings.theme': return 'Тема';
			case 'settings.theme_mode.light': return 'Светлая';
			case 'settings.theme_mode.dark': return 'Тёмная';
			case 'settings.pick_color': return 'Выбери цвет';
			case 'settings.primary_color': return 'Главный цвет';
			case 'settings.background_color': return 'Цвет фона';
			case 'settings.radius': return 'Угол блоков';
			case 'settings.short_initials': return 'Сокращённое имя преподавателя';
			case 'settings.show_time': return 'Показывать время';
			case 'week.title': return 'неделя';
			case 'week.isEven.0': return 'Чётная ${_root.week.title}';
			case 'week.isEven.1': return 'Нечётная ${_root.week.title}';
			case 'week.isEven.2': return 'Обычная ${_root.week.title}';
			case 'week.days.short.0': return 'Пн';
			case 'week.days.short.1': return 'Вт';
			case 'week.days.short.2': return 'Ср';
			case 'week.days.short.3': return 'Чт';
			case 'week.days.short.4': return 'Пт';
			case 'week.days.short.5': return 'Сб';
			case 'week.days.short.6': return 'Вс';
			case 'week.days.full.0': return 'Понедельник';
			case 'week.days.full.1': return 'Вторник';
			case 'week.days.full.2': return 'Среда';
			case 'week.days.full.3': return 'Четверг';
			case 'week.days.full.4': return 'Пятница';
			case 'week.days.full.5': return 'Суббота';
			case 'week.days.full.6': return 'Воскресенье';
			case 'subject.classroom': return 'кабинет';
			default: return null;
		}
	}
}
