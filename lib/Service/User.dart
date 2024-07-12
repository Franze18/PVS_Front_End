class User{
  String firstname;
  String middlename;
  String lastname;
  String address;
  String phonenumber;
  String email;
  String password;

  User({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.password});

  Map<String, dynamic> toJson () => {
    'firstname' : firstname,
    'middlename' : middlename,
    'lastname' : lastname,
    'address' : address,
    'phonenumber' : phonenumber,
    'email' : email,
    'password' : password
  };
}