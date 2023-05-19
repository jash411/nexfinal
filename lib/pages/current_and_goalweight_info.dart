import 'package:flutter/material.dart';

class weightinfo extends StatefulWidget {
  const weightinfo({Key? key}) : super(key: key);

  @override
  State<weightinfo> createState() => _weightinfoState();
}
final _formKey=GlobalKey<FormState>();

class _weightinfoState extends State<weightinfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.fromLTRB(20.0,200,20,0),
            child:Column(
              children: <Widget>[
                Text('What is your Plan \non your  Weight?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),),

                SizedBox(height: 9.0),
                Text('Knowing your current and Goal weight helps us \n'
                    'to calculate your calorie needs and Creating plan\n '
                    'that will help you reach your Goal.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.0),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        ),
                        decoration: InputDecoration(

                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Current Weight",
                            labelStyle: TextStyle(fontSize: 14,
                                color: Colors.white),

                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                      validator: (value){
                          if(value?.isEmpty??true){
                            return 'please Enter Current Weight';
                          }
                          int? vari=int.tryParse(value!);
                          if(vari!=null && vari<35)
                            {
                              return'only more than 35KG was allowed';
                            }
                          return null;
                      }

                      ),
                      SizedBox(height: 70.0),


                      Text('For Healthy BMI \n your Goal weight shoul be '
                          'at least 55 kg.',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),


                      TextFormField(
                        style: TextStyle(fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                                ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                                ),
                          labelText: "Goal Weight",
                          labelStyle: TextStyle(fontSize: 14,
                              color: Colors.white),

                                ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                          validator: (value){
                            if(value?.isEmpty??true){
                              return 'please Enter Goal Weight';
                            }
                            int? vari=int.tryParse(value!);
                            if(vari!=null && vari<55)
                            {
                              return'only more than 55KG was allowed';
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 40.0),

                      ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/dietinginfo.dart');
                          }
                        },
                        child: Text('Next',
                          style: TextStyle(fontSize: 14,
                              color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
