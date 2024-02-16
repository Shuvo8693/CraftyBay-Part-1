class Urls{
 // static const  String baseUrl="https://craftybay.teamrabbil.com/api";
  static const  String baseUrl_02="http://ecom-api.teamrabbil.com/api";
  static String userUrl(email)=>"$baseUrl_02/UserLogin/$email";
  static String verifyOtpUrl(email, otp)=>"$baseUrl_02/VerifyLogin/$email/$otp";
  static String readProfileUrl="$baseUrl_02/ReadProfile";
  static String createProfileUrl="$baseUrl_02/CreateProfile";
  static String bannerUrl="$baseUrl_02/ListProductSlider";
  static String allCategoryUrl="$baseUrl_02/CategoryList";
  static String newProductListUrl="$baseUrl_02/ListProductByRemark/new";
  static String popularProductListUrl="$baseUrl_02/ListProductByRemark/popular";
  static String specialProductListUrl="$baseUrl_02/ListProductByRemark/special";
  static String productCategoryUrl(int categoryId)=>"$baseUrl_02/ListProductByCategory/$categoryId";
  static String productDetailsUrl(int productId)=>"$baseUrl_02/ProductDetailsById/$productId";
  static String createCartListUrl="$baseUrl_02/CreateCartList";
}