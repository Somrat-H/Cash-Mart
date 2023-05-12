import 'package:cash_mart/controller/login_controller.dart';
import 'package:cash_mart/controller/provier_controller.dart';
import 'package:cash_mart/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderDashboard extends StatefulWidget {
  const ProviderDashboard({super.key});

  @override
  State<ProviderDashboard> createState() => _ProviderDashboardState();
}

class _ProviderDashboardState extends State<ProviderDashboard> {
  //inject the dependence
  final controller = Get.put(ProviderController());
  final userController = Get.put(LoginController());
  String baseImageUrl = "https://admin.cashsmarts.co.uk";

  @override
  void initState() {

    //check user token save or not, if save token then navigate to the userdashboard
    userController.isLogin();

    //called the api called for getting Provider data
    controller.getProviderData();

  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.amber.shade200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cash Smart",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green[400],
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green[400],
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.black12,
                      ),
                      height: 50,
                                   
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.black12,
                      ),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.more_horiz,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const LogPage()));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: Colors.green[400],
                        ),
                        child: const Center(
                            child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 25),
                        )),
                      ),
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 10,
                      )),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Colors.green[400],
                      ),
                      child: const Center(
                          child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 25),
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 170,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black38)),
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        height: 100,
                        width: 180,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.data[index].businessName
                                      .toString()),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(baseImageUrl +
                                        controller.data[index].imagePath
                                            .toString()),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                child: Image.network(baseImageUrl +
                                    controller.data[index].backgroundImagePath
                                        .toString())),
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
                      itemCount: controller.providerModel?.data?.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: Colors.black,
                            style: ListTileStyle.list,
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(baseImageUrl +
                                  controller
                                      .providerModel!.data![index].imagePath
                                      .toString()),
                            ),
                            title: Text(controller
                                .providerModel!.data![index].businessName
                                .toString()),
                            subtitle: Text(
                              "${controller.providerModel!.data![index].cashback!.percentage}% CashBack",
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
