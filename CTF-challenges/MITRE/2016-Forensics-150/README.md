# README #

The Generated APK is all you need to give them.

##Methods of Hacking##
* Figure out Hashes of username/password and put in Username: iamahacker Password: iamnotascriptkiddy
* Send Intent of specific string to cause Broadcast receiver to print flag
* Figure out how the app is taking the decimal ASCII converting it to HEX and then to string and formulate the flag

##Installation/start-up##
1. APK emulator (Android Studio works)
2. Download sdk with API v15
3. Download apktools

     brew install apktool

4. download jd gui installer 

##Solving##
 1. Once everything is loaded you should be able to unzip and decode the Authenticator.apk file. (Recommended: copy Authenticator.apk to a temp file)

          unzip Authenticator.apk
          wait....
          apktool d Authenticator.apk

  2. Make sure all sdk packages are loaded properly and start Android Studios AVD Manager from terminal. Then create a virtual device (the smaller the device the more likely it will load).
        
         android avd

  3. Next the apk may already be loaded on the virtual device so open it up and find authenticator in the apps. 
  4. Then in a new page in terminal find where you unziped the apk and convert the classes.dex file to a jar

          d2j-dex2jar classes.dex

  5. Open classes.dex2jar.jar file in jd-gui and find last function to see the word needed to send in the intent broadcast.(AUTHENTICATE)
  6. Next go through the AndroidManifest.xml to find the first portion of the intent. (org.ctf.authenticator.authenticate)
  7. Send the intent while the virtual device is in the same view so you can see the flag appear.
 
          adb shell am broadcast -a org.ctf.authenticator.authenticate

##Another way to solve:
Go into Authenticator/res/values and find the user and password strings.
   * The strings are encrypted but can be decrypted and then used as the username and password when the app is launched.*


###KEY
* The Key is “e1192d27265d0754f9482fbbe0b8bb165c4f2144”.