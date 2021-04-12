part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      Image.asset("assets/images/firelogo.png", height: 150),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: ctrlName,
                        decoration: InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          if (value.isEmpty) {
                            return "Please fill the field!";
                          }  else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: ctrlPhone,
                        decoration: InputDecoration(
                            labelText: "Phone",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          if (value.isEmpty) {
                            return "Please fill the field!";
                          }  else{
                            if(value.length < 7 || value.length > 14) {
                              return "Phone number isn't valid";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: ctrlEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          if(value.isEmpty){
                            return "Please fill this field";
                          }else {
                            if(!EmailValidator.validate(value)){
                              return "Email isn't valid";
                            }else{
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: ctrlPassword,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            suffixIcon: new GestureDetector(
                              onTap: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(
                                  isVisible ?
                                  Icons.visibility :
                                  Icons.visibility_off
                              ),
                            )
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          return value.length < 6 ?
                          "Password must have at least 6 characters" :
                          null;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            //melanjutkan tahap berikutnya
                            // Navigator.pushReplacementNamed(context, MainMenu.routeName);
                          }else {
                            Fluttertoast.showToast(msg: "Please check the fields", backgroundColor: Colors.red);
                          }
                        },
                        icon: Icon(Icons.login_rounded),
                        label: Text("Login"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange[400],
                            elevation: 0
                        ),
                      ),
                      SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Login.routeName);
                        },
                        child: Text('"Already registered? Login here!"',
                          style: TextStyle(
                              color: Colors.deepOrange[400],
                              fontSize: 16
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
