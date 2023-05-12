import 'package:cash_mart/controller/login_controller.dart';
import 'package:cash_mart/controller/provier_controller.dart';
import 'package:cash_mart/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  //inject the dependence
  final controller = Get.put(ProviderController());
  final logoutController = Get.put(LoginController());

  String baseImageUrl = "https://admin.cashsmarts.co.uk";

 
  @override
  void initState() {

    //called the api called for get provider data
    controller.getProviderData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
      body: SafeArea(
        child: Container(
          color: Colors.amber.shade200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Cash Smart", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                      
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green[400],
                          child: const Icon(Icons.notifications, color: Colors.white,),),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                           //call logout controller for logout the user and delete the user token 
                           logoutController.logOut();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.green[400],
                            child: const Icon(Icons.logout, color: Colors.white,),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 30),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.black12,
          
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width * .70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const[
                             Icon(Icons.search, size: 25,),
                             SizedBox(width: 10,),
                             Text('Search', style: TextStyle(
                              fontSize: 20
                            ),),
                          ],
                        ),
                      ),
                    ),
                     const SizedBox(width: 20,),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.black12,
          
                      ),
                       height: 50,
                      width: 50,
                      child: const Icon(Icons.more_horiz,size: 30,),
                      
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  
                  height: 170,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (_, index){
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black38)
                        ),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      height: 100,
                      width: 180,
                    
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(controller.data[index].businessName.toString()),
                              CircleAvatar(backgroundImage: NetworkImage(baseImageUrl+controller.data[index].imagePath.toString()),)
                                
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                          child: Image.network(baseImageUrl+controller.data[index].backgroundImagePath.toString())),
                      ],
                    ),
                    );
                   
                      
                  
                     
                  }),
                ),
              ),
               Expanded(
                 child: Padding(
                  padding: const EdgeInsets.all(8.0),
                           
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.providerModel!.data!.length,
                        itemBuilder: (_, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              tileColor: Colors.black,
                              style: ListTileStyle.list,
                              leading: CircleAvatar(
                                
                                backgroundImage: NetworkImage(baseImageUrl+controller.providerModel!.data![index].imagePath.toString()),),
                              title: Text(controller.providerModel!.data![index].businessName.toString()),
                              subtitle: Text("${controller.providerModel!.data![index].cashback!.percentage}% CashBack", style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                          );
                         
                      }),
                    ),
                  ),
               ),
                           
            ],
          ),
        ),
      )
    );
  }
}