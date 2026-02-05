import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

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
    Locale('en'),
    Locale('pt'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'DailyFood'**
  String get appTitle;

  /// No description provided for @restaurantsTitle.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurantsTitle;

  /// No description provided for @restaurantCreatorId.
  ///
  /// In en, this message translates to:
  /// **'Restaurant creator ID'**
  String get restaurantCreatorId;

  /// No description provided for @restaurantPostedAt.
  ///
  /// In en, this message translates to:
  /// **'Restaurant posted at'**
  String get restaurantPostedAt;

  /// No description provided for @restaurantTitle.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurantTitle;

  /// No description provided for @restaurantName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get restaurantName;

  /// No description provided for @restaurantFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get restaurantFullName;

  /// No description provided for @restaurantAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get restaurantAddress;

  /// No description provided for @restaurantCellNumber.
  ///
  /// In en, this message translates to:
  /// **'Cellphone number'**
  String get restaurantCellNumber;

  /// No description provided for @restaurantGpsPoint.
  ///
  /// In en, this message translates to:
  /// **'GPS coordinate'**
  String get restaurantGpsPoint;

  /// No description provided for @restaurantBackgroundImageURL.
  ///
  /// In en, this message translates to:
  /// **'Background image URL'**
  String get restaurantBackgroundImageURL;

  /// No description provided for @restaurantLogoImageURL.
  ///
  /// In en, this message translates to:
  /// **'Logo image URL'**
  String get restaurantLogoImageURL;

  /// No description provided for @restaurantMakeReservation.
  ///
  /// In en, this message translates to:
  /// **'Make reservations'**
  String get restaurantMakeReservation;

  /// No description provided for @restaurantClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get restaurantClosed;

  /// No description provided for @restaurantClosedMessage.
  ///
  /// In en, this message translates to:
  /// **'Closing message'**
  String get restaurantClosedMessage;

  /// No description provided for @restaurantDailyFood.
  ///
  /// In en, this message translates to:
  /// **'Daily dish'**
  String get restaurantDailyFood;

  /// No description provided for @restaurantDailyFood1name.
  ///
  /// In en, this message translates to:
  /// **'First dish name'**
  String get restaurantDailyFood1name;

  /// No description provided for @restaurantDailyFood1image.
  ///
  /// In en, this message translates to:
  /// **'First dish image'**
  String get restaurantDailyFood1image;

  /// No description provided for @restaurantDailyFood1price.
  ///
  /// In en, this message translates to:
  /// **'First dish price'**
  String get restaurantDailyFood1price;

  /// No description provided for @restaurantDailyFood1active.
  ///
  /// In en, this message translates to:
  /// **'First dish availability'**
  String get restaurantDailyFood1active;

  /// No description provided for @restaurantDailyFood2name.
  ///
  /// In en, this message translates to:
  /// **'Name of the second dish'**
  String get restaurantDailyFood2name;

  /// No description provided for @restaurantDailyFood2image.
  ///
  /// In en, this message translates to:
  /// **'Image of the second dish'**
  String get restaurantDailyFood2image;

  /// No description provided for @restaurantDailyFood2price.
  ///
  /// In en, this message translates to:
  /// **'Price of the second dish'**
  String get restaurantDailyFood2price;

  /// No description provided for @restaurantDailyFood2active.
  ///
  /// In en, this message translates to:
  /// **'Availability of the second dish'**
  String get restaurantDailyFood2active;

  /// No description provided for @restaurantDailyFood3name.
  ///
  /// In en, this message translates to:
  /// **'Name of the third dish'**
  String get restaurantDailyFood3name;

  /// No description provided for @restaurantDailyFood3image.
  ///
  /// In en, this message translates to:
  /// **'Image of the third dish'**
  String get restaurantDailyFood3image;

  /// No description provided for @restaurantDailyFood3price.
  ///
  /// In en, this message translates to:
  /// **'Price of the third dish'**
  String get restaurantDailyFood3price;

  /// No description provided for @restaurantDailyFood3active.
  ///
  /// In en, this message translates to:
  /// **'Availability of the third dish'**
  String get restaurantDailyFood3active;

  /// No description provided for @restaurantLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error when loading restaurantsfinal local = AppLocalizations.of(context)!;'**
  String get restaurantLoadError;

  /// No description provided for @restaurantEmptyError.
  ///
  /// In en, this message translates to:
  /// **'No restaurants found'**
  String get restaurantEmptyError;

  /// No description provided for @restaurantCreateError.
  ///
  /// In en, this message translates to:
  /// **'Error creating restaurant'**
  String get restaurantCreateError;

  /// No description provided for @restaurantCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restaurant created successfully'**
  String get restaurantCreateSuccess;

  /// No description provided for @restaurantCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Restaurant'**
  String get restaurantCreateTitle;

  /// No description provided for @allEnterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter the Value'**
  String get allEnterValue;

  /// No description provided for @allValueCantEmpty.
  ///
  /// In en, this message translates to:
  /// **'Value Can\'t Be Empty'**
  String get allValueCantEmpty;

  /// No description provided for @allBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get allBack;

  /// No description provided for @allNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get allNext;

  /// No description provided for @allSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get allSubmit;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'Field required'**
  String get fieldRequired;
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
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
