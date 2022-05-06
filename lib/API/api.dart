
import 'package:dio/dio.dart';
import 'package:schef/models/recipe_models.dart';

import 'global.dart';

class Api{

  static loginAPI(var email, var pass)
  {
    success = "false";
    Dio dio =  Dio();
    String url=baseurl+'login';
    FormData formData =  FormData.fromMap({


      'email': email.toString(),
      'password': pass.toString(),



    });
    dio.post(
      url,
      data: formData,
      options: Options(
        contentType: "application/x-www-form-urlencoded",
//          headers: {"Authorization" : "Bearer"+token}

      ),

    ).then((response){
      print(response);
      Map<String, dynamic> data = response.data;
      var message = data['message'];

      if(response.statusCode == 201){

        token=response.data["token"];


        success = "true";
        getAllRecipe();
        getuserinfo();

      }
      else if(response.statusCode == 401){
        success = "error";
      }
      else{
        success = "error";
        throw Exception('Failed to Fetch data');
      }
    }).catchError(onError);

  }

  static logoutAPI(){
    success = "false";
    Dio dio =  Dio();
    String url=baseurl+'logout';

    dio.post(
      url,
      options: Options(
          headers: {"Authorization" : "Bearer "+token}

      ),

    ).then((response){
      print(response);
      Map<String, dynamic> data = response.data;
      var message = data['message'];


        if(message == "logged out") {

          token="";


          success = "true";
        }



      else{
        success = "error";
        throw Exception('Failed to Fetch data');
      }
    }).catchError(onError);

  }

  static getAllRecipe()async{
    success = "false";
    Dio dio =  Dio();
    String url=baseurl+'recipe';
    try {
      await dio.get(url,options: Options(
          headers: {"Authorization" : "Bearer "+token}
      )).then((response) {


     //   Map<String, dynamic> data = response.data;
        var message = response.data[0];

        if(response.statusCode==200){
          Allrecipelist=[];

          for(Map i in response.data)
            {
              print("topa");

              Allrecipelist.add(Allrecipe(

                id: i["id"],
                image: i["image"],
                name: i["name"],
                excerpt: i["excerpt"],
                procedure: i["procedure"]

              ));
            }




          success = "true";
          print('this done');
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }
  static getuserinfo()async{
    success = "false";
    Dio dio =  Dio();
    String url=baseurl+'user';
    try {
      await dio.get(url,options: Options(
          headers: {"Authorization" : "Bearer "+token}
      )).then((response) {


        //   Map<String, dynamic> data = response.data;
        var message = response.data["user"];


        if(response.statusCode==200){
          userinfoget=[];
          name = response.data['user']['name'];
          address = response.data['user']['address'];
          email = response.data['user']['email'];
          number = response.data['user']['phone'];
          // for(Map i in response.data['user'])
          // {
          //   print("topa");
          //   userinfoget.add(userinfoGet(
          //       id: i["id"],
          //       name: i["name"],
          //       email: i["email"],
          //       phone: i["phone"],
          //     image: "",
          //     address: i["address"],
          //
          //   ));
          //
          //
          // }




          success = "true";
          print('this done');
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }
  static getingrediants(var id)async{
    success = "false";
    Dio dio =  Dio();
    String url=baseurl+'ingredient/'+id.toString();
    try {
      await dio.get(url,options: Options(
          headers: {"Authorization" : "Bearer "+token}
      )).then((response) {


        //   Map<String, dynamic> data = response.data;
        var message = response.data[0];

        if(response.statusCode==200){
          Allingrediantslist=[];

          for(Map i in response.data)
          {
            print("topa");
            Allingrediantslist.add(Allingrediants(
              id: i["id"],
              name: i["name"]

            ));


          }




          success = "true";
          print('this done');
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }

  static searchRecipes(var search)async{
    success = "false";
    Dio dio =  Dio();
    String url=baseurl+'recipe/search/'+search.toString();
    try {
      await dio.get(url,options: Options(
          headers: {"Authorization" : "Bearer "+token}
      )).then((response) {


        //   Map<String, dynamic> data = response.data;
        var message = response.data[0];

        if(response.statusCode==200){





          success = "true";
          print('this done');
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }



  static onError(dynamic error){
    success = "error";
  }
}