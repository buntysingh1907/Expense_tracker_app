import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class landingpage extends StatelessWidget{
  const landingpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        centerTitle: true,
     leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios_new), ),

        title:  Text("Dog Food",style:GoogleFonts.oswald(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold
        ),),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
              Image.network("https://bramblepets.com/wp-content/uploads/2022/03/kibble2.jpg"),
             SizedBox(height: 21,),
            SizedBox(
              height: 100.0,
              child: ListView.builder(itemCount:6,scrollDirection:Axis.horizontal ,itemBuilder:(context,index) {
                      return Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                          children: [
                            CircleAvatar(
                              radius: 27.0,
                              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ13ceTVGqwE1sI5c4cWdkkymf8M44X4HFPQA&usqp=CAU"),
                            ),
                            Text("Food",style:GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 15,

                            ),)
                          ],
                    ),
                        ),
                      );
                    },
                    ),
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 11),
                     child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Best Seller",style:GoogleFonts.roboto(
                color: Colors.deepOrange,
                fontSize: 21,

                  ),),
                        Text("Hand picked for you",style:GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                        ),),
                      ],
                  ),
                   ),
                   Spacer(),
                   ElevatedButton(onPressed: (){}, child:Text("Explore >",style:TextStyle(color: Colors.white),),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue, // Set your desired color here
                     ),)
              ],
            ),
            SizedBox(
              height: 250.0,
              child: ListView.builder(itemCount:6,scrollDirection:Axis.horizontal ,itemBuilder:(context,index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                          // width: 50.0,
                           //height: 100.0,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReIIWnPJTRxHn5e4jIxCqUnOd8se7nWwtIqw&usqp=CAU") ,
                      ),
                      Text("Treats",style:GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 15,
                      ),)
                    ],
                  ),
                );
              },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Top Categories")
              ],
            ),
            SizedBox(
              height: 250.0,
              child: ListView.builder(itemCount:6,scrollDirection:Axis.horizontal ,itemBuilder:(context,index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        // width: 50.0,
                        //height: 100.0,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ13ceTVGqwE1sI5c4cWdkkymf8M44X4HFPQA&usqp=CAU") ,
                      ),
                      Text("New Food")
                    ],
                  ),
                );
              },
              ),
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ13ceTVGqwE1sI5c4cWdkkymf8M44X4HFPQA&usqp=CAU",
                fit: BoxFit.cover,),
            ),
             Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("top picked"),
                    Text("hand picked for your dog"),
                  ],
                ),
                Spacer(),
                ElevatedButton(onPressed: (){}, child:Text("Explore more >"),)
              ],
                ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(
                      "https://bramblepets.com/wp-content/uploads/2022/03/kibble2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 11,),
                  Container(
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(
                      "https://bramblepets.com/wp-content/uploads/2022/03/kibble2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 11,),
                  Container(
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(
                      "https://bramblepets.com/wp-content/uploads/2022/03/kibble2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
            )
              ],//main coulumn children
        ),
      ) ,
    );
  }
}