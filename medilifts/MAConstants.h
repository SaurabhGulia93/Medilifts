//
//  MAConstants.h
//
//  Created by Nishit Sharma on 1/21/15.
//

#ifndef MyAirtel_MAConstants_h
#define MyAirtel_MAConstants_h

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define ShowSystemAlert NO
typedef enum {
    MAContainerModeNone = 0,
    MAContainerModeSideMenu = 1,
    MAContainerModeNoneHomeTabBarHidden = 3,
} MAContainerMode ;

typedef enum : NSUInteger {
    kMAAddService,
    kMANotification,
    kMASettings,
    kMAIWantTo
} MABottonBarOptions;

typedef enum : NSUInteger {
    MANewProductAdditionTypeEnterNumber = 0,
    MANewProductAdditionTypeConfirmRTN = 1,
    MANewProductAdditionTypeEnterOTP = 2,
    MANewProductAdditionTypeComplete = 3
} MANewProductAdditionType;

typedef enum : NSUInteger {
    kMASideAddAccount,
    kMASideBuyProduct,
    kMASideNotifications,
    kMASideTransactionHistory,
    kMASideSettings,
    kMASideAboutUs,
    kMASideSupport,
    kMASideLogout
} MASideMenu;

typedef enum {
    MARateUSTransactionRatingType = 0,
    MARateUSGlobalRatingType = 1,
} MARateUSRatingType;

typedef enum : NSUInteger {
    MASubmitButton,
    MAConfirmButton,
    MAResendOTPButton
} MARegistrationButtonType;

typedef enum : NSUInteger {
    MAPureOTTUserNone = -1,
    MAPureOTTUser = 0,
    MANormalAirtelUser
} MAOTTUserType;

typedef enum : NSUInteger {
    MAButtonPositionLeft,
    MAButtonPositionRight,
    MAButtonPositionTop,
    MAButtonPositionBottom
} MABottomBarButtonImagePositionType;

typedef enum : NSUInteger {
    MAWantToTypeRecharge,
    MAWantToTypeBuy,
    MAWantToTypeView,
    MAWantToTypeAdd,
    MAWantToTypeRaise,
    MAWantToTypeManage,
    MAWantToTypeEmail,
    MAWantToTypeRecord,
    MAWantToTypeOrderChange
} MAIWantToChoices;

typedef enum : NSUInteger {
    MAMyBalanceAllPacksButton,
    MAMyBalanceRechargeButton,
    MAMyBalanceUnlockPromoButton
} MAMyBalanceButtonType;

typedef enum : NSUInteger {
    MANewServiceNotStarted,
    MANewServiceInProgress,
    MANewServiceSubmitted
} MANewServiceRequestStatus;

typedef enum : NSUInteger {
    MANewPrepaidProduct,
    MANewPostpaidProduct,
    MANewDTHProduct,
    MANewLandLineProduct,
    MANewDongleProduct
} MAAddNewProductType;

typedef enum : NSUInteger {
    MAPostPaidBillHistory = 0,
    MADTHRechargeHistory = 1,
    MAOrderMoviesHistory = 2,
    MADSLBillHistory = 3,
    MALandLineBillHistory = 4,
    MAPrepaidHistory = 5,
    MAGlobalTransactionHistory = 6,
    MAAirtelMoneyHistory = 7,
    MAReferFriendHistory = 8
} MAHistoryType;

typedef enum : NSUInteger {
    MARentalPlans = 0,
    MATopUpPlans
} MAIRPlans;

typedef enum : NSUInteger {
    MAMyPlanOptionModeNone = -1,
    MAMonthlyRentalMode = 0,
    MAChooseMyPacksMode,
    MAMyBoosterMode
} MAMyPlanOptionsModeType;

typedef enum : NSUInteger {
    MALOBUnknown = -1,
    MALOBGeneric = 0,
    MAPrepaidLOB = 1,
    MAPostpaidLOB = 2,
    MADTHLOB = 3,
    MALandLineLOB = 4,
    MADSLLOB = 5,
    MAWalletLOB = 6,
    MADataCardPrepaidLOB = 7,
    MADataCardPostpaidLOB = 8,
    MAReferFriendLOB = 9
} MAProductLOBType;

typedef enum : NSUInteger {
    MAPaymentModeUnknown = -1,
    MAPaymentModePayViaBalance = 0,
    MAPaymentModeBookNow = 1,
    MAPaymentModeAdvanceLoan = 2,
    MAPaymentModePaymentGateWay = 3,
} MAPaymentModeType;

typedef enum : NSUInteger {
    MAAPIStatusNone = -1,
    MAAPIStatusSuccess = 0,
    MAAPIStatusFailure,
    MAAPIStatusTimeout
} MAAPIStatusType;

typedef enum : NSUInteger {
    MAPaymentOptionNone = -1,
    MAPaymentOptionSavedCards = 0,
    MAPaymentOptionCreditCard = 1,
    MAPaymentOptionDebitCard = 2,
    MAPaymentOptionNetBanking = 3,
    MAPaymentOptionAirtelMoney = 4,
    MAPaymentOptionPayViaBalance = 5,
    MAPaymentOptionPayViaAdvanceLoan = 6,
    MAPaymentOptionPayViaBookNow = 7,
    MAPaymentOptionPaytmWallet = 8,
} MAPaymentOptionType;

typedef enum {
    CreditCardTypeNone = 0,
    CreditCardTypeVisa = 1,
    CreditCardTypeMasterCard = 2,
    CreditCardTypeAmericanExpress = 3,
    CreditCardTypeDiscover = 4,
    CreditCardTypeDiners = 5,
    CreditCardTypeMaestro = 6,
    CreditCardTypeRupay = 7
} CreditCardType;

typedef enum : NSUInteger {
    MAPrepaidProductPackTypeCalling  = 1,
    MAPrepaidProductPackType2G  = 27,
    MAPrepaidProductPackType3G = 28,
    MAPrepaidProductPackTypeSMS = 32,
    MAPrepaidProductPackTypeTalktime = 37,
    MAPrepaidProductPackTypeDailyPass = 5,
    MAPrepaidProductPackTypeNightStore = 8
} MAPrepaidProductPackType;


typedef enum : NSUInteger {
    MATransactionTypeUnknown = -1,
    MATransactionTypeCredit =1,
    MATransactionTypeDebit =2
} MAWalletTransactionType;

typedef enum {
    MATFTitleModeDefault = 0,
    MATFTitleModeIWT = 1,
    MATFTitleModeNoTitle = 2,
    MATFTitleModeBigTitle = 3,
    MAREferCodeEnterScreen = 4
} MATFTitleMode;

typedef enum{
    MATransactionProcessing = 0,
    MATransactionProcessingDone = 1
} TransactionProcessType;

typedef enum{
    NotLoading = 0,
    Loading = 1
} LoadingType;

typedef enum {
    MAFirstName = 0,
    MALastName = 1,
    MAPhoneNumber = 2,
    MADOB = 3,
    MAEmail = 4
} MALoginTextFieldType;

typedef enum {
    MAMyPlanFirstName = 0,
//    MAMyPlanDOB,
    MAMyPlanEmail,
    MAMyPlanPhoneNumber,
    MAMyPlanAddress,
    MAMyPlanState,
    MAMyPlanCity,
    MAMyPlanPinCode,
    MAMyPlanDOB
} MAMyPlanConfirmType;

typedef enum {
    MA4gSimRequestName = 0,
    MA4gSimRequestPhoneNumber,
    MA4gSimRequestEmail,
    MA4gSimRequestCity,
    MA4gSimRequestAddress,
    MA4gSimRequestPinCode,
} MA4gSimRequest;

typedef enum {
    MAPrepaidRecharge = 0,
    MADTHRecharge = 1,
    MADataCardRecharge = 2
} MARechargeType;

typedef enum {
    MAPayBillsPostpaid = 0,
    MAPayBillsLandline = 1,
    MAPayBillsDataCard = 2,
    MAPayBillsElectricity = 3,
    MAPayBillsInsutance = 4
} MAPayBillsType;

typedef enum {
    MAUtilityElectricity = 0,
    MAUtilityInsurance = 1
} MAUtilityType;

typedef enum {
    MACategoryNone = -1,
    MARechargeCategory = 0,
    MABillsCategory = 1,
    MAUtilityCategory = 2
} MACategoryType;

typedef enum {
    MACategorySubTypeNone = -1,
    MARechargePrepaidSubtype = 0,
    MARechargeDTHSubtype,
    MARechargeDataCardSubtype,
    MAPayBillPostpaidSubtype,
    MAPayBillLandLineSubtype,
    MAPayBillDataCardSubtype,
    MAUtilityElectricitySubtype,
    MAUtilityInsuranceSubtype
} MACategorySubType;

typedef enum {
    MASendMoney = 0,
    MARequestMoney = 1,
    MAPayToShops = 2
} MAPayToContactsMode;

typedef enum : NSUInteger {
    MAPaymentOption = 0,
    MAPaymentGateway = 1,
    MAPaymentCardDetails = 2,
} MAPaymentEvent;

typedef enum {
    WPPreselectedPaymentModeAM = 0,
    WPPreselectedPaymentModeCard = 1,
    WPPreselectedPaymentModeNB = 2
} WPPreselectedPaymentMode;

typedef enum {
    MARadioButtonMode = 0,
    MNormalButtonMode = 1,
} MARadioCellButtonMode;

typedef enum : NSUInteger {
    MADTHRechargeHistoryFragment ,
    MADTHMyPackage,
    MADTHMyTopup,
    MADTHBuyTopup,
    MAOrderMovies,
    MAMovieDetails,
    MABuyMovie,
    MAMovieHistory,
    MADTHGames,
    MADTHBuyGames,
    MAProgamGuide,
    MAChannelDetails,
    MAChannelRecord,
    MADTHManageServices,
    MADTHServiceRequest,
    MADTHNewRequest,
    MADTHRequestSubmission,
} MADTHFragment;

typedef enum{
    
    MANewServices = 0,
    MAActiveServices
}MAVASServices;

typedef enum {
    MAWebRequestTypeGet = 0,
    MAWebRequestTypePost = 1,
    MAWebRequestTypePut = 2,
    MAWebRequestTypeDelete = 3
} MAWebRequestType;

typedef enum : NSUInteger {
    MAMyPlanNormalSummaryMode = 0,
    MAMyPlanLatestSummaryMode,
    MAMyPlanOldSummaryMode
} MAMyPlanSummaryModeType;


#define kPrepaidCat @"PREPAID"
#define kMobileCat @"MOBILE"
#define kDTHCat @"DTH"
#define kDataCardCat @"DATACARD"
#define kPostpaidCat @"POSTPAID"
#define kLandlineCat @"LANDLINE"
#define kUtilityCat @"LANDLINE"
#define kInsuranceCat @"INSURANCE"

#define kOneDay 86400
#define kRupeeValue @"\u20B9"
#define kAppBuildNumberKey @"appVersion"

#define kMALoginCompletedNotificationKey @"myAirtelLoginCompletedNotificationKey"
#define kWalletRegistrationNotificationKey @"walletRegistrationDone"
#define kProductListUpdatedNotificationKey @"productListUpdated"
#define kRefereshIndividualProductNotificationKey @"refershIndividualProduct"
#define kHideFabIconIfNeededNotificationKey @"hideFabIconIfNeeded"
#define kUpdateAlertNotificationKey @"updateAlert"
#define kUserOTTStateUpdatedNotificationKey @"userOTTStateUpdated"
#define kForceUpdateAfterLoginKey @"forceUpdateAfterLogin"
#define kProductListUpdatedAfterDeletionNotificationKey @"productListUpdatedAfterDeletion"
#define kProductListUpdatedForSettingsKey @"productListUpdatedForSettings"
#define kUpdateNotificationsBadge @"updateNotificationsBadge"
#define kMyPlanCreationCompletedKey @"MyPlanCreationCompleted"
#define kVASUpdatedNotificationKey @"kVASUpdatedNotificationKey"
#define kActiveServiceRequestNotificationKey @"kActiveServiceRequestNotificationKey"
#define kPaymentCompletedNotification @"kPaymentCompletedNotification"
#define kUpdateOntificationInbox @"updateNotificationInbox"
#define kContinueMerchantOffersKey @"continueMerchantOffersNotificationKey"
#define kActivePlansUpdatedNotificationKey @"activePlansUpdatedNotificationKey"

#define kHamBurgerMenuNotificationKey @"hamBurgerMenuItemUpdated"

#define kNotificationHelpKey @"kNotificationHelpKey"

#define kAddressBookUpdatedExternallyKey @"AddressBookUpdatedExternally"

#define kPushNotificationHideFabView @"PushNotificationHideFabView"
#define kPushNotificationUpdate100MBGenericTile @"PushNotificationUpdate100MBGenericTile"
#define kPushNotificationUpdateGenericTile @"PushNotificationUpdateGenericTile"
#define kPushNotificationUpdateSettingsKey @"PushNotificationUpdateSettings"
#define kPushNotificationReceivedKey @"PushNotificationReceived"
#define kPushNotificationDeviceTokenKey @"kPushNotificationDeviceTokenKey"
#define kPushNotificaitonStatusKey @"kPushNotificaitonStatusKey"
#define kLanguageOptionSavedStatusKey @"languageOptionSaved"
#define kCanRegisterForRemoteNotificationKey @"kCanRegisterForRemoteNotificationKey"
#define kMenuHeaderTappedLoadMoneyNotification @"MenuHeaderTappedLoadMoneyNotification"

#define kSISNumberKey @"number_key"
#define kForceUpdateInfoKey @"force_updateInfo"
#define kForceUpdateDisplayInfoKey @"force_update_displayInfo"
#define kForceUpdateDisplayOptionKey @"force_update_display_options"
#define kForceUpdateAppVersionKey @"force_update_app_version"
#define kForceUpdateTimerKey @"force_update_timer"

#define kGenericTileRechargeModuleType @"recharge_number"
#define kGenericTileWebModuleType @"web"
#define kGenericTileBuyProductModuleType @"buy_product"
#define kGenericTileMarketModuleType @"market"
#define kGenericTileMyWalletModuleType @"my_wallet"
#define kGenericTilePayBills @"pay_bill"
#define kGenericTileSplitBills @"split_bill"
#define kGenericTileRechargeAnyNumber @"recharge_any_no"
#define kGenericTilePayToContacts @"pay_to_contacts"
#define kGenericTileRequestFromContacts @"request_from_contacts"

#define kExpectedDailyUsage @"EXPECTED DAILY USAGE"
#define kPrepaidAllPacksDataResponseKey @"prepaidAllPacksDataResponseKey"
#define kNoRecordsMessage @"Currently no records available."
#define KPrepaidRechargeHistoryNoRecordMessage @"You don't seem to have transacted on the app."

#define kCustomBirthdayTileType @"BIRTHDAY_TILE"
#define kCustomFirstRechargeTileType @"FIRST_RECHARGE_TILE"
#define kDOBTileType @"DOB_EMAIL_REQUIRE_TILE"
#define kOtherRechargeTileType @"OTHER_RECHARGE_TILE"
#define kNightCashbackOfferTileType @"NIGHT_CASH_BACK"

#define kOfflineMessage @"You internet connection appears to be offline."
#define kOnlineMessage @"You are online. Enjoy My Airtel!."

#define hourMinuteFormat @"hh:mm"
#define defaultTimeFormat @"dd-MM-yyyy"
#define creditLimitTimeFormat @"dd-MMM"
#define paymentHistoryTimeFormat @"dd-MMM-yyyy"
#define dobTimeFormat @"ddMMyyyy"
#define defaultDateWithTimeFormat @"dd-MMM-yyyy hh:mm:ss"
#define defaultServerDateFormat @"dd-MM-yyyy"
#define kTHNDateFormat @"MMM d, yyyy hh:mm:ss a"
#define kBillDateFormat @"dd//MM//yyyy"

#define kWPPOSIXLocale  [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]

#define faqURL @"http://www.airtellive.com/myairtel/faq.jsp"
#define aboutURL @"http://www.airtellive.com/myairtel/about.jsp"
#define termUrl @"http://www.airtellive.com/myairtel/terms.pdf"
#define policyUrl @"http://www.airtel.in/forme/privacy-policy"
#define feedbackEmail @"myairtel.app@airtel.com"
#define kMAMyConversionID @"1003150295"


#define kPGInvalidTokenErrorCode @"1909"

#define kContactUsPage @"http://m.airtellive.com/myairtel/contact.jsp"

#define kRequestFailedForRegistrationCode -101
#define kPGPayViaBalanceErrorCode 114
#define kResponseSuccessCode 0
#define kIndiaCode @"+91"
#define kAllIndiaCircleValue @"ALLINDIA"

#define k001LanguageValue @"001"
#define kPaymentSessionKeyLength 10
#define kGraphWidth 150.0
#define kChannelIDName @"myairtel"
#define kChannelName @"myairtel"
#define kVersionKey @"ver"
#define kLoginIDKey @"loginId"
#define kClientKey @"client"
#define kCircleKey @"circle"
#define kUIDKey @"uid"
#define kLanguageIdKey @"languageId"
#define kFesessionIdKey @"feSessionId"
#define kPureOTTUserKey @"isPureOttUser"
#define kShowReferralKey @"showReferral"
#define kSignatureKey @"signature"
#define kPGChannelIDKey @"channel-id"
#define kModeKey @"mode"
#define kAuthTokenKey @"accessToken"
#define kPGAccessTokenKey @"access-token"
#define kMSISDNKey @"msisdn"
#define kLoadAmountKey @"loadAmount"
#define kOperationNameKey @"operationName"
#define kChannelKey @"channel"
#define kCustomerTypeKey @"customerType"
#define kResponseURLKey @"responseURL"
#define kTimeKey @"time"
#define kControlInfoKey @"controlInfo"
#define kBusinessInputKey @"businessInput"
#define kPaymentServiceKey @"paymentService"
#define kLobIDKey @"lobId"
#define kPGLoginIDKey @"loginId"
#define kTransactionTypeKey @"transactionType"
#define kPayEmailIdKey @"payEmailId"
#define kServiceInstanceKey @"serviceInstance"
#define kAccountNoKey @"accountNo"
#define kPaymentResponsibleAccountNoKey @"paymentResponsibleAccountNo"
#define kUserGroupTypeKey @"userGroupType"
#define kUserTypeKey @"userType"
#define kCircleIDKey @"circleId"
#define kServiceTypeKey @"serviceType"
#define kPackageNameKey @"packageName"
#define kPayAmountKey @"payAmount"
#define kRechargeTypeKey @"rechargeType"
#define kRechargeCategoryKey @"rechargeCategory"
#define kPaymentModeKey @"paymentMode"
#define kCardDetailsKey @"cardDetails"
#define kSavedCardDetailsKey @"savedCardDetails"
#define kCardNoKey @"cardNo"
#define kNameOnCardKey @"nameOnCard"
#define kCardExpiryDate @"expiryDate"
#define kCardExpiryMonthKey @"expiryMonth"
#define kCardExpiryYearKey @"expiryYear"
#define kCardCVVKey @"cvv"
#define kCardTypeKey @"cardType"
#define kCardBankNameKey @"cardBank"
#define kSaveCardFlagKey @"saveCardFlag"
#define kBankNameKey @"bankName"
#define kStateNameKey @"stateName"
#define kCardRefNoKey @"cardRefNo"
#define kMaskedCardNoKey @"maskedCardNo"
#define kWalletIdKey @"walletId"
#define kWalletDetailsKey @"WalletDetails"

#define kPaymentoptionSavedCards @"SC"
#define kPaymentoptionCreditCard @"C"
#define kPaymentoptionDebitCard @"DC"
#define kPaymentoptionNetBanking @"D"
#define kPaymentoptionAirtelMoney @"AM"
#define kPaymentoptionMarketWallet @"W"

#define kMAPaytmMarketWalletTypeCode @"21"
#define kMACallbackReponseTypeJSONCode @"1"

#define kPaymentoptionPostpaidLOB @"1"
#define kPaymentoptionPrepaidLOB @"11"
#define kPaymentoptionTelemediaLOB @"2"
#define kPaymentoptionDTHLOB @"5"
#define kPaymentoptionAirtelMoneyLOB @"15"

#define kPostpaidCustomerType @"Postpaid"
#define kPrepaidCustomerType @"Prepaid"
#define kDSLCustomerType @"DSL"
#define kLandlineCustomerType @"Landline"
#define kAirtelMoneyCustomerType @"AirtelMoney"
#define kDTHCustomerType @"DTH"

#define kPaytmWalletType @"PAYTM"

#define kPostpaidLob @"postpaid"
#define kPrepaidLob @"prepaid"
#define kDSLLob @"dsl"
#define kGenericLob @"generic"
#define kLandlineLob @"landline"
#define kAirtelMoneyLob @"money"
#define kDTHLob @"dth"
#define kDataCardLob @"datacard"
#define kBroadbandLob @"broadband"
#define kOmnitureDefaultValue @"NA"
#define kBillerCodeId @"billerId"
#define ktaxComp1Key @"taxComp1"
#define ktaxComp2Key @"taxComp2"
#define ktaxComp3Key @"taxComp3"
#define kBillDateKey @"billDate"
#define kBillDueDateKey @"billDueDate"
#define ktxnChargeDetailsKey @"txnChargeDetails"

#define kPaymentoptionTransactionTypeBillPayment @"bill payment"
#define kPaymentoptionTransactionTypeRecharge @"recharge"

#define kLoginAppTag @"MyAirtelLogin"
#define kAppTag @"MyAirtel1"
#define ktripleDESKey @"qwertselfbillpay12345678"

#define imageDataKey @"imageData"
#define indexPathKey @"indexpath"
#define kDefaultDisplayValue MALocalisedStringForKey(@"n_a")
#define kDTHCircleIDValue @"2870"
#define kXHDPIValue @"xhdpi"
#define kXXHDPIValue @"xxhdpi"

#define kMyDalaImageAspectRatioMerchantOffer 1.635
#define kMyDalaImageAspectRatio 2.35
#define kMyDalaFolderKey @"MYDALA"

#define kCouponType1 @"COUPON"
#define kCouponType2 @"MAMO"
#define kCouponType3 @"PROMO"

#define kRateViewShownKey @"rateViewShown"


// Airtel Money keys //

#define kDateOfBirthResetMpinFormat @"dd MMM yyyy"
#define kWalletRegistrationKey @"walletRegistration"
#define kWalletCreationKey @"walletCreated"


// MPIN Keys

#define kResetMpinFirstNameKey @"firstName"
#define kResetMpinLastNameKey @"lastName"
#define kDateOfBirthKey @"dateOfBirth"
#define kResetMPINLastTransactionAmountKey @"lastTxnAmt"

//Change MPIN keys

#define kCurrentMPINKey @"currentMPIN"
#define kNewMPINKey @"newMPIN"
#define kReEnterMPINKey @"repeatNewMPIN"
#define kCategoryValue @"CUST"

// recharge keys

#define kP2PTransactionIdKey @"ampTxnId"
#define kTransactionDateKey @"txnDate"
#define kTransactionTimeKey @"txnTime"

// table acknowledgment controller

#define kAcknowledgementNumberKey @"Number"
#define kAcknowledgementReferenceNumberKey @"Ref. No."
#define kAcknowledgementPaymentKey @"Amount"
#define kAcknowledgementDateKey @"Date"
#define kAcknowledgementTimeKey @"Time"
#define kAcknowledgementBillerNameKey @"Biller"
#define kAcknowledgementBillType @"Bill Type"
#define kAcknowledgementCurrentWalletBalance @"Wallet balance"

#define kAcknowledgementMobileNumberKey @"Mobile Number"
#define kAcknowledgementTalktimeAmtKey @"Advance Talktime"
#define kAcknowledgementRecoverAmtKey @"Recovery Amount"
#define kAcknowledgementTransactionIdKey @"Transaction Id"
#define kAcknowledgementTransactionDateKey @"Transaction Date"
#define kAcknowledgementGiftTalktimeAmtKey @"Recharge Amount"
#define kAcknowledgementAdvanceAmtKey @"Advance Amount"

#define kUserProfileUpdatedNotificationKey @"userProfileUpdated"
#define kAMLoginCompletedNotificationKey @"airtelMoneyLoginCompleted"
#define kMAPushNotificationDataSavedNotificationKey @"pushNotificationDataSaved"
#define kUserLoginNotificationKey @"userLogin"

#define kDeviceIdKey @"deviceId"
#define kUserLoginSkipKey @"loginSkip"
#define kCustomerIdKey @"customerId"
#define kTimeStampKey @"timestamp"
#define kUserBalanceKey @"currentBalance"
#define kAMUserNameKey @"firstName"
#define kAMUserLastNameKey @"lastName"
#define kAMUserDOBKey @"dateOfBirth"
#define kAMUserEmailKey @"useremail"
#define kProfileInfoKey @"profileInfo"
#define kUserRegisterStateKey @"userRegisterState"
#define kPureOTTUserStateKey @"pureOTTUserStateKey"
#define kFieldsKey @"fields"
#define kVersionValue @"1.0"
#define kCurrentBalanceKey @"currentBalance"
#define kFavoriteIdKey @"favoriteId"

#define kConfirmMpinKey @"confirmMpin"
#define kMpinKey @"mpin"
#define kDobKey @"dob"
#define kEmailKey @"email"
#define kFirstNameKey @"fname"
#define kLastNameKey @"lname"
#define kModeFullValue @"FULL"

#define kRegisteredDeviceIdKey @"registeredDeviceId"

// send money to bank keys //

#define ktransferBankName @"transferBankName"
#define kIFSCCodeKey @"ifscCode"
#define kTransferAmountKey @"transferAmount"
#define kAccountNumberKey @"accountNumber"
#define kBeneficiaryNumber @"beneficiaryNumber"
#define kSubCatID @"subCategoryId"
#define kAccountNameKey @"accountName"

#define kIsImpsFlagKey @"isIMPS"

//P2P KEYS//

#define kMobileNumberToBeTransferredKey @"kMobileNumberToBeTransferredKey"
#define kTransferAmmountKey @"transferAmount"
#define kRequestIdKey @"requestId"
#define kNotificationRequestIdKey @"requestId"
#define kBeneficiaryMobileNoKey @"beneMobNo"

//P2B
#define kMerchantIdKey @"merchantId"
#define kPaymentRemarksKey @"paymentRemarks"

// transfer keys

#define kBeneficiaryAccNoKey @"beneAccNo"
#define kIFSCKey @"ifsc"
#define kBeneficiaryNameKey @"beneName"
#define kAmountToBeTransferredKey @"amount"


// RECHARGE KEYS //

#define kBillerKey @"biller"
#define kCustomerAuthTypeKey @"customerAuthType"
#define kCustomerAuthValueKey @"customerAuthValue"
#define kPaymentAmtKey @"paymentAmt"
#define kReference1Key @"reference1"
#define kReference2Key @"reference2"
#define kReference3Key @"reference3"
#define kReference4Key @"reference4"
#define kReference5Key @"reference5"

#define kBillAmountKey @"billAmount"
#define kAuthenticator1Key @"authenticator1"

#define kLatitudeKey @"latitude"
#define kLongitudeKey @"longitude"
#define kCouponsKey @"coupons"
#define kExtraParams @"extraPamams"
#define kTelcoOperatorCode @"telco_operatorCode"
#define kTelcoBillNumber @"telco_billNumber"
#define ktelcoAmount @"telco_amount"
#define kTelcoBillName @"telco_billName"
#define kTelcoBillDueDate @"telco_BillDueDate"

// Transaction History Keys //

#define kWPFromDateKey @"fromDate"
#define kWPCRDRKey @"crDr"
#define kWPFromAmountKey @"fromAmt"
#define kWPToDateKey @"toDate"
#define kWPToAmountKey @"toAmt"
#define kPackTransactionMessageKey @"offerPurchaseMessage"
#define kPackTransactionStatusKey @"offerPurchaseStatus"

#define kCUSTValue @"CUST"
#define kRETValue @"RET"
#define kMERTValue @"MERT"

#define kMPINValue @"MPIN"
#define kChannelValue @"IOS"
#define kCategoryKey @"category"
#define kChannelKey @"channel"
#define kCircleAliasKey @"circleAlias"
#define kOperatorAliasKey @"operatorAlias"

#define kCurrentMPINKey @"currentMPIN"
#define kNewMPINKey @"newMPIN"
#define kReEnterMPINKey @"repeatNewMPIN"
#define kCategoryValue @"CUST"

#define kALLValue @"ALL"

#define kNoDataFoundKey @"3"
#define kUserReplacedInSystemCodeValue @"1111"

#define kMpinExpiredErrorCodeValue @"99146"
#define kMpin3ConsecutiveWrongValue @"99145"
#define kUserBlockedValue @"78046"
#define kSessionExpiredErrorCodeValue @"999998"
#define kNewUserErrorCodeValue @"65006"
#define kNoTransactionValue @"55004"
#define kMPINErrorValue @"99105"

#define kLowUserBalanceErrorCode @"78014"

#define kCurrentCustomerID [MAAccountManager getDataForKey:kCustomerIdKey]
#define kCustomerId10Digit [MAAccountManager getTenDigitPhoneNumberFrom:kCurrentCustomerID]
#define kCustomerIDCountryCodeFormatted [MAAccountManager getCountryCodeAppendedPhoneNumberFrom:kCurrentCustomerID]
#define kCurrentDeviceID [MAAccountManager getDataForKey:kDeviceIdKey]

//#define GET_USER_PROFILE        @"getUserProfile.action"
#define FETCH_ACCOUNTSTATEMENT  @"api_account_statement"
//#define NEW_REGISTRATION_PATH   @"registerUser.action"
#define CHANGE_MPIN_PATH        @"api_change_mpin"
#define RESET_ENDPOINT          @"api_reset_mpin"
//#define PAY_BILL_PATH           @"payBill.action"
#define FETCH_BILL_PATH         @"api_billfetch"
#define GET_CHARGES             @"api_get_charges"
#define GET_IFSCCODE_LIST       @"api_search_ifsc"
#define STORED_CARDS            @"api_stored_cards"
#define FETCH_FAVORITES         @"api_fetch_favorites"//@"fetchFavorites.action"
#define GET_NOTIFICATIONS       @"api_pending_request"
#define REQUEST_MONEY           @"api_request_money"
#define GET_PACK_INFO           @"api_browse_plans"
#define UPDATE_REQUEST          @"api_update_money_request"
#define GET_NEARME_ACTORS       @"api_nearby_actors"
#define SENDMONEY_TOBankNEFT    @"api_neft"
#define SENDMONEY_TOBankIMPS    @"api_imps"


// Send Money
#define SENDMONEY_TOAIRTEL      @"api_send_money"
#define SENDMONEY_Merchant      @"api_otc_pay"


#define kAnalyticsPrepaid @"prepaid"
#define kAnalyticsPostpaid @"postpaid"
#define kAnalyticsBrodband @"broadband"
#define kAnalyticsFixedLine @"fixedLine"
#define kAnalyticsDTH @"dth"
#define kAnalyticsGeneric @"generic"
#define kAnalyticsWallet @"money"




#define kAirtelLandlineBillerCode @"AIRTELLANDLINE"
#define kAirtelPostpaidBillerCode @"AIRTELPOSTPAID"
#define kAirtelPrepaidDataCardBillerCode @"AIRTELPREPAIDWDC"
#define kAirtelPostPaidDataCardBillerCode @"AIRTELWDC"
#define kAirtelDTHBillerCode @"AIRTELDTH"
#define kAirtelPrepaidBillerCode @"AIRTELPREPAID"

#define kTransactionHistoryDefaultDateRange 29
#define kTransactionHistoryYearDateRange 365

#define kMALoginNameAcceptableChars @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.- "

#define kMASimNumberAcceptableChars @"Uu1234567890"

#define kWalletHelpUserDefaultsKey @"kWalletHelpUserDefaultsKey"

#define kBarTextPostpaid @"POSTPAID"
#define kBarTextLandline @"LANDLINE"
#define kBarTextDatacard @"DATACARD"
#define kBarTextPaybillsHistory @"Transaction History"

#define kBarTextPrepaid @"PREPAID"
#define kBarTextDTH @"DTH"
#define kOPStatusErrorCode -7

// FAB Icon

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height

//#define SCREEN_WIDTH     [self superview].bounds.size.width
//#define SCREEN_HEIGHT    [self superview].bounds.size.height 

#define kFabIconSize 52
#define kFabOptionsButtonSize    44
#define kSidePAdding 20
#define kFabViewBeloPadding 20
#define kVerticalPAdding 15
#define kTitleOptionBetweenPadding 10

#define originX          SCREEN_WIDTH - kFabIconSize - kSidePAdding
#define originY          SCREEN_HEIGHT - kFabIconSize - kFabViewBeloPadding
#define optionButtonOriginX originX + (kFabIconSize/2 - kFabOptionsButtonSize/2)

#define GRAYFAB(x) [UIColor colorWithWhite:x alpha:0.90]



// nsstring + validations

#define kMinDigitsForPrepaidMobile 10
#define kMaxDigitsForPrepaidMobile 10
#define kMinDigitsForPrepaidDTH 8
#define kMaxDigitsForPrepaidDTH 12
#define kMinDigitsForPrepaidDataCard 10
#define kMaxDigitsForPrepaidDataCard 10

#define kMinDigitsForPostpaidMobile 10
#define kMaxDigitsForPostpaidMobile 10
#define kMinDigitsForLandlineMobile 10
#define kMaxDigitsForLandlineMobile 15
#define kMinDigitsForPostpaidDataCard 10
#define kMaxDigitsForPostpaidDataCard 10

#define kMaxDigitsForUtility 10
#define kMaxDigitsForInsurance 8

// split bills

#define kMaxNoteCharacters 200.0
#define kMinAmountForSplitBills 5000.0
#define kSplitBillMaxContactLimit 25
#define kPaisaVasoolMaxContact 4
#define kMinAmountForLoadMoneyInWallet 10.0

// Pay To Contacts Keys

#define kFavoriteListKey @"favoritelist"
#define kFavoriteKey @"favorite"

#define kP2PValue @"P2P"

#define kNotificationsListKey @"responseList"
#define kNotificationsResponseKey @"responseData"

#define kRequestToMeTypeKey @"type"
#define kRequestValue @"REQUEST"
#define kRequestAllTypeValue @"0"

#define kPendingValue @"Pending"
#define kSubCategoryKey @"subCategory"
#define kTransactionCategory @"transactionCategory"
#define kStatusKey @"status"

// Request Contact Keys //

#pragma mark - Request Contacts

#define kNotificationPendingKey @"PENDING"
#define kNotificationCompletedKey @"COMPLETED"

#define kMoneyRequestKey @"moneyRequest" // has array of WPRequestMoneyContactDetail objects//
#define kRequestMoneyListKey @"requestMoneyList"
#define kRemitterNumberKey @"remitterNumber"
#define kPaymentAmountKey @"paymentAmt"
#define kNoteKey @"notes"
#define kCountKey @"count"
#define kNotificationTypeKey @"notificationType"
#define kRequesterNameKey @"requesterName"

#define kPrepaidValue @"PREPAID"
#define kSendMoneyValue @"SENDMONEY"
#define kPostPaidValue @"POSTPAID"
#define kUtilityValue @"UTILITY"
#define kInsuranceValue @"INSURANCE"
#define kP2BValue @"P2B"
#define kBankAccountNumberKey @"ACCOUNTNO"
#define kALLValue @"ALL"
#define kPAYOTCValue @"PAYOTC"
#define kMobileValue @"MOBILE"

#define kIMPSValue @"IMPS"
#define kNEFTValue @"NEFT"

#define kDataCardValue @"DATACARD"
#define kThresholdBalance 100.0
#define kMaximumRowsInPastTransactions 3

// predefined images

#define kAirtelPrepaidDataCardValue @"AIRTELPREPAIDWDC"
#define kAirtelPostpaidDataCardValue @"AIRTELWDC"
#define kRecentAirtelImageName @"operator_airtel"
#define kAIRTELValue @"AIRTEL"

#define kIdeaValue @"idea"
#define kVodafoneValue @"voda"
#define kIdeaImageName @"operator_idea"
#define kVodafoneImageName @"operator_vodafone"

#define kPrepaidPhotonDataCardValue @"INDIWDCPREPAID"
#define kPostpaidPhotonDataCardValue @"INDIWDCPOSTPAID"
#define kRecentPhotonImageName @"recent_photon"

#define kRecentDataCardImageName @"recent_datacard"
#define kDTHValue @"DTH"
#define kRecentDTHImageName @"recent_DTH"

#define kNotificationIgnoredKey @"notificationIgnored"
#define kUserPaidToContactNotificationKey @"userPaidToContactNotificationKey"
#define kUserPaidToRequestNotificationKey @"userPaidToNotificationKey"
#define kNotificationHelpKey @"kNotificationHelpKey"
#define kTHSDateFormat @"dd MMM yyyy"

#define kCacheDefailtTTl @"10000"

// send to bank

#define kSendToBankNameKey @"BANKNAME"
#define kBankIFSCKey @"IFSC"
#define kBankAccountNumberKey @"ACCOUNTNO"
#define kBankBeneficiaryNameKey @"NAME"


#define kAirtelPrepaidDataCardValue @"AIRTELPREPAIDWDC"
#define kAirtelPostpaidDataCardValue @"AIRTELWDC"
#define kRecentAirtelImageName @"operator_airtel"
#define kAIRTELValue @"AIRTEL"

#define kIdeaValue @"idea"
#define kVodafoneValue @"voda"
#define kIdeaImageName @"operator_idea"
#define kVodafoneImageName @"operator_vodafone"

#define kPrepaidPhotonDataCardValue @"INDIWDCPREPAID"
#define kPostpaidPhotonDataCardValue @"INDIWDCPOSTPAID"
#define kRecentPhotonImageName @"recent_photon"

#define kRecentDataCardImageName @"recent_datacard"
#define kRecentElectricityImageName @"recent_electricity"
#define kRecentInsuranceImageName @"recent_insurance"
#define kRecentGasImageName @"recent_gas"
#define kRecentDTHImageName @"recent_DTH"
#define kRecentNetBanking @"recent_netbanking"

// Bank names

#define HDFCBankNameFromAPI @"HDFC BANK LTD"
#define AxisBankNameFromAPI @"AXIS BANK"
#define ICICIBankNameFrmAPI @"ICICI BANK LTD"
#define IDBIBankNameFromAPI @"IDBI BANK LTD"
#define BankOfBarodaNameFromAPI @"BANK OF BARODA"
#define KotakMahindraNameFromAPI @"KOTAK MAHINDRA BANK"

#define StateBankOfIndiaNameFromAPI @"STATE BANK OF INDIA"

#define AllahabadBankNameFromAPI @"ALLAHABAD BANK"
#define AndhraBankNameFromAPI @"ANDHRA BANK"
#define BankOfIndiaNameFromAPI @"BANK OF INDIA"
#define BankOfMaharashtraNameFromAPI @"BANK OF MAHARASHTRA"
#define BNPParibasNameFromAPI @"BNP PARIBAS"
#define CanaraBankNameFromAPI @"CANARA BANK"
#define CentralBankOfIndiaNameFromAPI @"CENTRAL BANK OF INDIA"
#define CitiBankNameFromAPI @"CITIBANK"
#define CorporationBankNameFromAPI @"CORPORATION BANK"
#define DBSBankNameFromAPI @"DBS BANK LTD"
#define DenaBankNameFromAPI @"DENA BANK"
#define DeutscheBankNameFromAPI @"DEUTSCHE BANK"
#define HSBCBankNameFromAPI @"HSBC"
#define IndianBankNameFromAPI @"INDIAN BANK"
#define IndianOverseasBankNameFromAPI @"INDIAN OVERSEAS BANK"
#define IndusIndBankNameFromAPI @"INDUSIND BANK LTD"
#define INGVysyaBankNameFromAPI @"ING VYSYA BANK LTD"
#define JPMorganChaseBankNameFromAPI @"JP MORGAN CHASE BANK"
#define OrientalBankOfCommerceNameFromAPI @"ORIENTAL BANK OF COMMERCE"
#define PunjabAndMaharashtraCoOpBankNameFromAPI @"PUNJAB AND MAHARASHTRA CO-OP BANK LTD"
#define PunjabAndSindBankNameFromAPI @"PUNJAB AND SIND BANK"
#define PunjabNationalBankNameFromAPI @"PUNJAB NATIONAL BANK"
#define ReserveBankOfIndiaNameFromAPI @"RESERVE BANK OF INDIA"
#define RoyalBankOfScotlandNameFromAPI @"THE ROYAL BANK OF SCOTLAND NV"
#define UCOBankNameFromAPI @"UCO BANK"
#define UnionBankOfIndiaNameFromAPI @"UNION BANK OF INDIA"
#define UnitedBankOfIndiaNameFromAPI @"UNITED BANK OF INDIA"
#define VijayaBankNameFromAPI @"VIJAYA BANK"
#define YesBankNameFromAPI @"YES BANK LTD"

// Cards Keys //

#define kProductsListKey @"ProductsList"
#define kPrimaryAccountKey @"PrimaryAccount"
#define kStaticRechargeKey @"StaticRecharge"
#define kFirstRechargeKey @"FirstRecharge"
#define kInstantRechargeKey @"InstantRecharge"
#define kOperatorsKey @"OperatorsKey"


#define kPastTransactionsRechargeKey @"PastTransactionsRecharge"
#define kPastTransactionsBillKey @"PastTransactionsBills"
#define kPastTransactionsUtilitiesKey @"PastTransactionsRechargeUtilities"
#define kPastTransactionsFundTransferKey @"PastTransactionsRechargeFundTransfer"

#define kNearbyUsersKey @"NearbyUsers"
#define kInstructionsKey @"Instructions"
#define kLowBalanceKey @"LowBalanceKey"
#define kEnableGpsKey @"EnableGPS"
#define kExploreUtility @"ExploreUtility"
#define kPayBillsMoney @"PayBillsMoney"
#define kTransactionNotificationKey1 @"TransactionNotification1"
#define kTransactionNotificationKey2 @"TransactionNotification2"
#define kTransactionNotificationKey3 @"TransactionNotification3"
#define kFree100MBKey @"Free100MBKey"
#define kGenericTileKey @"GenericTile"
#define kExclusiveOfferKey @"ExclusiveOfferKey"

#define kActorTypeKey @"actorType"
#define kShouldEraseLocation @"eraseLocation"


#define kBroadcastLocationNotificationKey @"broadcastLocationKey"
#define kUserLocationUpdatedNotificationKey @"userLocationUpdated"

#define kUserNearMeDateKey @"kUserNearMeDateKey"
#define kNotificationHelpKey @"kNotificationHelpKey"

extern NSString * const kDismissChildControllersNotification;

#define kDeleteCardNotificationKey @"deleteCardNotificationKey"

#define kLanguageChangeNotificationKey @"languageChangeNotificationKey"

// Near Me Keys //

#pragma mark - Near Me Keys

#define kNoofNeighboursKey @"noofNeighbours"
#define kNoofNeighboursValue @"10"
#define kRadiusKey @"radius"
#define kUnitKey @"unit"
#define kMileValueKey @"MILE"
#define kMeterValueKey @"METER"

#define kNearMeRadiusValue @"200"
#define kMerchantRadiusValue @"10000"

// Near Me actorsKey //

#define kActorListKey @"actorList"

#define kAddressBookFetchedNotificationKey @"addressBookFetchedNotification"

// Airtel Surprises

/*
 
 
 hi key are change
 "bsbCircle" is "c",
 "bsbPackType" is "da"
 "hfiCircle" will not send
 "amount" is "amt"
 "packId" is "id"
 
 */
#define kASMethod @"method"
#define kASUrl @"url"
#define kASType @"type"
#define kASBSBCircle @"c"
#define kASBSBPackType @"da"
#define kASHFICircle @"hfiCircle"
#define kASAmount @"amt"
#define kASPackID @"id"
#define kASHeaderType @"1"
#define kASPurchaseType @"2"

FOUNDATION_EXPORT NSString* const MADeeplinkManagerWillOpenDeeplinkNotification;

// Deeplinks Actions

#define kMyAccountDeepLink @"account"
#define kMainAccountDeepLink @"main_account"
#define kAppShareDeepLink @"share"
#define kADDAccountDeepLink @"add_account"
#define kBuyProductDeepLink @"buy_product"
#define kTransationDeepLink @"transactions"
#define kSettingsDeepLink @"settings"
#define kSupportDeepLink @"support"
#define kPaisaVasoolDeepLink @"family_share"
#define kNightCashBackDeepLink @"night_cashback"
#define kWebViewDeepLink @"webview"
#define kMyplanDeepLink @"myplan"
#define kAboutDeepLink @"about"
#define kAdvanceServicesDeepLink @"advance_services"
#define kRechargeAnyNumberDeepLink @"rechargePrepaid"
#define kSwipePageDeepLink @"swipe_pager"
#define kBrowsePlansDeepLink @"browse_plans"
#define kMakePaymentDeepLink @"payment"
#define kMakePaymentAmountDeepLink @"pay_amount"
#define kPromoDeepLink @"promo"
#define kWalletOptionsDeepLink @"wallet_actions"
#define kDeleteSavedCardDeepLink @"delete_saved_card"
#define kReferFriendDeepLink @"refer"
#define k4gSimSwapDeepLink @"sim_swap"
#define kFreedata @"freedata"
#define kCreateMyPlanDeepLink @"create_myplan"
#define kRateAppDeepLink @"rate_us"
#define kHboOfferDeepLink @"hbo_offer"



#define kAccountDetailsDeepLink @"account_details"
#define kMyBillDeepLink @"my_bill"
#define kBillPlanDeepLink @"bill_plan"
#define kBillDetailDeepLink @"bill_detail"
#define kConfigureServicesDeepLink @"configure_services"
#define kSmartBytesDeepLink @"smart_bytes"
#define kMyBalanceDeepLink @"my_balance"
#define kMyDataDeepLink @"my_data"
#define kActiveServicesDeepLink @"active_services"
#define kAppExclusiveDeepLink @"app_exclusive"
#define kHelpSupportDeepLink @"help_support"
#define kHelloTunesDeepLink @"hello_tunes"
#define kMyPackageDeepLink @"my_package"
#define kTopupDeepLink @"topup"
#define kOrderMoviesDeepLink @"order_movies"
#define kMoviesOrderHistoryDeepLink @"movies_order_history"
#define kMovieDetailsDeepLink @"mov_details"
#define kGamesDeepLink @"games"
#define kProgramGuideDeepLink @"program_guide"
#define kHelpFormDeepLink @"help_form"
#define kNameTunesDeepLink @"name_tunes"

#endif
