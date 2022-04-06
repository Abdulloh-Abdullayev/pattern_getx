import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/views/itemsOfPost.dart';


class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX"),
          actions: [
            SizedBox(width:
            10,),
            IconButton(onPressed: (){
              Get.changeTheme(ThemeData.dark());
              Get.snackbar("darkMode", "Succesfuly");
            },
              icon: Icon(Icons.dark_mode),
            ),
            SizedBox(width:
            10,),
            IconButton(onPressed: (){
              Get.changeTheme(ThemeData.light());
              Get.snackbar("likeMode", "Succesfuly");
            },
              icon: Icon(Icons.light_mode),
            )
          ],
        ),
        body: Obx(
                ()=> Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10),
                  itemCount: _controller.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(_controller.items[index],_controller);
                  },
                ),
                _controller.isLoading()
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            _controller.goToCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }


}
