
class User {

    final String? name;
   final String ?icon;
    User({this.icon,

        this.name,
    });


    factory User.fromJson(Map<String, dynamic> json) => User(

        name: json["name"],
        icon: json[ "icon"]
    );


}