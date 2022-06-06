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

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email or User ID`
  String get email_user_id {
    return Intl.message(
      'Email or User ID',
      name: 'email_user_id',
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

  /// `Login By Tour`
  String get login_by_tour {
    return Intl.message(
      'Login By Tour',
      name: 'login_by_tour',
      desc: '',
      args: [],
    );
  }

  /// `If you have not account yet?`
  String get no_have_account_yet {
    return Intl.message(
      'If you have not account yet?',
      name: 'no_have_account_yet',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Server Error!!!`
  String get sever_error {
    return Intl.message(
      'Server Error!!!',
      name: 'sever_error',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `MeFood`
  String get mefood {
    return Intl.message(
      'MeFood',
      name: 'mefood',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Analysis`
  String get analysis {
    return Intl.message(
      'Analysis',
      name: 'analysis',
      desc: '',
      args: [],
    );
  }

  /// `Status Map`
  String get status_map {
    return Intl.message(
      'Status Map',
      name: 'status_map',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get my_profile {
    return Intl.message(
      'My Profile',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Membership`
  String get membership {
    return Intl.message(
      'Membership',
      name: 'membership',
      desc: '',
      args: [],
    );
  }

  /// `Follows`
  String get follows {
    return Intl.message(
      'Follows',
      name: 'follows',
      desc: '',
      args: [],
    );
  }

  /// `My Earn`
  String get my_earn {
    return Intl.message(
      'My Earn',
      name: 'my_earn',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Go To Login`
  String get go_to_login {
    return Intl.message(
      'Go To Login',
      name: 'go_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Remove Account`
  String get remove_account {
    return Intl.message(
      'Remove Account',
      name: 'remove_account',
      desc: '',
      args: [],
    );
  }

  /// `User Address`
  String get usr_address {
    return Intl.message(
      'User Address',
      name: 'usr_address',
      desc: '',
      args: [],
    );
  }

  /// `From the Current Location`
  String get from_current_location {
    return Intl.message(
      'From the Current Location',
      name: 'from_current_location',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Address1`
  String get address1 {
    return Intl.message(
      'Address1',
      name: 'address1',
      desc: '',
      args: [],
    );
  }

  /// `Address2 (Optional)`
  String get address2_optional {
    return Intl.message(
      'Address2 (Optional)',
      name: 'address2_optional',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postal_code {
    return Intl.message(
      'Postal Code',
      name: 'postal_code',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Laos`
  String get laos {
    return Intl.message(
      'Laos',
      name: 'laos',
      desc: '',
      args: [],
    );
  }

  /// `Update Address`
  String get update_address {
    return Intl.message(
      'Update Address',
      name: 'update_address',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Car Information`
  String get car_info {
    return Intl.message(
      'Car Information',
      name: 'car_info',
      desc: '',
      args: [],
    );
  }

  /// `You registered by Delivery User`
  String get register_to_delivery {
    return Intl.message(
      'You registered by Delivery User',
      name: 'register_to_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Almost Done`
  String get almost_done {
    return Intl.message(
      'Almost Done',
      name: 'almost_done',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
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

  /// `Driver Identify`
  String get driver_identify {
    return Intl.message(
      'Driver Identify',
      name: 'driver_identify',
      desc: '',
      args: [],
    );
  }

  /// `ID Card or Passport`
  String get idcard_passport {
    return Intl.message(
      'ID Card or Passport',
      name: 'idcard_passport',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get upload_image {
    return Intl.message(
      'Upload Image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Failed image uploaded`
  String get upload_image_failed {
    return Intl.message(
      'Failed image uploaded',
      name: 'upload_image_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get input_all_fields {
    return Intl.message(
      'Please fill all fields',
      name: 'input_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `Pending Account`
  String get pending_account {
    return Intl.message(
      'Pending Account',
      name: 'pending_account',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Photo`
  String get edit_photo {
    return Intl.message(
      'Edit Photo',
      name: 'edit_photo',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Choose Method`
  String get choose_method {
    return Intl.message(
      'Choose Method',
      name: 'choose_method',
      desc: '',
      args: [],
    );
  }

  /// `Choose Gender`
  String get choose_gender {
    return Intl.message(
      'Choose Gender',
      name: 'choose_gender',
      desc: '',
      args: [],
    );
  }

  /// `Choose Color`
  String get choose_color {
    return Intl.message(
      'Choose Color',
      name: 'choose_color',
      desc: '',
      args: [],
    );
  }

  /// `Choose Location`
  String get choose_location {
    return Intl.message(
      'Choose Location',
      name: 'choose_location',
      desc: '',
      args: [],
    );
  }

  /// `Choose Category`
  String get choose_category {
    return Intl.message(
      'Choose Category',
      name: 'choose_category',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_code {
    return Intl.message(
      'Verify Code',
      name: 'verify_code',
      desc: '',
      args: [],
    );
  }

  /// `Free Member`
  String get free_member {
    return Intl.message(
      'Free Member',
      name: 'free_member',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Premium Member`
  String get premium_member {
    return Intl.message(
      'Premium Member',
      name: 'premium_member',
      desc: '',
      args: [],
    );
  }

  /// `$5 per a month`
  String get monthly_5 {
    return Intl.message(
      '\$5 per a month',
      name: 'monthly_5',
      desc: '',
      args: [],
    );
  }

  /// `Manual Membership`
  String get manual_membership {
    return Intl.message(
      'Manual Membership',
      name: 'manual_membership',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `As Read`
  String get as_read {
    return Intl.message(
      'As Read',
      name: 'as_read',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get read {
    return Intl.message(
      'Read',
      name: 'read',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Unread`
  String get unread {
    return Intl.message(
      'Unread',
      name: 'unread',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Change Name`
  String get change_name {
    return Intl.message(
      'Change Name',
      name: 'change_name',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Type`
  String get delivery_type {
    return Intl.message(
      'Delivery Type',
      name: 'delivery_type',
      desc: '',
      args: [],
    );
  }

  /// `Successfully data updated`
  String get success_data_updated {
    return Intl.message(
      'Successfully data updated',
      name: 'success_data_updated',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Hot Products`
  String get hot_products {
    return Intl.message(
      'Hot Products',
      name: 'hot_products',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message(
      'View All',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message(
      'Restaurants',
      name: 'restaurants',
      desc: '',
      args: [],
    );
  }

  /// `New Products`
  String get new_products {
    return Intl.message(
      'New Products',
      name: 'new_products',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Failed some process`
  String get failed_process {
    return Intl.message(
      'Failed some process',
      name: 'failed_process',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Not Match Email`
  String get no_match_email {
    return Intl.message(
      'Not Match Email',
      name: 'no_match_email',
      desc: '',
      args: [],
    );
  }

  /// `Not Match Password`
  String get no_match_pass {
    return Intl.message(
      'Not Match Password',
      name: 'no_match_pass',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Now`
  String get upgrade_now {
    return Intl.message(
      'Upgrade Now',
      name: 'upgrade_now',
      desc: '',
      args: [],
    );
  }

  /// `Ready for Ride`
  String get ready_ride {
    return Intl.message(
      'Ready for Ride',
      name: 'ready_ride',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get soon {
    return Intl.message(
      'Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `Waring`
  String get waring {
    return Intl.message(
      'Waring',
      name: 'waring',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Processing now ...`
  String get processing_now {
    return Intl.message(
      'Processing now ...',
      name: 'processing_now',
      desc: '',
      args: [],
    );
  }

  /// `Logo`
  String get logo {
    return Intl.message(
      'Logo',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `Galleries`
  String get galleries {
    return Intl.message(
      'Galleries',
      name: 'galleries',
      desc: '',
      args: [],
    );
  }

  /// `Avatar`
  String get avatar {
    return Intl.message(
      'Avatar',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Base Information`
  String get base_info {
    return Intl.message(
      'Base Information',
      name: 'base_info',
      desc: '',
      args: [],
    );
  }

  /// `Name & Category`
  String get name_category {
    return Intl.message(
      'Name & Category',
      name: 'name_category',
      desc: '',
      args: [],
    );
  }

  /// `Owner Information`
  String get owner_info {
    return Intl.message(
      'Owner Information',
      name: 'owner_info',
      desc: '',
      args: [],
    );
  }

  /// `Admin Information`
  String get admin_info {
    return Intl.message(
      'Admin Information',
      name: 'admin_info',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get user_info {
    return Intl.message(
      'User Information',
      name: 'user_info',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Add Users`
  String get add_users {
    return Intl.message(
      'Add Users',
      name: 'add_users',
      desc: '',
      args: [],
    );
  }

  /// `Car License`
  String get car_license {
    return Intl.message(
      'Car License',
      name: 'car_license',
      desc: '',
      args: [],
    );
  }

  /// `Car Plate`
  String get car_plate {
    return Intl.message(
      'Car Plate',
      name: 'car_plate',
      desc: '',
      args: [],
    );
  }

  /// `Car Images`
  String get car_images {
    return Intl.message(
      'Car Images',
      name: 'car_images',
      desc: '',
      args: [],
    );
  }

  /// `Update Car`
  String get upt_car {
    return Intl.message(
      'Update Car',
      name: 'upt_car',
      desc: '',
      args: [],
    );
  }

  /// `Update Securit`
  String get upt_securit {
    return Intl.message(
      'Update Securit',
      name: 'upt_securit',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get upt_profile {
    return Intl.message(
      'Update Profile',
      name: 'upt_profile',
      desc: '',
      args: [],
    );
  }

  /// `You can update some identify information and will reivew in 48 hrs.`
  String get dsc_verify {
    return Intl.message(
      'You can update some identify information and will reivew in 48 hrs.',
      name: 'dsc_verify',
      desc: '',
      args: [],
    );
  }

  /// `You can send some information to MEFOOD. We will reply in 48hrs. Thanks for your contact.`
  String get dsc_contact_us {
    return Intl.message(
      'You can send some information to MEFOOD. We will reply in 48hrs. Thanks for your contact.',
      name: 'dsc_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Search Range: 5Km`
  String get cnd_delivery_free_01 {
    return Intl.message(
      'Search Range: 5Km',
      name: 'cnd_delivery_free_01',
      desc: '',
      args: [],
    );
  }

  /// `Max Follow Restraunt: 5 Stores`
  String get cnd_delivery_free_02 {
    return Intl.message(
      'Max Follow Restraunt: 5 Stores',
      name: 'cnd_delivery_free_02',
      desc: '',
      args: [],
    );
  }

  /// `Max Follow Customer: 5 Customers`
  String get cnd_delivery_free_03 {
    return Intl.message(
      'Max Follow Customer: 5 Customers',
      name: 'cnd_delivery_free_03',
      desc: '',
      args: [],
    );
  }

  /// `Max Available Time: 8 Hours`
  String get cnd_delivery_free_04 {
    return Intl.message(
      'Max Available Time: 8 Hours',
      name: 'cnd_delivery_free_04',
      desc: '',
      args: [],
    );
  }

  /// `Search Range: 50Km`
  String get cnd_delivery_pro_01 {
    return Intl.message(
      'Search Range: 50Km',
      name: 'cnd_delivery_pro_01',
      desc: '',
      args: [],
    );
  }

  /// `Max Follow Restraunt: Unlimited`
  String get cnd_delivery_pro_02 {
    return Intl.message(
      'Max Follow Restraunt: Unlimited',
      name: 'cnd_delivery_pro_02',
      desc: '',
      args: [],
    );
  }

  /// `Max Follow Customer: Unlimited`
  String get cnd_delivery_pro_03 {
    return Intl.message(
      'Max Follow Customer: Unlimited',
      name: 'cnd_delivery_pro_03',
      desc: '',
      args: [],
    );
  }

  /// `Max Available Time: Unlimited`
  String get cnd_delivery_pro_04 {
    return Intl.message(
      'Max Available Time: Unlimited',
      name: 'cnd_delivery_pro_04',
      desc: '',
      args: [],
    );
  }

  /// `Analysis Earn: Enabled`
  String get cnd_delivery_pro_05 {
    return Intl.message(
      'Analysis Earn: Enabled',
      name: 'cnd_delivery_pro_05',
      desc: '',
      args: [],
    );
  }

  /// `· At least one uppercase character`
  String get dsc_rex_pass_upper {
    return Intl.message(
      '· At least one uppercase character',
      name: 'dsc_rex_pass_upper',
      desc: '',
      args: [],
    );
  }

  /// `· At least one lowercase character`
  String get dsc_rex_pass_lower {
    return Intl.message(
      '· At least one lowercase character',
      name: 'dsc_rex_pass_lower',
      desc: '',
      args: [],
    );
  }

  /// `· At least one number character`
  String get dsc_rex_pass_number {
    return Intl.message(
      '· At least one number character',
      name: 'dsc_rex_pass_number',
      desc: '',
      args: [],
    );
  }

  /// `· At least one special character`
  String get dsc_rex_pass_special {
    return Intl.message(
      '· At least one special character',
      name: 'dsc_rex_pass_special',
      desc: '',
      args: [],
    );
  }

  /// `· Should be over 8 characters`
  String get dsc_rex_pass_length {
    return Intl.message(
      '· Should be over 8 characters',
      name: 'dsc_rex_pass_length',
      desc: '',
      args: [],
    );
  }

  /// `You can choose one support and go to there. And you can pay to them.`
  String get dsc_pay_manual_01 {
    return Intl.message(
      'You can choose one support and go to there. And you can pay to them.',
      name: 'dsc_pay_manual_01',
      desc: '',
      args: [],
    );
  }

  /// `After payment, they will scan your pay QR code. The below one is your QR.`
  String get dsc_pay_manual_02 {
    return Intl.message(
      'After payment, they will scan your pay QR code. The below one is your QR.',
      name: 'dsc_pay_manual_02',
      desc: '',
      args: [],
    );
  }

  /// `After scaning QR code, you can restart your app and then your memebership will be upgraded`
  String get dsc_pay_manual_03 {
    return Intl.message(
      'After scaning QR code, you can restart your app and then your memebership will be upgraded',
      name: 'dsc_pay_manual_03',
      desc: '',
      args: [],
    );
  }

  /// `Network connection failed.\nPlease check your internet again.`
  String get err_network_desc {
    return Intl.message(
      'Network connection failed.\nPlease check your internet again.',
      name: 'err_network_desc',
      desc: '',
      args: [],
    );
  }

  /// `The location permission was not granted. Please set that on mobile setting and try again.`
  String get err_location {
    return Intl.message(
      'The location permission was not granted. Please set that on mobile setting and try again.',
      name: 'err_location',
      desc: '',
      args: [],
    );
  }

  /// `You can't use MeFood on your devicce, The location service was not supported on your device. Sorry, Please try that again on other devices(Google Map Supported).`
  String get err_location_desc {
    return Intl.message(
      'You can\'t use MeFood on your devicce, The location service was not supported on your device. Sorry, Please try that again on other devices(Google Map Supported).',
      name: 'err_location_desc',
      desc: '',
      args: [],
    );
  }

  /// `Car`
  String get type_car {
    return Intl.message(
      'Car',
      name: 'type_car',
      desc: '',
      args: [],
    );
  }

  /// `Motocycle`
  String get type_motocycle {
    return Intl.message(
      'Motocycle',
      name: 'type_motocycle',
      desc: '',
      args: [],
    );
  }

  /// `Walker`
  String get type_walker {
    return Intl.message(
      'Walker',
      name: 'type_walker',
      desc: '',
      args: [],
    );
  }

  /// `MALE`
  String get type_male {
    return Intl.message(
      'MALE',
      name: 'type_male',
      desc: '',
      args: [],
    );
  }

  /// `FEMALE`
  String get type_female {
    return Intl.message(
      'FEMALE',
      name: 'type_female',
      desc: '',
      args: [],
    );
  }

  /// `In App Purchase`
  String get type_iap {
    return Intl.message(
      'In App Purchase',
      name: 'type_iap',
      desc: '',
      args: [],
    );
  }

  /// `Contact to Support`
  String get type_support {
    return Intl.message(
      'Contact to Support',
      name: 'type_support',
      desc: '',
      args: [],
    );
  }

  /// `From Gallery`
  String get type_gallery {
    return Intl.message(
      'From Gallery',
      name: 'type_gallery',
      desc: '',
      args: [],
    );
  }

  /// `From Camera`
  String get type_camera {
    return Intl.message(
      'From Camera',
      name: 'type_camera',
      desc: '',
      args: [],
    );
  }

  /// `Car Name (ex: Nisan)`
  String get hint_car_name {
    return Intl.message(
      'Car Name (ex: Nisan)',
      name: 'hint_car_name',
      desc: '',
      args: [],
    );
  }

  /// `Car Number (ex: ວຽ 13-14)`
  String get hint_car_number {
    return Intl.message(
      'Car Number (ex: ວຽ 13-14)',
      name: 'hint_car_number',
      desc: '',
      args: [],
    );
  }

  /// `Car Color (ex: 0xff0000)`
  String get hint_car_color {
    return Intl.message(
      'Car Color (ex: 0xff0000)',
      name: 'hint_car_color',
      desc: '',
      args: [],
    );
  }

  /// `Car Since (ex: 2022)`
  String get hint_car_since {
    return Intl.message(
      'Car Since (ex: 2022)',
      name: 'hint_car_since',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Type (ex: Car, Moto, Walker)`
  String get hint_delivery_type {
    return Intl.message(
      'Delivery Type (ex: Car, Moto, Walker)',
      name: 'hint_delivery_type',
      desc: '',
      args: [],
    );
  }

  /// `Distance (ex: max distance Km)`
  String get hint_delivery_distance {
    return Intl.message(
      'Distance (ex: max distance Km)',
      name: 'hint_delivery_distance',
      desc: '',
      args: [],
    );
  }

  /// `Speed (ex: Km/h)`
  String get hint_delivery_speed {
    return Intl.message(
      'Speed (ex: Km/h)',
      name: 'hint_delivery_speed',
      desc: '',
      args: [],
    );
  }

  /// `Weight (ex: max Delivery Kg)`
  String get hint_delivery_weight {
    return Intl.message(
      'Weight (ex: max Delivery Kg)',
      name: 'hint_delivery_weight',
      desc: '',
      args: [],
    );
  }

  /// `Submit your problems`
  String get hint_report_desc {
    return Intl.message(
      'Submit your problems',
      name: 'hint_report_desc',
      desc: '',
      args: [],
    );
  }

  /// `You can add some profile information on the current step.`
  String get reg_usr_detail {
    return Intl.message(
      'You can add some profile information on the current step.',
      name: 'reg_usr_detail',
      desc: '',
      args: [],
    );
  }

  /// `You can add your car(moto, walker) information on the current page.`
  String get reg_car_detail {
    return Intl.message(
      'You can add your car(moto, walker) information on the current page.',
      name: 'reg_car_detail',
      desc: '',
      args: [],
    );
  }

  /// `You can add your home address information on the current page.`
  String get reg_adr_detail {
    return Intl.message(
      'You can add your home address information on the current page.',
      name: 'reg_adr_detail',
      desc: '',
      args: [],
    );
  }

  /// `You can add your account password on the curretn page.`
  String get reg_pwd_detail {
    return Intl.message(
      'You can add your account password on the curretn page.',
      name: 'reg_pwd_detail',
      desc: '',
      args: [],
    );
  }

  /// `We will review your information and will be approve or reply using email in 48 hs. After approved, you can use MeFood service.\nThanks, KYGABYTE IT LTD.`
  String get review_48_desc {
    return Intl.message(
      'We will review your information and will be approve or reply using email in 48 hs. After approved, you can use MeFood service.\nThanks, KYGABYTE IT LTD.',
      name: 'review_48_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your account is pending yet. We will reply in 48 hrs. Thanks for your understanding.`
  String get pending_48_desc {
    return Intl.message(
      'Your account is pending yet. We will reply in 48 hrs. Thanks for your understanding.',
      name: 'pending_48_desc',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Customer of MeFood. You can get a good food and delivery service from MeFood.`
  String get landing_desc_01 {
    return Intl.message(
      'Welcome to Customer of MeFood. You can get a good food and delivery service from MeFood.',
      name: 'landing_desc_01',
      desc: '',
      args: [],
    );
  }

  /// `Fast and All Time Delivery. You can get your time in time. 24/7 Service.`
  String get landing_desc_02 {
    return Intl.message(
      'Fast and All Time Delivery. You can get your time in time. 24/7 Service.',
      name: 'landing_desc_02',
      desc: '',
      args: [],
    );
  }

  /// `Good Analysis System, You can check your order analysis result through chart.`
  String get landing_desc_03 {
    return Intl.message(
      'Good Analysis System, You can check your order analysis result through chart.',
      name: 'landing_desc_03',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY MAN`
  String get delivery_man {
    return Intl.message(
      'DELIVERY MAN',
      name: 'delivery_man',
      desc: '',
      args: [],
    );
  }

  /// `FOR CUSTOMERS`
  String get for_customer {
    return Intl.message(
      'FOR CUSTOMERS',
      name: 'for_customer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
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
