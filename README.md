# Woofle
  
## How to download and run Woofle
  
1. To run Woofle you will need to download and have running android studio.
You can find instructions on how to download android studio [here](https://docs.flutter.dev/get-started/install).  
    ### what you will need to download:
    - Flutter SDK
    - The Dart programing language
    - And an [android emulator](https://developer.android.com/studio/run/emulator) to run the app.  

2. The next step is to download the Woofle package and open it in android studio.  
    ### There are two ways you can download Woofle:
    1. You can download the Woofle package from the [Github page](https://github.com/vnmendoza/Woofle) and open it in android studio.
    2. You can also clone the Woofle package from Github using the link [https://github.com/vnmendoza/Woofle.git](https://github.com/vnmendoza/Woofle.git).
    3. After you downloaded the Woofle package, you will need to traverse to "/Woofle/lib/XAMPP/" inside of the Woofle package directory, and keep notes of the three database files: login.php, signup.php, and woofle_1.sql. These files are for step 3.  
  
3. You will also need to download XAMPP to get the database running within the Woofle app. You can download XAMPP [here](https://www.apachefriends.org/index.html).  
    ### How to run XAMPP:
    - Open the XAMMP application.
    - Start the IP Address in the General tab.
    - Go to the Volumes tab and press mount on the lampp path.
    - Then in the Services tab, you will need to press start on each of the services: Apache, ProFTPD, and MySQL.
    - In the Network tab, you will need to start the localhost.
    - Now in your computer directory, there will be a new connected device with the name of the IP address of the XAMPP app. (ex: "192.168.64.2")
    - Select the device and traverse to "/lampp/htdocs/" inside of the new connected device. there you should copy and paste the files login.php and signup.php from step 2.
    - The next step is to open a browser and type in the search bar "localhost" and the XAMPP page should appear.
    - On the XAMPP page navigate to phpMyAdmin -> import -> chose files, select the woofle_1.sql file from step 2 and click go.  
  
4. After you have android studio running with the Woofle package, and XAMPP with the database loaded, you will need to run the android emulator that you have downloaded in step 1.  
  
5. When your android emulator is running, you can now run the main.dart file in the Woofle package.
    ### If you're having trouble with any of the package dependencies:
    - Open the android studio intergraded terminal and type in the commands:  
        > flutter clean  
        > flutter pub get
    - If everything is running correctly then you should have the Woofle app running on your android emulator.
