import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';

String result1="",result2="";
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String  username="";
  String password='123456789';
  String email='mrmodh10@gmail.com';

// authenticate(String email, String pass) async {
//     String myurl =
//         "here pass your url";
//     http.post(myurl, headers: {
//       'Accept': 'application/json',
//       'authorization': 'pass your key(optional)'
//     }, body: {
//       "email": email,
//       "password": pass
//     }).then((response) {
//       print(response.statusCode);
//       print(response.body);     

//   }
//     );
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SmartDrive'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Welcome to SmartDrive',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              /*  FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),*/
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {


                        username=(nameController.text);
                        password=(passwordController.text);

                        Future authenticate(String uname, String passw) async {
                        var client = http.Client();
                        String myurl =
                            "https://drivemesafe.herokuapp.com/login?passw="+password+"&uname="+uname;
                        http.Response response =await client.get(myurl);
                        print(response.body+"dfsfd");
                        Map<String, dynamic> map = jsonDecode(response.body); // import 'dart:convert';

                        String runame = map['name'];
                        if(runame==uname){
                        result1 = map['conno'];
                        result2  = map['emgno'];
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstRoute(username: username)),
                        );
                        }
                        else{
                          //print("222222");
                          showDialog(
                            context: context,
                            builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text(""),
                                  content: Text("Invalid Credentials"),
                                  actions: [FlatButton( child: Text("Close"), onPressed: (){Navigator.of(context).pop();}, ),]
                                );
                            }
                          );
                        }
                        //, headers: {
                        //  'Accept': 'application/json',
                          //'authorization': 'pass your key(optional)'
                        // }, body: {
                        //   "email": email,
                        //   "password": pass
                        // 
                        //},
                        // )
                        // .then((response) {
                        //   print(response.statusCode);
                        //   print(response.body);  
                          
                        //                         }
                        //);
                        // String x=resp.toString();
                        // print(x);
                        // if(x=="1"){
                        //   print("123");
                        // }
                    }
                    
                    // if(response.body as String =="0")
                    //       {
                    //         print(response.body+" 0");
                    //         return "0";
                    //       }
                    //       else
                    //       {
                    //         print(response.body+" 1");
                    //         return "1";
                    //       }
                    //enticate(email, password)
                    // if(authenticate(username, password)  =="1")
                    // {
                    //                           Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => FirstRoute(username: username)),
                    //     );
                    // }
                    // else
                    // {
                    //   print("2nd");
                    //   showAlertDialog(context);  
                    // }
                    ( authenticate(username, password));


                        // username=nameController.text;


                      },
                    )),
              /*  Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))*/
              ],
            )));
  }
}

// class SecondRoute extends StatelessWidget {
//   final String username;
//   SecondRoute({this.username});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome"),
//       ),
//       body: Center(
        
//         //
//         child: new Column(
//           children: <Widget>[
//         Text('Hello $username'),
//         RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//             // Navigate back to first route when tapped.
//           },
//           child: Text('Sign out!'),
//         ),
//           ],
//         )
//       ),
//     );
//   }
// }



class SecondRoute extends StatefulWidget{
  final String username;
  SecondRoute({this.username});
  @override
  MyTextInputState createState() => new MyTextInputState(username: username);
}


class FirstRoute extends StatelessWidget {
  String username;
  FirstRoute({this.username});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('SafeDrive🚙'),automaticallyImplyLeading: false),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Hello $username',style: TextStyle(fontSize: 25),textAlign: TextAlign.start),
                new IconButton(
                  icon: Icon(Icons.settings_applications,color: Colors.redAccent,),
                  iconSize: 70.0,
                  onPressed: () {/*Route route = MaterialPageRoute(builder: (context) => SecondPage());
                                Navigator.pushReplacement(context, route);//Navigator.of(context).pushNamed('/SecondPage');*/
                                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute(username: username)));
                                },
                ),
                new Text('Set Profile'),
                new IconButton(
                  icon: Icon(Icons.local_car_wash,color: Colors.redAccent,),
                  iconSize: 70.0,
                  onPressed:  () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()));}
                ),
                new Text('Lets Drive'),
                new IconButton(
                  icon: Icon(Icons.close,color: Colors.redAccent,),
                  iconSize: 70.0,
                  onPressed:  () {Navigator.pop(context);

                  }
                ),
                new Text('Sign Out')
                
              ],
            ),
          ),
        )
        
      );
    
  }
}







class MyTextInputState extends State<SecondRoute>{
  final TextEditingController controller1=new TextEditingController()..text=(result1);
  final TextEditingController controller2=new TextEditingController()..text=result2;
  //String result1="",result2=""
  String username;
  MyTextInputState({this.username});
  @override
  Widget build(BuildContext context){
    return new Scaffold(resizeToAvoidBottomPadding: false,
      appBar: new AppBar(title: new Text('Profile🔩'),
        backgroundColor:Colors.deepOrange),
      body: new Container(
        child: 
          new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          new Text('Enter your contact number'),
          new TextField(
            decoration: new InputDecoration(
              //hintText:result1,
              //labelText: result1,
              semanticCounterText:  result1
            ),
            onSubmitted: (String str1){
              // setState(() {
              //   //result1=str1;
              //   //controller1.text='9999';
              //   //print("HELOOOO");
              // });
            },
            onChanged: (s) => setState(() => result1 = s),
            controller: controller1,),
          //new Text(result1),
          SizedBox(height: 90),
          new Text('Enter your emergency contact'),
          new TextField(
            decoration: new InputDecoration(
              //hintText:result2,
              //labelText: result2,
              
            ),
            onSubmitted: (String str2){
              // setState(() {
              //   //result2=str2;
              //   //controller2.text='';
              // });
            },
            onChanged: (s) => setState(() => result2 = s),
            controller: controller2,),
            
          //new Text(result2),
          SizedBox(height: 90),
          // new Container(
          //   child: 
          //   new Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: <Widget>[
          //                 new IconButton(
          //   icon: Icon(Icons.settings_applications,color: Colors.redAccent,),
          //   iconSize: 70.0,
          //   onPressed: () {},
          // )                
          //     ],
          //   ),
          // ),
          new IconButton(
            icon: Icon(Icons.save,color: Colors.redAccent,),
            iconSize: 70.0,
            alignment: Alignment.center,
            onPressed: () {/*Navigator.of(context).pushNamed('/');
            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
            */
            print(controller2.text);
                  Future savedata() async {
            print(2);
            var client = http.Client();
            String myurl =
                "https://drivemesafe.herokuapp.com/save?emgno="+controller2.text+"&conno="+controller1.text+"&uname="+username;
            http.Response response =await client.get(myurl);
            ///print(response.body+"dfsfd");

                  }
            savedata();
            Navigator.pop(context);
            },
          )
        ],)
      ),)
    ;
  }
}



class ThirdRoute extends StatefulWidget {
  
  @override
  
  _ThirdRoute createState() => new _ThirdRoute();
}

class _ThirdRoute extends State<ThirdRoute> {
  Timer _timer;
  int b=0;
// class ThirdRoute extends StatelessWidget {
  @override
  void initState() {
    super.initState();
    //print(22222222222222222);
    pro();

  }

  void pro() async{
    //b=0;
      _timer = Timer.periodic(Duration(seconds: 15), (timer) async{
      print(b);
      var client = http.Client();
      String myurl =
          "https://drivemesafe.herokuapp.com/state";
      http.Response response =await client.get(myurl);
      print(response.body);
      if(response.body.contains("Drowsy")){
      AudioCache player = new AudioCache();
      const alarmAudioPath = "sound.mp3";
      player.play(alarmAudioPath);
      }
      setState(() {
      b+=1;
      });
    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Drive....'),leading: new IconButton(
    icon: new Icon(Icons.arrow_back),
    onPressed: () {_timer.cancel();Navigator.pop(context);;}),),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              new Text('Lets Drive'),
              new Text('$b'),
              new Image(image: AssetImage('assets/car.gif'))
              ],
            ),
          ),
        )
        
      );
    
  }
}