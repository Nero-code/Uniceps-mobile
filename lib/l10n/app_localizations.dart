import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hi, '**
  String get hello;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signin;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your E-mail Address'**
  String get emailError;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get passwordError;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCode;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @codeError.
  ///
  /// In en, this message translates to:
  /// **'Invalid Code!'**
  String get codeError;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @gymBoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Please type in the code the Gym Gave you'**
  String get gymBoxTitle;

  /// No description provided for @authBoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get authBoxTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get profileTitle;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'SKIP >'**
  String get skip;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @newVersion.
  ///
  /// In en, this message translates to:
  /// **'New Version Available'**
  String get newVersion;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level:'**
  String get level;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @nothingChanged.
  ///
  /// In en, this message translates to:
  /// **'Nothing Changed'**
  String get nothingChanged;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutAlert.
  ///
  /// In en, this message translates to:
  /// **'Logout?'**
  String get logoutAlert;

  /// No description provided for @logoutAlertContents.
  ///
  /// In en, this message translates to:
  /// **'You are about to Logout of the app some of your data may be lost, Are you sure?'**
  String get logoutAlertContents;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @setCurrent.
  ///
  /// In en, this message translates to:
  /// **'Set Current'**
  String get setCurrent;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @finishAlertContent.
  ///
  /// In en, this message translates to:
  /// **'have you finished training? this session will be closed and marked as finished!'**
  String get finishAlertContent;

  /// No description provided for @practiceNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'An active session is waiting - practice now and stay on track'**
  String get practiceNotificationBody;

  /// No description provided for @welldone.
  ///
  /// In en, this message translates to:
  /// **'Well Done!'**
  String get welldone;

  /// No description provided for @great.
  ///
  /// In en, this message translates to:
  /// **'Great!'**
  String get great;

  /// No description provided for @record.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// No description provided for @before.
  ///
  /// In en, this message translates to:
  /// **'Before'**
  String get before;

  /// No description provided for @after.
  ///
  /// In en, this message translates to:
  /// **'After'**
  String get after;

  /// No description provided for @applyToAll.
  ///
  /// In en, this message translates to:
  /// **'Apply to all'**
  String get applyToAll;

  /// No description provided for @dayLimitAlert.
  ///
  /// In en, this message translates to:
  /// **'Login to get 3 free days'**
  String get dayLimitAlert;

  /// No description provided for @routineLimitAlert.
  ///
  /// In en, this message translates to:
  /// **'Login to add routines'**
  String get routineLimitAlert;

  /// No description provided for @captainUniUpgradeQuote.
  ///
  /// In en, this message translates to:
  /// **'Are you ready to head to the top?\nThis is not just an upgrade... it\'s a map to your stronger and smarter version'**
  String get captainUniUpgradeQuote;

  /// No description provided for @importRoutine.
  ///
  /// In en, this message translates to:
  /// **'Import Routine'**
  String get importRoutine;

  /// No description provided for @importRoutineAlertContent.
  ///
  /// In en, this message translates to:
  /// **'Make sure you have a file with .unx extension, then import it.'**
  String get importRoutineAlertContent;

  /// No description provided for @exportRoutine.
  ///
  /// In en, this message translates to:
  /// **'Export Routine'**
  String get exportRoutine;

  /// No description provided for @exportRoutineAlertContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want to export Routine'**
  String get exportRoutineAlertContent;

  /// No description provided for @exportRoutineAuthAlertContent.
  ///
  /// In en, this message translates to:
  /// **'Please login to export this routine'**
  String get exportRoutineAuthAlertContent;

  /// No description provided for @exportRoutineDone.
  ///
  /// In en, this message translates to:
  /// **'Exported!, your file is ready'**
  String get exportRoutineDone;

  /// No description provided for @congrats.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congrats;

  /// No description provided for @congratsContent.
  ///
  /// In en, this message translates to:
  /// **'Hurray!, Premium Plan activated, all app features are now unlocked, have fun!'**
  String get congratsContent;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessions;

  /// No description provided for @sessionsReport.
  ///
  /// In en, this message translates to:
  /// **'Sessions Report'**
  String get sessionsReport;

  /// No description provided for @weightsReport.
  ///
  /// In en, this message translates to:
  /// **'Weights Report'**
  String get weightsReport;

  /// No description provided for @exerciseDensity.
  ///
  /// In en, this message translates to:
  /// **'Exercise Density'**
  String get exerciseDensity;

  /// No description provided for @exerciseIntensity.
  ///
  /// In en, this message translates to:
  /// **'Exercise Intensity'**
  String get exerciseIntensity;

  /// No description provided for @exerciseVolume.
  ///
  /// In en, this message translates to:
  /// **'Exercise Volume'**
  String get exerciseVolume;

  /// No description provided for @physicalReport.
  ///
  /// In en, this message translates to:
  /// **'Physical Report'**
  String get physicalReport;

  /// No description provided for @progressRate.
  ///
  /// In en, this message translates to:
  /// **'Preogress Rate'**
  String get progressRate;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'owner'**
  String get owner;

  /// No description provided for @telephone.
  ///
  /// In en, this message translates to:
  /// **'Telephone'**
  String get telephone;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @subscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @measurements.
  ///
  /// In en, this message translates to:
  /// **'Measurements'**
  String get measurements;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @calender.
  ///
  /// In en, this message translates to:
  /// **'Calender'**
  String get calender;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// No description provided for @attendenceLog.
  ///
  /// In en, this message translates to:
  /// **'Attendence Log'**
  String get attendenceLog;

  /// No description provided for @addExercise.
  ///
  /// In en, this message translates to:
  /// **'Add Exercise'**
  String get addExercise;

  /// No description provided for @addRoutine.
  ///
  /// In en, this message translates to:
  /// **'Add Routine'**
  String get addRoutine;

  /// No description provided for @scrTitleMyRoutines.
  ///
  /// In en, this message translates to:
  /// **'My Routines'**
  String get scrTitleMyRoutines;

  /// No description provided for @scrTitleProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get scrTitleProfile;

  /// No description provided for @scrTitleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get scrTitleSettings;

  /// No description provided for @scrTitlePerformance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get scrTitlePerformance;

  /// No description provided for @scrTitleCompareTool.
  ///
  /// In en, this message translates to:
  /// **'Compare Tool'**
  String get scrTitleCompareTool;

  /// No description provided for @setsAndRounds.
  ///
  /// In en, this message translates to:
  /// **'Sets & Rounds'**
  String get setsAndRounds;

  /// No description provided for @noFileSelected.
  ///
  /// In en, this message translates to:
  /// **'No file selected'**
  String get noFileSelected;

  /// No description provided for @unsupportedVersion.
  ///
  /// In en, this message translates to:
  /// **'Unsupported version of selected file'**
  String get unsupportedVersion;

  /// No description provided for @parserMismatch.
  ///
  /// In en, this message translates to:
  /// **'Unexpected file content'**
  String get parserMismatch;

  /// No description provided for @corruptedFile.
  ///
  /// In en, this message translates to:
  /// **'Cannot open, the file is Corrupted'**
  String get corruptedFile;

  /// No description provided for @startingImport.
  ///
  /// In en, this message translates to:
  /// **'Openning File...'**
  String get startingImport;

  /// No description provided for @gettingImagesImport.
  ///
  /// In en, this message translates to:
  /// **'Getting Images...'**
  String get gettingImagesImport;

  /// No description provided for @addingDaysImport.
  ///
  /// In en, this message translates to:
  /// **'Adding Days...'**
  String get addingDaysImport;

  /// No description provided for @addingItemsImport.
  ///
  /// In en, this message translates to:
  /// **'Adding Exercises...'**
  String get addingItemsImport;

  /// No description provided for @addingSetsImport.
  ///
  /// In en, this message translates to:
  /// **'Adding Sets...'**
  String get addingSetsImport;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Import Successful'**
  String get done;

  /// No description provided for @chooseLang.
  ///
  /// In en, this message translates to:
  /// **'Choose Language:'**
  String get chooseLang;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @gyms.
  ///
  /// In en, this message translates to:
  /// **'Gyms'**
  String get gyms;

  /// No description provided for @trainer.
  ///
  /// In en, this message translates to:
  /// **'Trainer'**
  String get trainer;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @heightError.
  ///
  /// In en, this message translates to:
  /// **'Please put a valid Height'**
  String get heightError;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @weightError.
  ///
  /// In en, this message translates to:
  /// **'Please put a valid Weight'**
  String get weightError;

  /// No description provided for @lastWeight.
  ///
  /// In en, this message translates to:
  /// **'Last Weight'**
  String get lastWeight;

  /// No description provided for @arms.
  ///
  /// In en, this message translates to:
  /// **'Arms'**
  String get arms;

  /// No description provided for @lArm.
  ///
  /// In en, this message translates to:
  /// **'Left Arm'**
  String get lArm;

  /// No description provided for @rArm.
  ///
  /// In en, this message translates to:
  /// **'Right Arm'**
  String get rArm;

  /// No description provided for @humerus.
  ///
  /// In en, this message translates to:
  /// **'Humerus'**
  String get humerus;

  /// No description provided for @lHumerus.
  ///
  /// In en, this message translates to:
  /// **'Left Humerus'**
  String get lHumerus;

  /// No description provided for @rHumerus.
  ///
  /// In en, this message translates to:
  /// **'Right Humerus'**
  String get rHumerus;

  /// No description provided for @legs.
  ///
  /// In en, this message translates to:
  /// **'Legs'**
  String get legs;

  /// No description provided for @lLeg.
  ///
  /// In en, this message translates to:
  /// **'Left Leg'**
  String get lLeg;

  /// No description provided for @rLeg.
  ///
  /// In en, this message translates to:
  /// **'Right Leg'**
  String get rLeg;

  /// No description provided for @thighs.
  ///
  /// In en, this message translates to:
  /// **'Thighs'**
  String get thighs;

  /// No description provided for @lThigh.
  ///
  /// In en, this message translates to:
  /// **'Left Thigh'**
  String get lThigh;

  /// No description provided for @rThigh.
  ///
  /// In en, this message translates to:
  /// **'Right Thigh'**
  String get rThigh;

  /// No description provided for @nick.
  ///
  /// In en, this message translates to:
  /// **'Nick'**
  String get nick;

  /// No description provided for @shoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get shoulders;

  /// No description provided for @waist.
  ///
  /// In en, this message translates to:
  /// **'Waist'**
  String get waist;

  /// No description provided for @chest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get chest;

  /// No description provided for @hips.
  ///
  /// In en, this message translates to:
  /// **'Hips'**
  String get hips;

  /// No description provided for @checkDate.
  ///
  /// In en, this message translates to:
  /// **'Check Date'**
  String get checkDate;

  /// No description provided for @enteredAt.
  ///
  /// In en, this message translates to:
  /// **'Entered At'**
  String get enteredAt;

  /// No description provided for @exitedAt.
  ///
  /// In en, this message translates to:
  /// **'Exited At'**
  String get exitedAt;

  /// No description provided for @codeNum.
  ///
  /// In en, this message translates to:
  /// **'Code Number'**
  String get codeNum;

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get reps;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'No Records to show'**
  String get empty;

  /// No description provided for @emptySubs.
  ///
  /// In en, this message translates to:
  /// **'No Subscriptions'**
  String get emptySubs;

  /// No description provided for @emptyMeasure.
  ///
  /// In en, this message translates to:
  /// **'No Measurements to compare, insert you body measurements to see the results'**
  String get emptyMeasure;

  /// No description provided for @emptyExcercises.
  ///
  /// In en, this message translates to:
  /// **'No Exercises'**
  String get emptyExcercises;

  /// No description provided for @emptySubscriptions.
  ///
  /// In en, this message translates to:
  /// **'No Subscriptions yet'**
  String get emptySubscriptions;

  /// No description provided for @emptyMeasurements.
  ///
  /// In en, this message translates to:
  /// **'No Measurements yet'**
  String get emptyMeasurements;

  /// No description provided for @emptyExercisesList.
  ///
  /// In en, this message translates to:
  /// **'No Exercises in this Group'**
  String get emptyExercisesList;

  /// No description provided for @emptyGymsList.
  ///
  /// In en, this message translates to:
  /// **'No Gyms Available'**
  String get emptyGymsList;

  /// No description provided for @emptyHandshakes.
  ///
  /// In en, this message translates to:
  /// **'you are not a member of any gym'**
  String get emptyHandshakes;

  /// No description provided for @emptyTriningDaysMap.
  ///
  /// In en, this message translates to:
  /// **'No Training Program yet'**
  String get emptyTriningDaysMap;

  /// No description provided for @emptyHomeCard.
  ///
  /// In en, this message translates to:
  /// **'No Gym Specified, select a gym to load data'**
  String get emptyHomeCard;

  /// No description provided for @emptyAttendence.
  ///
  /// In en, this message translates to:
  /// **'Not a member'**
  String get emptyAttendence;

  /// No description provided for @emptyRoutineItems.
  ///
  /// In en, this message translates to:
  /// **'No items, try the (+) button'**
  String get emptyRoutineItems;

  /// No description provided for @emptyDays.
  ///
  /// In en, this message translates to:
  /// **'No days, press + to add a day!'**
  String get emptyDays;

  /// No description provided for @emptyRoutines.
  ///
  /// In en, this message translates to:
  /// **'Lets build a special workout to achieve your goals!'**
  String get emptyRoutines;

  /// No description provided for @sessionsReportNoValues.
  ///
  /// In en, this message translates to:
  /// **'No sessions found for this routine, Try practicing!'**
  String get sessionsReportNoValues;

  /// No description provided for @sessionsReportInvalidValues.
  ///
  /// In en, this message translates to:
  /// **'Malformed sessions values!'**
  String get sessionsReportInvalidValues;

  /// No description provided for @logsReportNoValues.
  ///
  /// In en, this message translates to:
  /// **'No Logs found for this routine'**
  String get logsReportNoValues;

  /// No description provided for @logsReportInvalidValues.
  ///
  /// In en, this message translates to:
  /// **'Malformed logs!'**
  String get logsReportInvalidValues;

  /// No description provided for @physicalReportNoValues.
  ///
  /// In en, this message translates to:
  /// **'No measurements found, Try measuring yourself!'**
  String get physicalReportNoValues;

  /// No description provided for @physicalReportInvalidValues.
  ///
  /// In en, this message translates to:
  /// **'Malformed Measurements!'**
  String get physicalReportInvalidValues;

  /// No description provided for @physicalReportDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Note: these values are not completely accurate, medical information should come from professionals'**
  String get physicalReportDisclaimer;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'something went wrong'**
  String get error;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @pName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get pName;

  /// No description provided for @pNameError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter your Full name'**
  String get pNameError;

  /// No description provided for @phoneNum.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNum;

  /// No description provided for @phoneNumError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter your Phone Number'**
  String get phoneNumError;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth:'**
  String get birthDate;

  /// No description provided for @birthDateError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter your Year of Birth'**
  String get birthDateError;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @genderError.
  ///
  /// In en, this message translates to:
  /// **'Please choose your Gender'**
  String get genderError;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @notPaid.
  ///
  /// In en, this message translates to:
  /// **'Not Paid'**
  String get notPaid;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remainder'**
  String get remaining;

  /// No description provided for @versionInfo.
  ///
  /// In en, this message translates to:
  /// **'Version Info'**
  String get versionInfo;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @versionDate.
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get versionDate;

  /// No description provided for @developers.
  ///
  /// In en, this message translates to:
  /// **'Developers'**
  String get developers;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @supportPage.
  ///
  /// In en, this message translates to:
  /// **'Our Page'**
  String get supportPage;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @userAgreement.
  ///
  /// In en, this message translates to:
  /// **'User Agreement'**
  String get userAgreement;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @noGymSpecified.
  ///
  /// In en, this message translates to:
  /// **'you\'re not a member of any gym'**
  String get noGymSpecified;

  /// No description provided for @noTrainingProgram.
  ///
  /// In en, this message translates to:
  /// **'you don\'t have a training program'**
  String get noTrainingProgram;

  /// No description provided for @errNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet Available'**
  String get errNoInternet;

  /// No description provided for @errServerException.
  ///
  /// In en, this message translates to:
  /// **'An error occurred from our side, try again later'**
  String get errServerException;

  /// No description provided for @errUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred'**
  String get errUnknown;

  /// No description provided for @errOpenSessionDelete.
  ///
  /// In en, this message translates to:
  /// **'you can\'t delete with an open session!'**
  String get errOpenSessionDelete;

  /// No description provided for @errExportRoutine.
  ///
  /// In en, this message translates to:
  /// **'Failed!, Could not export routine'**
  String get errExportRoutine;

  /// No description provided for @endOfSubDate.
  ///
  /// In en, this message translates to:
  /// **'End of subscription Date'**
  String get endOfSubDate;

  /// No description provided for @dayQuete.
  ///
  /// In en, this message translates to:
  /// **'what\'re you going to train today?'**
  String get dayQuete;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start...'**
  String get letsStart;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Daily Routine'**
  String get map;

  /// No description provided for @availableGyms.
  ///
  /// In en, this message translates to:
  /// **'Available Gyms'**
  String get availableGyms;

  /// No description provided for @deleteBtn.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteBtn;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account?'**
  String get deleteAccount;

  /// No description provided for @deleteAccountContent.
  ///
  /// In en, this message translates to:
  /// **'you are about to delete your account within Uniceps System, Are you sure?'**
  String get deleteAccountContent;

  /// No description provided for @chackForUpdate.
  ///
  /// In en, this message translates to:
  /// **'Checking for updates...'**
  String get chackForUpdate;

  /// No description provided for @gettingRoutine.
  ///
  /// In en, this message translates to:
  /// **'Getting Routine...'**
  String get gettingRoutine;

  /// No description provided for @guestMode.
  ///
  /// In en, this message translates to:
  /// **'Guest Mode'**
  String get guestMode;

  /// No description provided for @guestModeEditErr.
  ///
  /// In en, this message translates to:
  /// **'Guest mode not allowed to edit'**
  String get guestModeEditErr;

  /// No description provided for @newRoutine.
  ///
  /// In en, this message translates to:
  /// **'New Routine'**
  String get newRoutine;

  /// No description provided for @sortDays.
  ///
  /// In en, this message translates to:
  /// **'Sort Days'**
  String get sortDays;

  /// No description provided for @commingSoon.
  ///
  /// In en, this message translates to:
  /// **'Comming Soon!'**
  String get commingSoon;

  /// No description provided for @captainUni.
  ///
  /// In en, this message translates to:
  /// **'Captain Uni'**
  String get captainUni;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @paymentDone.
  ///
  /// In en, this message translates to:
  /// **'Plan Bought Successfuly'**
  String get paymentDone;

  /// No description provided for @paymentDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Choose your preffered payment method'**
  String get paymentDialogContent;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @buyPlanQuestion.
  ///
  /// In en, this message translates to:
  /// **'Buy Plan?'**
  String get buyPlanQuestion;

  /// No description provided for @buyPlancontent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to buy {planName}! the durations will accumilate if previous plan is present'**
  String buyPlancontent(Object planName);

  /// No description provided for @memberDurationAlart.
  ///
  /// In en, this message translates to:
  /// **'you still have {count}! day(s) till {date}!'**
  String memberDurationAlart(Object count, Object date);

  /// No description provided for @muscleGroup.
  ///
  /// In en, this message translates to:
  /// **'Muscle Group: {group}'**
  String muscleGroup(Object group);

  /// No description provided for @deleteAlertContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {item}? all related items will also be deleted.'**
  String deleteAlertContent(Object item);

  /// No description provided for @setCurrentAlertContent.
  ///
  /// In en, this message translates to:
  /// **'Set {item} as your current Routine?'**
  String setCurrentAlertContent(Object item);

  /// No description provided for @premiumReminder.
  ///
  /// In en, this message translates to:
  /// **'Your Subscription will end after {days} day(s), renew now!'**
  String premiumReminder(Object days);

  /// No description provided for @signinAlert.
  ///
  /// In en, this message translates to:
  /// **'Sign in to see all features'**
  String get signinAlert;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// No description provided for @upgradeAlert.
  ///
  /// In en, this message translates to:
  /// **'Become a Premium Member to unlock your FULL potential'**
  String get upgradeAlert;

  /// No description provided for @premiumAlertContent.
  ///
  /// In en, this message translates to:
  /// **'Unlock ALL content with Premium'**
  String get premiumAlertContent;

  /// No description provided for @captainUniAboutContent.
  ///
  /// In en, this message translates to:
  /// **'Hello, I’m Captain Uni.\nI’m the virtual guide who will accompany you inside the Uniceps app, and my job is to make every step easy and your experience smooth and clear.\nMy main role is to introduce you to the app and show you how to use each section without any confusion.\nI also help you choose the workout program that fits you best, so you can start your journey the right way.\nWith every workout you complete, I collect your stats and show you your results, so you can see your progress day by day.\nI can’t promise to change your life overnight… but I can promise to stay by your side at every stage.\nI’m here to guide you, explain things, and encourage you, so you can get the most out of the app.\nAnd in the end… consider me a friend and an experienced companion walking with you step by step, happy to see you improving.'**
  String get captainUniAboutContent;

  /// No description provided for @msgSlowConnection.
  ///
  /// In en, this message translates to:
  /// **'Weak internet connection'**
  String get msgSlowConnection;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
