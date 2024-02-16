class ProfileParam {
  String fullName;
  String region;
  String mobile;
  String city;
  String shippingAddress;

  ProfileParam({
    required this.fullName,
    required this.region,
    required this.mobile,
    required this.city,
    required this.shippingAddress,
  });

  Map<String,dynamic> get param =>{
    "firstName":fullName,
    "lastName":region,
    "mobile":mobile,
    "city":city,
    "shippingAddress":shippingAddress,

   /* "ship_name": fullName,
    "ship_add": shippingAddress,
    "ship_city": city,
    "ship_country": region,
    "ship_phone": mobile,*/
  };
}