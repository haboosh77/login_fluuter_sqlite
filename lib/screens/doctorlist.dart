import 'package:flutter/material.dart';

class doctorlist1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:       SingleChildScrollView(
        child: SizedBox(

          child: ListView.separated(
            physics:NeverScrollableScrollPhysics() ,
            shrinkWrap:true ,
            scrollDirection: Axis.vertical,
            itemBuilder: (context ,index)=>buildmessageItem(),
            separatorBuilder: (context,index)=>SizedBox(height: 10,),
            itemCount: 2,
          ),
        ),
      ),
    );


  }
  Widget buildmessageItem()=>   ClipRRect(
  borderRadius: BorderRadius.circular(20.0),

  child: Stack(

  children: [
  Container(
  height: 250,
  decoration: BoxDecoration(
  color: Colors.lightBlueAccent,
  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight: Radius.circular(40)),


  ),
  child: Padding(
  padding: const EdgeInsets.only(left: 20),
  child: Row(
  children: [
  Icon(Icons.archive_outlined) ,
  Text("Moday,june 22"),
  SizedBox(width: 20,),
  Icon(Icons.watch_later_outlined),
  Text("08:00 PM",style: TextStyle(color: Colors.white),),
  ],),
  ),
  ),
  Container(
  height: 200,
  width: double.infinity,
  color: Colors.grey[100],

  child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Card(
  child:
  ListTile(
  leading: CircleAvatar(
  backgroundImage: AssetImage('assets/images/doctor1.jpg')
  ),
  ),            ),
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('DR.osman ali',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  ),
  SizedBox(height: 3,),
  Row(
  children: [
  IconButton(onPressed: (){},icon: Icon(Icons.email_outlined,size: 10,)),

  Text('osman@hotmail.com',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
  maxLines: 2,

  overflow: TextOverflow.ellipsis,
  ),
  ],
  ),
  SizedBox(height: 3,),
  Row(
  children: [
  Icon(Icons.phone_android_outlined,size: 10,),
  Text('07999999999',style:TextStyle(fontSize: 12,color: Colors.grey),
  maxLines: 2,overflow: TextOverflow.ellipsis,),
  ],
  ),
  SizedBox(height: 3,),
  SizedBox(width: 3,),
  InkWell(onTap:(){
  // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context)=>mapscreen()),((route) =>false ));


  } ,child: Text('Amman- jordan',style:TextStyle(fontSize: 12,color: Colors.blue),)),

  ],
  ),
  ),

  ],
  ),
  ),
  ),
  ],
  ),
  );
}
