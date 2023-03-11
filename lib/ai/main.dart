import 'package:flutter/material.dart';  
import 'dart:async';
  import 'package:camera/camera.dart';
  import 'pushed_pageS.dart';

List<CameraDescription>? cameras;
Future<Null> main() async
{
   WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }

  runApp(New2());


}

class New2 extends StatelessWidget {
  const New2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
   
    return MaterialApp(
      title: 'AI MAPPING',
      debugShowCheckedModeBanner: false,
      home: MainScreen(cameras),
      routes: {
        MainScreen.id: (context) => MainScreen(cameras!),
    
        //DemoScreen.id: (context) => DemoScreen(),
      },
                
    );

  }
  
  
}


class MainScreen extends StatelessWidget {
  
  
   const MainScreen(cameras, {Key? key}) : super(key: key);

  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size screen = MediaQuery.of(context).size;
    

    return Scaffold(
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {
      //     print(
      //       Provider.of<DisorderList>(context, listen: false),
      //       // context.watch<DisorderList>().globalDisorderList[0],
      //     ),
      //   },
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {
                           
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 34,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Good Morning,',
                            //   style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     fontSize: 28,
                            //   ),
                            // ),
                            Text(
                              'AR Therapy',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => {
                        
                      },
                      icon: Icon(
                        Icons.account_circle,
                        color: Theme.of(context).primaryColor,
                        size: 34,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff3d3d3d),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to\nAR Therapy!',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Where physiotherapy meets AR Technology',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
               
                // CustomElevatedButton(
                //   onPressed: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const DemoScreen3D(
                //             // parameters to pass, example
                //             // passedNotice: NoticeModel(
                //             //   noticeId: 1,
                //             //   noticeTitle: 'Notice Title',
                //             //   noticeDate: DateTime.now(),
                //             //   noticePosterName: 'John Doe',
                //             //   noticePosterEmail: 'johndoe@mail.com',
                //             // ),
                //             ),
                //       ),
                //     )
                //   },
                //   icon: Icons.threed_rotation_rounded,
                //   iconSize: 34,
                //   title: 'View 3D Demo',
                // ),
                // const SizedBox(height: 20.0),
                   ElevatedButton(onPressed: () =>
                              onSelectS(context: context, modelName: 'posenet'), child: const Text('Enable'), ),
               
                 
                
                
                // Expanded(
                //   child: ModelViewer(
                //     src: 'assets/final_rigmodel.glb',
                //     alt: 'Animated 3D model of exercise',
                //     ar: true,
                //     autoRotate: true,
                //     cameraControls: true,
                //     enablePan: true,
                //     autoPlay: true,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }}



  
void onSelectS({required BuildContext context,required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras!,
        title: modelName,
      ),
    ),
  );
}
