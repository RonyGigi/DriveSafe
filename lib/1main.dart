import 'package:flutter/material.dart';

String result1="",result2="";
main() {
  runApp(new MaterialApp(
    home:  new FirstPage(),
    routes: <String,WidgetBuilder>{
      "/FirstPage": (BuildContext context) => new FirstPage(),
      "/SecondPage": (BuildContext context) => new SecondPage(),
      "/ThirdPage":(BuildContext context) => new ThirdPage()
    }
    ));
    
}

class SecondPage extends StatefulWidget{
  @override
  MyTextInputState createState() => new MyTextInputState();
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('SafeDrive🚙'),automaticallyImplyLeading: false),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.settings_applications,color: Colors.redAccent,),
                  iconSize: 70.0,
                  onPressed: () {/*Route route = MaterialPageRoute(builder: (context) => SecondPage());
                                Navigator.pushReplacement(context, route);//Navigator.of(context).pushNamed('/SecondPage');*/
                                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()));
                                },
                ),
                new Text('Set Profile'),
                new IconButton(
                  icon: Icon(Icons.local_car_wash,color: Colors.redAccent,),
                  iconSize: 70.0,
                  onPressed:  () {Navigator.of(context).pushNamed('/ThirdPage');}
                ),
                new Text('Lets Drive')
                
              ],
            ),
          ),
        )
        
      );
    
  }
}


class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Drive....'),),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              new Text('Lets Drive'),
              new Image(image: AssetImage('assets/car.gif'))
              ],
            ),
          ),
        )
        
      );
    
  }
}




class MyTextInputState extends State<SecondPage>{
  
  final TextEditingController controller1=new TextEditingController()..text=(result1);
  final TextEditingController controller2=new TextEditingController()..text=result2;
  //String result1="",result2=""
  @override
  Widget build(BuildContext context){
    return new Scaffold(
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
              setState(() {
                result1=str1;
                //controller1.text='9999';
                //print("HELOOOO");
              });
            },
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
              setState(() {
                result2=str2;
                //controller2.text='';
              });
            },
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
            Navigator.pop(context);
            },
          )
        ],)
      ),)
    ;
  }
}