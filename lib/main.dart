import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {


late AnimationController a_cont;

late Animation<double> animation;


var opacity =  1.0;



void start1()
{
  a_cont= AnimationController(duration: Duration(microseconds: 3000), vsync: this);
  animation = Tween(begin: 0.0,end: 1.0).animate(a_cont)..addListener(() {
    setState(() {

    });
  });
  a_cont.forward();
}



void start()
{
  a_cont= AnimationController(duration: Duration(milliseconds: 3000), vsync: this);
  animation = Tween(begin: 1.0,end: 0.0).animate(a_cont)..addListener(() {
    setState(() {
      if(a_cont.isCompleted)
      {
        sifirla();
        print('animation is completed.');
      }
    });
  });
  a_cont.forward();
}




void sifirla()
{
  a_cont= AnimationController(duration: Duration(microseconds: 1), vsync: this);
  animation = Tween(begin: 0.0,end: 1.0).animate(a_cont)..addListener(() {
    setState(() {

    });
  });
  a_cont.forward();
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
start1();

  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    a_cont.dispose();
  }



  @override
  Widget build(BuildContext context) {
    opacity=animation.value;
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            Opacity(
                opacity: opacity,
                child: Icon(Icons.wb_cloudy, color: Colors.white, size: 200,)),
            Text("Weather", style: TextStyle(color: Colors.white, fontSize: 32),),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: ()
                  {
                    start();

                  }, child: Text("Start Animation", style: TextStyle(color: Colors.white, fontSize: 18))),
            )


          ],
        ),
      ),

    );
  }
}
