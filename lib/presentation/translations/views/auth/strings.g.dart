/// Generated file. Do not edit.
///
/// Original: lib/presentation/translations/views/auth
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 32 (16 per locale)
///
/// Built on 2023-08-28 at 15:41 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
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
_StringsEn get t => LocaleSettings.instance.currentTranslations;

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

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
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
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get signIn => 'Sign in';
	String get signUp => 'Sign up';
	String get account => 'account';
	String get email => 'Email';
	String get name => 'Name';
	String get surname => 'Surname';
	String get password => 'Password';
	late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	late final _StringsHelpersEn helpers = _StringsHelpersEn._(_root);
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get empty => 'The field should not be empty';
	String get short => 'Too short';
	String get email => 'Email is not correct';
	String get used => 'A user with such an email already exists';
	String get wrong => 'Password or email don\'t match';
	String get digits => 'The field must not contain numbers';
}

// Path: helpers
class _StringsHelpersEn {
	_StringsHelpersEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsHelpersTitlesEn titles = _StringsHelpersTitlesEn._(_root);
	TextSpan signUp({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account? '),
		tapHere('Sign up'),
	]);
}

// Path: helpers.titles
class _StringsHelpersTitlesEn {
	_StringsHelpersTitlesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get signIn => 'Sign in to your account';
	String get signUp => 'Create your account';
}

// Path: <root>
class _StringsRu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override String get signIn => 'Вход';
	@override String get signUp => 'Зарегистрироваться';
	@override String get account => 'аккаунт';
	@override String get email => 'Почта';
	@override String get name => 'Имя';
	@override String get surname => 'Фамилия';
	@override String get password => 'Пароль';
	@override late final _StringsErrorsRu errors = _StringsErrorsRu._(_root);
	@override late final _StringsHelpersRu helpers = _StringsHelpersRu._(_root);
}

// Path: errors
class _StringsErrorsRu implements _StringsErrorsEn {
	_StringsErrorsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Поле не должно быть пустым';
	@override String get short => 'Слишком короткий';
	@override String get email => 'Почта введена не правильно';
	@override String get used => 'Пользователь с такой почтой уже существует';
	@override String get wrong => 'Пароль или почта введены не верно';
	@override String get digits => 'Поле не должно содержать цифры';
}

// Path: helpers
class _StringsHelpersRu implements _StringsHelpersEn {
	_StringsHelpersRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsHelpersTitlesRu titles = _StringsHelpersTitlesRu._(_root);
	@override TextSpan signUp({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет аккаунта? '),
		tapHere('Зарегистрироваться'),
	]);
}

// Path: helpers.titles
class _StringsHelpersTitlesRu implements _StringsHelpersTitlesEn {
	_StringsHelpersTitlesRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Вход в аккаунт';
	@override String get signUp => 'Создай новый аккаунт';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'signIn': return 'Sign in';
			case 'signUp': return 'Sign up';
			case 'account': return 'account';
			case 'email': return 'Email';
			case 'name': return 'Name';
			case 'surname': return 'Surname';
			case 'password': return 'Password';
			case 'errors.empty': return 'The field should not be empty';
			case 'errors.short': return 'Too short';
			case 'errors.email': return 'Email is not correct';
			case 'errors.used': return 'A user with such an email already exists';
			case 'errors.wrong': return 'Password or email don\'t match';
			case 'errors.digits': return 'The field must not contain numbers';
			case 'helpers.titles.signIn': return 'Sign in to your account';
			case 'helpers.titles.signUp': return 'Create your account';
			case 'helpers.signUp': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Don\'t have an account? '),
				tapHere('Sign up'),
			]);
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'signIn': return 'Вход';
			case 'signUp': return 'Зарегистрироваться';
			case 'account': return 'аккаунт';
			case 'email': return 'Почта';
			case 'name': return 'Имя';
			case 'surname': return 'Фамилия';
			case 'password': return 'Пароль';
			case 'errors.empty': return 'Поле не должно быть пустым';
			case 'errors.short': return 'Слишком короткий';
			case 'errors.email': return 'Почта введена не правильно';
			case 'errors.used': return 'Пользователь с такой почтой уже существует';
			case 'errors.wrong': return 'Пароль или почта введены не верно';
			case 'errors.digits': return 'Поле не должно содержать цифры';
			case 'helpers.titles.signIn': return 'Вход в аккаунт';
			case 'helpers.titles.signUp': return 'Создай новый аккаунт';
			case 'helpers.signUp': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет аккаунта? '),
				tapHere('Зарегистрироваться'),
			]);
			default: return null;
		}
	}
}
