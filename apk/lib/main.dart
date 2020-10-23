//Importing material.dart allows us to use predefined widgets and material design elements
import 'package:flutter/material.dart';

//main() is the function that is always executed by default
//Here it uses the runApp() method to run the MyApp widget
void main() {
  runApp(MyApp());
}

//MyApp is a stateless widget, which means it's state doesn't change
class MyApp extends StatelessWidget {

  //It's build function is what it returns when called
  @override
  Widget build(BuildContext context) {
    //Here a MaterialApp widget is returned
    //This widget allows us to inside it certain elements common when designing an app
    return MaterialApp(
      //Inside widgets we have properties, like title or theme in this case
      //These properties can take different values, which range from simple variables to widgets

      //Title is the name of the app itself, here we simply use a string as a value
      title: 'Flutter Demo',

      //This command hides the red banner at the top rigth corner
      debugShowCheckedModeBanner: false,

      //Theme indicates which color themes and other display configuration to use and in this case we use a widget
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //Inside home we call another widget and we pass it a parameter called title
      home: MyHomePage(title: 'Salesians de Sarrià: 19 - 20'),
    );
  }
}

//This widget is stateful, meaning it can change its state with the setState() function, which triggers the build() function
//The build function "draws" or "displays" what's inside
//Stateful widgets consist of 2 parts: the widget and a state
class MyHomePage extends StatefulWidget {

  //Here we indicate that the title we pass a paremeter will be the vaule title specified inside this class
  MyHomePage({Key key, this.title}) : super(key: key);

  //And here we will store the value of the title
  final String title;

  //The following line calls a state related to this widget
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //We declare an int (preceded by _ to indicate it's private) which we'll use as a counter
  int _counter = 0;

  //The following function just calls the setState() function to "redraw" or update the widget and increase the counter value
  //If we were to execute this without the setState() the value itself would increment, but we would not see any changes
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //The build function
  @override
  Widget build(BuildContext context) {
    //Scaffold is like a template to go with, which includes an appbar and a body for the app
    return Scaffold(

      //Here we return the blue bar that can be seen on top and it uses as a title the parameter we passed from the MyApp widget
      appBar: AppBar(
        title: Text(widget.title),
      ),

      //Here starts the content, with a Center widget that, well, centers the content inside
      body: Center(
        //Then we use a Column widget because it can contain multiple widgets inside
        //When specifying the children property we often use a list of widgets

        child: Column(
          //The mainAxis is a property that depens on the parent, in this case it means the vertical axis
          //And when sepcifying this axis we can set the alignment of the elements in that axis
          //In case of a row the mainAxis would be horizontal
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Here we simply display a text
            Text(
              "S2AM - Nikita Chechel",
            ),
            //And here we display the value of the counter variable
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      //This widget is located at the bottom-right side and, when tapped, it calls the _incrementCounter() function
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
