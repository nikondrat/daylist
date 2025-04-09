///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAuthRu auth = _TranslationsAuthRu._(_root);
	@override late final _TranslationsCoursesRu courses = _TranslationsCoursesRu._(_root);
	@override late final _TranslationsDialogRu dialog = _TranslationsDialogRu._(_root);
	@override late final _TranslationsErrorsRu errors = _TranslationsErrorsRu._(_root);
	@override late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	@override late final _TranslationsSelectionRu selection = _TranslationsSelectionRu._(_root);
	@override late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
	@override late final _TranslationsSubjectRu subject = _TranslationsSubjectRu._(_root);
	@override late final _TranslationsWeekRu week = _TranslationsWeekRu._(_root);
}

// Path: auth
class _TranslationsAuthRu implements TranslationsAuthEn {
	_TranslationsAuthRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Вход';
	@override String get signUp => 'Зарегистрироваться';
	@override String get account => 'аккаунт';
	@override String get email => 'Почта';
	@override String get name => 'Имя';
	@override String get surname => 'Фамилия';
	@override String get password => 'Пароль';
	@override late final _TranslationsAuthHelpersRu helpers = _TranslationsAuthHelpersRu._(_root);
}

// Path: courses
class _TranslationsCoursesRu implements TranslationsCoursesEn {
	_TranslationsCoursesRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Курсы';
}

// Path: dialog
class _TranslationsDialogRu implements TranslationsDialogEn {
	_TranslationsDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

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

// Path: errors
class _TranslationsErrorsRu implements TranslationsErrorsEn {
	_TranslationsErrorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Поле не должно быть пустым';
	@override String get short => 'Слишком короткий';
	@override String get email => 'Почта введена не правильно';
	@override String get used => 'Пользователь с такой почтой уже существует';
	@override String get wrong => 'Пароль или почта введены не верно';
	@override String get digits => 'Поле не должно содержать цифры';
	@override String get connection => 'Нет интернет соединения.';
	@override String get already => 'В базе есть такие данные';
}

// Path: home
class _TranslationsHomeRu implements TranslationsHomeEn {
	_TranslationsHomeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get today => 'Сегодня';
	@override String get tomorrow => 'Завтра';
}

// Path: selection
class _TranslationsSelectionRu implements TranslationsSelectionEn {
	_TranslationsSelectionRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get city => 'город';
	@override String get institution => 'учреждение';
	@override String get group => 'группа';
	@override String get teacher => 'Преподаватель';
	@override String get day => 'День';
	@override String get date => 'Дата';
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
class _TranslationsSettingsRu implements TranslationsSettingsEn {
	_TranslationsSettingsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get app_name => 'Daylist';
	@override String get scheduler => 'Изменить расписание';
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
	@override late final _TranslationsSettingsSupportRu support = _TranslationsSettingsSupportRu._(_root);
}

// Path: subject
class _TranslationsSubjectRu implements TranslationsSubjectEn {
	_TranslationsSubjectRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предмет';
	@override String get classroom => 'кабинет';
}

// Path: week
class _TranslationsWeekRu implements TranslationsWeekEn {
	_TranslationsWeekRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'неделя';
	@override List<String> get isEven => [
		'Чётная ${_root.week.title}',
		'Нечётная ${_root.week.title}',
		'Обычная ${_root.week.title}',
	];
	@override late final _TranslationsWeekDaysRu days = _TranslationsWeekDaysRu._(_root);
}

// Path: auth.helpers
class _TranslationsAuthHelpersRu implements TranslationsAuthHelpersEn {
	_TranslationsAuthHelpersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthHelpersTitlesRu titles = _TranslationsAuthHelpersTitlesRu._(_root);
	@override TextSpan signUp({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет аккаунта? '),
		tapHere('Зарегистрироваться'),
	]);
}

// Path: selection.addText
class _TranslationsSelectionAddTextRu implements TranslationsSelectionAddTextEn {
	_TranslationsSelectionAddTextRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override TextSpan city({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет твоего города? '),
		tapHere(_root.selection.add),
	]);
	@override TextSpan institution({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет твоего учреждения? '),
		tapHere(_root.selection.add),
	]);
	@override TextSpan group({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Нет твоей группы? '),
		tapHere(_root.selection.add),
	]);
}

// Path: settings.theme_mode
class _TranslationsSettingsThemeModeRu implements TranslationsSettingsThemeModeEn {
	_TranslationsSettingsThemeModeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get light => 'Светлая';
	@override String get dark => 'Тёмная';
}

// Path: settings.support
class _TranslationsSettingsSupportRu implements TranslationsSettingsSupportEn {
	_TranslationsSettingsSupportRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get questions => 'Вопросы и предложения пишите в Telegram:';
	@override String get tag => 'studbin';
	@override late final _TranslationsSettingsSupportMoneyRu money = _TranslationsSettingsSupportMoneyRu._(_root);
}

// Path: week.days
class _TranslationsWeekDaysRu implements TranslationsWeekDaysEn {
	_TranslationsWeekDaysRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

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
class _TranslationsAuthHelpersTitlesRu implements TranslationsAuthHelpersTitlesEn {
	_TranslationsAuthHelpersTitlesRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Вход в аккаунт';
	@override String get signUp => 'Создай новый аккаунт';
}

// Path: settings.support.money
class _TranslationsSettingsSupportMoneyRu implements TranslationsSettingsSupportMoneyEn {
	_TranslationsSettingsSupportMoneyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Поддержать автора на развитие проекта и оплату серверов';
	@override String get url => 'https://yoomoney.ru/to/4100117575409230';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.signIn': return 'Вход';
			case 'auth.signUp': return 'Зарегистрироваться';
			case 'auth.account': return 'аккаунт';
			case 'auth.email': return 'Почта';
			case 'auth.name': return 'Имя';
			case 'auth.surname': return 'Фамилия';
			case 'auth.password': return 'Пароль';
			case 'auth.helpers.titles.signIn': return 'Вход в аккаунт';
			case 'auth.helpers.titles.signUp': return 'Создай новый аккаунт';
			case 'auth.helpers.signUp': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет аккаунта? '),
				tapHere('Зарегистрироваться'),
			]);
			case 'courses.title': return 'Курсы';
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
			case 'errors.empty': return 'Поле не должно быть пустым';
			case 'errors.short': return 'Слишком короткий';
			case 'errors.email': return 'Почта введена не правильно';
			case 'errors.used': return 'Пользователь с такой почтой уже существует';
			case 'errors.wrong': return 'Пароль или почта введены не верно';
			case 'errors.digits': return 'Поле не должно содержать цифры';
			case 'errors.connection': return 'Нет интернет соединения.';
			case 'errors.already': return 'В базе есть такие данные';
			case 'home.today': return 'Сегодня';
			case 'home.tomorrow': return 'Завтра';
			case 'selection.city': return 'город';
			case 'selection.institution': return 'учреждение';
			case 'selection.group': return 'группа';
			case 'selection.teacher': return 'Преподаватель';
			case 'selection.day': return 'День';
			case 'selection.date': return 'Дата';
			case 'selection.time': return 'Время';
			case 'selection.add': return 'Добавить';
			case 'selection.title': return 'Название';
			case 'selection.shortTitle': return 'Короткое название';
			case 'selection.addText.city': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет твоего города? '),
				tapHere(_root.selection.add),
			]);
			case 'selection.addText.institution': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет твоего учреждения? '),
				tapHere(_root.selection.add),
			]);
			case 'selection.addText.group': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Нет твоей группы? '),
				tapHere(_root.selection.add),
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
			case 'settings.app_name': return 'Daylist';
			case 'settings.scheduler': return 'Изменить расписание';
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
			case 'settings.support.questions': return 'Вопросы и предложения пишите в Telegram:';
			case 'settings.support.tag': return 'studbin';
			case 'settings.support.money.title': return 'Поддержать автора на развитие проекта и оплату серверов';
			case 'settings.support.money.url': return 'https://yoomoney.ru/to/4100117575409230';
			case 'subject.title': return 'Предмет';
			case 'subject.classroom': return 'кабинет';
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
			default: return null;
		}
	}
}

