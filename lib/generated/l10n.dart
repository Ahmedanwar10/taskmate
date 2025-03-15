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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Task Manager`
  String get title {
    return Intl.message('Task Manager', name: 'title', desc: '', args: []);
  }

  /// `Welcome to TaskMate`
  String get welcome {
    return Intl.message(
      'Welcome to TaskMate',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Task Management & To-Do List`
  String get task_management {
    return Intl.message(
      'Task Management & To-Do List',
      name: 'task_management',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start`
  String get lets_start {
    return Intl.message('Let’s Start', name: 'lets_start', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Your today's tasks almost done`
  String get your_task_almost_done {
    return Intl.message(
      'Your today\'s tasks almost done',
      name: 'your_task_almost_done',
      desc: '',
      args: [],
    );
  }

  /// `View Task`
  String get view_task {
    return Intl.message('View Task', name: 'view_task', desc: '', args: []);
  }

  /// `In Progress`
  String get in_progress {
    return Intl.message('In Progress', name: 'in_progress', desc: '', args: []);
  }

  /// `Office Projects`
  String get office_projects {
    return Intl.message(
      'Office Projects',
      name: 'office_projects',
      desc: '',
      args: [],
    );
  }

  /// `Grocery Shopping App Design`
  String get grocery_shopping_app_design {
    return Intl.message(
      'Grocery Shopping App Design',
      name: 'grocery_shopping_app_design',
      desc: '',
      args: [],
    );
  }

  /// `Tasks Group`
  String get tasks_group {
    return Intl.message('Tasks Group', name: 'tasks_group', desc: '', args: []);
  }

  /// `Welcome to TaskMate`
  String get welcome_to_task_mate {
    return Intl.message(
      'Welcome to TaskMate',
      name: 'welcome_to_task_mate',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get register_successfully {
    return Intl.message(
      'Account created successfully',
      name: 'register_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Successful Operation`
  String get register_success_title {
    return Intl.message(
      'Successful Operation',
      name: 'register_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation is required`
  String get password_confirmation_required {
    return Intl.message(
      'Password confirmation is required',
      name: 'password_confirmation_required',
      desc: '',
      args: [],
    );
  }

  /// `Password and password confirmation must be same`
  String get password_confirmation_same {
    return Intl.message(
      'Password and password confirmation must be same',
      name: 'password_confirmation_same',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get Password_must_be_at_least_6_characters_long {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'Password_must_be_at_least_6_characters_long',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain letters and numbers.`
  String get The_password_must_contain_letters_and_numbers {
    return Intl.message(
      'The password must contain letters and numbers.',
      name: 'The_password_must_contain_letters_and_numbers',
      desc: '',
      args: [],
    );
  }

  /// `Invalid_email`
  String get invalid_email {
    return Intl.message(
      'Invalid_email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `password_required`
  String get password_required {
    return Intl.message(
      'password_required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `email_required`
  String get email_required {
    return Intl.message(
      'email_required',
      name: 'email_required',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
