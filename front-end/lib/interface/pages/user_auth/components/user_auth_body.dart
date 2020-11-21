import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';

class UserAuthBody extends StatelessWidget{





  @override
  Widget build(BuildContext context){


    Size screenSize= MediaQuery.of(context).size;
    return Column(
      children: [
        TextFormField(

          initialValue: "Enter yout emailemail",

        )


      ],

    );
  }
}