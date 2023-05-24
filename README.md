# AR Therapy #
	
An android application created using Flutter, Firebase and ARCore to facilitate improved physiotherapy treatments powered by Augmented Reality.

## Features ##
- - - -
* Exercise Representations through interactive 3D and Augmented Reality models
* Browse for information related to disorders and exercises locally or on the web
* AI Mapping for giving feedback about the exercise form (beta)
* Find physiotherapists near the user based on their location
* Users can bookmark the exercises and manage their profile info stored on the cloud (beta)
* Modern and sleek interface

## Technologies ##
- - - -
* Flutter with [Provider](https://pub.dev/packages/provider) for state management
* ARCore with [model_viewer_plus](https://pub.dev/packages/model_viewer_plus)
* Firebase Authentication
* Cloud Firestore 
* TensorFlow Lite PoseNet - Pose Mapping with [tflite](https://pub.dev/packages/tflite)
* Integrated web browsing functionality with [url_launcher](https://pub.dev/packages/url_launcher) and [webview_flutter](https://pub.dev/packages/webview_flutter)
* Modern Flutter and Dart practices: null safety, const constructors, readable and reusable code with 7 new custom widgets