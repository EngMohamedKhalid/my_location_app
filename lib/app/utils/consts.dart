//
const String kBaseUrl = "waradly.app";
const String kBaseVersion = 'api/';
const String apiKey = 'AIzaSyBitrwdqjFcanUZ5j0hPV5W6-2ooMsI_Cg';
const String publishKey = 'pk_test_51NcYZ1IFBuxSP4IyHk35qI4RSKdmWyWl40XRt6T2SPc9OPo35cwnMJY0um0DwCChfDfyMD9Hiq7Ecn8PRttdrHP100XAw4bhFL';
const String secretKey = 'sk_test_51NcYZ1IFBuxSP4IyHPxRBxM7hwSNclM111B2vACftn35lmmhIw1Lyu1A1UkJ4AT08DWRULN37gUyZAXSdRKRnQ2v00hPaFnFsX';
//
// // end points
// const String kSignIn = 'sign-in';
// const String kSignUp = 'sign-up';
// const String kSignOut = 'sign-out';
// const String kResetPassword = 'reset-password';
// const String kVerifyOtp = 'check-code';
// const String kForgetPassword = 'forget-password-send-code';
// const String kActivateAccount = 'activate';
// const String kChangePassword = 'update-passward';
// const String kNotifications = 'notifications';
// const String kNotificationsCount = 'count-notifications';
// const String kDeleteAccount = 'delete-account';
// const String kUserHome = 'home';
// const String kProductDetails = 'product';
// const String kProfile = 'profile';
// const String kUpdateProfile = 'update-profile';
// const String kContactUs = 'contact-us';
// const String kChangeLanguage = 'change-lang';
// const String kUpdatePassword = 'update-passward';
// const String kListCommodities = 'commodities';
// const String kAddItemToCart = 'cart/add';
// const String kCarts = 'cart/list';
// const String kUpdateQuantity = 'cart/update';
// const String kRemoveItemFromCartCart = 'cart';
// const String kSaveItemForLater = 'cart/save-for-later';
// const String kAddItemToFavourite = 'favourites/add';
// const String kFavourite = 'favourites/list';
// const String kFavouritesUpdateQuantity = 'favourites/update';
// const String kRemoveItemFromFavourites = 'favourites';
// const String kSaveItemToCart = 'favourites/move-to-cart';
// const String kListAllCategories = 'list-categories';
// const String kListAllBestSelling = 'all-best-selling';
// const String kListAllBestOffers = 'all-best-offer';
// const String kListAllNewCollections= 'all-new-collection';
// const String kCategoryProducts= 'product-with-category';
// const String kSearchProduct= 'search-product';
// const String kCheckout= 'orders/check-out';
// const String kCheckCoupon= 'orders/check-coupon';
// const String kPlaceOrder= 'orders/place';
// const String kPInProgressOrder= 'orders/in-progress';
// const String kShippingOrder= 'orders/shipping';
// const String kDeliveredOrder= 'orders/delivered';
// const String kCancelledOrder= 'orders/canceled';
// const String kOrderDetails= 'orders';
// const String kCancelOrderItem= 'orders/cancel';
// const String kReviewOrderItem= 'orders/review-product';
// const String kGetAddresses= 'shipping-address/index';
// const String kAddAddress= 'shipping-address/create';
// const String kEditAddress= 'shipping-address/edit';
// const String kDeleteAddress= 'shipping-address';
 String userVID= '';
//
//Static Headers
 Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};