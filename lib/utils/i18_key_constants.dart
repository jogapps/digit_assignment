library i18;

const common = Common();
const splash = Splash();
const onBoarding = OnBoarding();

class Common {
  const Common();

  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';

  String get coreCommonAge => 'CORE_COMMON_AGE';

  String get coreCommonName => 'CORE_COMMON_NAME';

  String get coreCommonEmailId => 'CORE_COMMON_EMAIL_ID';

  String get coreCommonGender => 'CORE_COMMON_GENDER';

  String get coreCommonMobileNumber => 'CORE_COMMON_MOBILE_NUMBER';

  String get coreCommonSubmit => 'CORE_COMMON_SUBMIT';

  String get coreCommonSave => 'CORE_COMMON_SAVE';

  String get coreCommonCancel => 'CORE_COMMON_CANCEL';

  String get corecommonRequired => 'CORE_COMMON_REQUIRED';

  String get coreCommonReasonRequired => 'CORE_COMMON_REASON_REQUIRED';

  String get corecommonclose => 'CORE_COMMON_CLOSE';

  String get coreCommonOk => 'CORE_COMMON_OK';

  String get coreCommonNA => 'CORE_COMMON_NA';

  String get coreCommonProfile => 'CORE_COMMON_PROFILE';

  String get coreCommonLogout => 'CORE_COMMON_LOGOUT';

  String get coreCommonBack => 'CORE_COMMON_BACK';

  String get coreCommonHelp => 'CORE_COMMON_HELP';

  String get coreCommonHome => 'CORE_COMMON_HOME';

  String get coreCommonViewDownloadedData => 'CORE_COMMON_VIEW_DOWNLOADED_DATA';

  String get coreCommonlanguage => 'CORE_COMMON_LANGUAGE';

  String get coreCommonSyncProgress => 'CORE_COMMON_SYNC_PROGRESS';

  String get coreCommonDataSynced => 'CORE_COMMON_DATA_SYNCED';

  String get coreCommonDataSyncFailed => 'CORE_COMMON_DATA_SYNC_FAILED';

  String get coreCommonDataSyncRetry => 'CORE_COMMON_DATA_SYNC_RETRY';

  String get connectionLabel => 'CORE_COMMON_CONNECTION_LABEL';

  String get connectionContent => 'CORE_COMMON_CONNECTION_CONTENT';

  String get coreCommonSkip => 'CORE_COMMON_SKIP';

  String get coreCommonNext => 'CORE_COMMON_NEXT';

  String get coreCommonYes => 'CORE_COMMON_YES';

  String get coreCommonNo => 'CORE_COMMON_NO';
  String get coreCommonGoback => 'CORE_COMMON_GO_BACK';

  String get coreCommonRequiredItems => 'CORE_COMMON_REQUIRED_ITEMS';

  String get min2CharsRequired => 'MIN_2_CHARS_REQUIRED';

  String get maxCharsRequired => 'MAX_CHARS_ALLOWED';

  String get noResultsFound => 'NO_RESULTS_FOUND';

  String get coreCommonSyncInProgress => 'CORE_COMMON_SYNC_IN_PROGRESS';

  String get facilitySearchHeaderLabel => 'FACILITY_SEARCH_HEADER_LABEL';

  String get coreCommonDownload => 'CORE_COMMON_DOWNLOAD';
  String get coreCommonDownloadFailed => 'CORE_COMMON_DOWNLOAD_FAILED';
  String get noMatchFound => 'CORE_COMMON_NO_MATCH_FOUND';
}

class Splash {
  const Splash();

  String get title => 'ON Courts Kollam';
  String get getStartedOnMobile => 'Get Started on Desktop';
  String get optimizedExperience =>
      'This experience has been optimized for desktop. ';
  String get tellABitAboutSelf => 'Tell us a bit about yourself';
  String get tellABitAboutSelfDetail =>
      'This will help us streamline a few things and personalise your experience';
}

class OnBoarding {
  const OnBoarding();

  String get back => 'Back';
  String get help => 'Help';
  String get continueText => 'Continue';
  String get iAmLitigant => 'I’m a litigant';
  String get iAmLitigantDesc =>
      'I have to file a complaint, join a case, or have a complaint against me';
  String get iAmAdvocate => 'I’m an advocate';
  String get iAmAdvocateDesc =>
      'I’m professionally qualified to plead the cause of another in a court of law';
  String get iAmAdvocateClerk => 'I’m an advocate’s clerk';
  String get iAmAdvocateClerkDesc =>
      'I organise the daily workload and administration for a group of advocates ';
  String get selectOption => 'Select an option';
  String get pleaseEnterMobile => 'Please enter your mobile number';
  String get pleaseEnterMobileDesc =>
      'You will use this as your log in. We will send you an OTP to verify';
  String get getOtp => 'Get OTP';
  String get mobileNo => 'Mobile No';
  String get verifyOtp => 'Verify Mobile Number';
  String get verifyOtpDesc => 'Enter the OTP sent to ';
  String get verify => 'Verify';
  String get requestOtp => 'Request a new otp in 0.25';
  String get advocateVerification => 'Advocate Verification';
  String get advocateVerificationDesc =>
      'To ensure the authenticity of your profile, please provide the following details for us to verify';
  String get stateOfRegistration => 'State of registration';
  String get barRegNo => 'BAR registration number';
  String get uploadBarCounsilId => 'Upload BAR counsil ID';
  String get upload => 'Upload';
  String get enterYourName => 'Enter your name as per official documents';
  String get enterYourNameDesc =>
      'This ensures seamless verification to maintain compliance with official records ';
  String get firstName => 'First Name';
  String get middleName => 'Middle Name';
  String get lastName => 'Last Name';
  String get optional => 'Optional';
  String get enterYourEmail => 'Enter your Email ID';
  String get enterYourEmailDesc =>
      'This is to ensure that you receive all case related updates';
  String get emailId => 'Email ID';
  String get enterYourAddress => 'Enter your address';
  String get searchBuildingStreet => 'Search for a building, street, or area';
  String get pinCode => 'Pincode';
  String get state => 'State';
  String get district => 'District';
  String get cityTown => 'City / town';
  String get locality => 'Locality / Street Name / Area';
  String get building => 'Building Name / Door number ';
  String get verifyIdentity => 'Verify your Identity';
  String get verifyIdentityDesc =>
      "Before diving in, we'll need to verify your identity for account setup ";
  String get aadhaar => 'Aadhaar (Recommended)';
  String get aadhaarDesc =>
      'An instant verification that will provide a verified status against your profile ';
  String get otherId => 'Other ID';
  String get otherIdDesc => 'Manual verification by uploading government ID';
  String get enterAadhaarNumber => 'Enter your Aadhaar Number';
  String get enterAadhaarNumberDesc =>
      'Please enter your 12 digit Aadhaar number ';
  String get verifyYourAadhaar => 'Verify your Aadhaar';
}
