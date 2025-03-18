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

  /// `Login successfully`
  String get login_successfully {
    return Intl.message(
      'Login successfully',
      name: 'login_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Successful Operation`
  String get login_success_title {
    return Intl.message(
      'Successful Operation',
      name: 'login_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get change_theme {
    return Intl.message(
      'Change Theme',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get delete_account_confirmation {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'delete_account_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Data not valid or incomplete`
  String get data_not_valid {
    return Intl.message(
      'Data not valid or incomplete',
      name: 'data_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Confirm exit registration`
  String get confirm_exit_registration {
    return Intl.message(
      'Confirm exit registration',
      name: 'confirm_exit_registration',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Old Password`
  String get old_password {
    return Intl.message(
      'Old Password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Successful Operation`
  String get password_changed_success_title {
    return Intl.message(
      'Successful Operation',
      name: 'password_changed_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Password changed`
  String get password_changed {
    return Intl.message(
      'Password changed',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_success {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_success',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `username_required`
  String get username_required {
    return Intl.message(
      'username_required',
      name: 'username_required',
      desc: '',
      args: [],
    );
  }

  /// `username_too_short`
  String get username_too_short {
    return Intl.message(
      'username_too_short',
      name: 'username_too_short',
      desc: '',
      args: [],
    );
  }

  /// `enter_your_username`
  String get enter_your_username {
    return Intl.message(
      'enter_your_username',
      name: 'enter_your_username',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message('User Name', name: 'user_name', desc: '', args: []);
  }

  /// `Welcome TaskMate`
  String get welcome_to_taskMate {
    return Intl.message(
      'Welcome TaskMate',
      name: 'welcome_to_taskMate',
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
