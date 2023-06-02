// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World`
  String get hello_world {
    return Intl.message(
      'Hello World',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Lanspire!`
  String get well_come_to_lanspire {
    return Intl.message(
      'Welcome to Lanspire!',
      name: 'well_come_to_lanspire',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get user_name {
    return Intl.message(
      'Username',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get class_room {
    return Intl.message(
      'Class',
      name: 'class_room',
      desc: '',
      args: [],
    );
  }

  /// `personal`
  String get personal {
    return Intl.message(
      'personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `class roster`
  String get class_roster {
    return Intl.message(
      'class roster',
      name: 'class_roster',
      desc: '',
      args: [],
    );
  }

  /// `In Process`
  String get in_process {
    return Intl.message(
      'In Process',
      name: 'in_process',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finish {
    return Intl.message(
      'Finished',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Informations`
  String get information {
    return Intl.message(
      'Informations',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message(
      'Course',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `Class Information`
  String get class_information {
    return Intl.message(
      'Class Information',
      name: 'class_information',
      desc: '',
      args: [],
    );
  }

  /// `Class name`
  String get class_name {
    return Intl.message(
      'Class name',
      name: 'class_name',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message(
      'Room',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get start_date {
    return Intl.message(
      'Start date',
      name: 'start_date',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get end_date {
    return Intl.message(
      'End date',
      name: 'end_date',
      desc: '',
      args: [],
    );
  }

  /// `Class time`
  String get class_time {
    return Intl.message(
      'Class time',
      name: 'class_time',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'class detail' key

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Lectures`
  String get lectures {
    return Intl.message(
      'Lectures',
      name: 'lectures',
      desc: '',
      args: [],
    );
  }

  /// `Class Detail`
  String get class_detail {
    return Intl.message(
      'Class Detail',
      name: 'class_detail',
      desc: '',
      args: [],
    );
  }

  /// `Course information`
  String get course_information {
    return Intl.message(
      'Course information',
      name: 'course_information',
      desc: '',
      args: [],
    );
  }

  /// `Course name:`
  String get course_name {
    return Intl.message(
      'Course name:',
      name: 'course_name',
      desc: '',
      args: [],
    );
  }

  /// `Fee:`
  String get fee {
    return Intl.message(
      'Fee:',
      name: 'fee',
      desc: '',
      args: [],
    );
  }

  /// `Max Students:`
  String get max_students {
    return Intl.message(
      'Max Students:',
      name: 'max_students',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Course type`
  String get course_type {
    return Intl.message(
      'Course type',
      name: 'course_type',
      desc: '',
      args: [],
    );
  }

  /// `Type name:`
  String get type_name {
    return Intl.message(
      'Type name:',
      name: 'type_name',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Level name:`
  String get level_name {
    return Intl.message(
      'Level name:',
      name: 'level_name',
      desc: '',
      args: [],
    );
  }

  /// `Point:`
  String get point {
    return Intl.message(
      'Point:',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `Language:`
  String get language {
    return Intl.message(
      'Language:',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `user name is not valid`
  String get user_name_is_not_valid {
    return Intl.message(
      'user name is not valid',
      name: 'user_name_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `password must be at least 8 charactor`
  String get password_must_be_at_least_8_charactor {
    return Intl.message(
      'password must be at least 8 charactor',
      name: 'password_must_be_at_least_8_charactor',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_password {
    return Intl.message(
      'Reset password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `code can't be empty`
  String get code_can_not_be_empty {
    return Intl.message(
      'code can\'t be empty',
      name: 'code_can_not_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `password is not valid`
  String get password_is_not_valid {
    return Intl.message(
      'password is not valid',
      name: 'password_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `confirm password is not valid`
  String get confirm_password_is_not_valid {
    return Intl.message(
      'confirm password is not valid',
      name: 'confirm_password_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
