import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/checkinternetconnection.dart';
import 'package:http/http.dart'as http;
class Crud {
  Future<Either<StatusRequest,Map>> postDate(String linkurl , Map data) async{
    try{
      if(await checkInternet()){
        var response = await http.get(Uri.parse(linkurl));

        if(response.statusCode == 200 || response.statusCode == 201){

          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        }else{
          return const Left(StatusRequest.serverfailure);
        }
      }else{
        return const Left(StatusRequest.offlinefailure);
      }
    }catch(_){
      return const Left(StatusRequest.serverfailure);
    }
  }
}