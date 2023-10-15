# Simple-Hospital-Portal

### Application Framework Details
 - Flutter Version : 3.10.4
 - channel : [stable](https://github.com/flutter/flutter.gitc)
 - Framework • revision 682aa387cf 
 - Engine • revision 2a3401c9bb
 - Tools 
    - Dart : 3.0.3  
    - DevTools : 2.23.1

### Get Started 🚀

1. Clone the repository:

   ```bash
   git clone https://github.com/sjdpk/simple-hospital-portal.git
   ```

2. Change to the project directory:

   ```bash
   cd hospital/
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app :

   ```bash
   flutter run 
        OR 
   simply press F5 key if you are using VSCode
   ```


### Build Docs ⛑️

Normal apk/appbundle build:

   ```bash
  flutter build apk --split-per-abi
  
  flutter build appbundle 
   ```

### Project Folder Structure

Our Application is implemented using feature-driven clean architecture.

### Dependencies

The app utilizes several Flutter packages:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Implements the BLOC pattern for state management.
- [equatable](https://pub.dev/packages/equatable): Simplifies equality comparisons for state management.

For a complete list of dependencies, please refer to the `pubspec.yaml` file.

### Branches
    - Each branch demonstrates and implements a distinct feature.