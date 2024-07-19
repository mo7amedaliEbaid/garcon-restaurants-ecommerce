# Garcon - Restaurants Management App 🍽
Garcon is a Flutter-based restaurant management app designed to streamline various aspects of restaurant operations. The app provides features such as meal pickups, Stripe Payment Integration, booking management, and essential information sections. The user interface and experience have been crafted by a professional UI/UX designer using Adobe XD. The app's backend is powered by Firebase, offering a robust and scalable solution.

## Functionality
- Bloc pattern for efficient state management
- Responsive Design
- 🔍 Search and filter functionality
- 🧆 Meal pickups management
- Seamless checkout process
- 🛒 Shopping cart management
- User settings customization
- Sign in with email and password
- Sign up with email and password
- Log Out
- Change Password
- Edit Profile
- Add a reservation
- Pay Online 
- Create an Order
- Stripe Integration


## Directory Structure

The project is organized into several directories:

- **application:** Contains feature Blocs, global Cubits, and logic for state management.
  
- **configs:** Includes configuration files such as spaces, app text and typography.

- **core:** Houses fundamental app components like the main app file, enums, router, extensions, constants, etc.
  
- **models:** Contains data models used throughout the app, including structures for restaurants and users.
  
- **presentation:** Encompasses the app's user interface, featuring screens and widgets for an enhanced visual experience.
  
- **repositories:** Includes repositories for restaurants, auth, and other relevant data.


```
project_root
│
├── 📁 application
│   ├── 📁 blocs
│   │   └── ...
│   ├── 📁 cubits
│   │   └── ...
│   └── ...
│
├── 📁 configs
│   ├── 📄 apptext.dart
│   ├── 📄 app_typography.dart
│   └── ...
│
├── 📁 core
│   ├── 📄 app.dart
│   ├── 📄 enums.dart
│   ├── 📄 extensions.dart
│   ├── 📄 constants.dart
│   └── ...
│
├── 📁 models
│   ├── 📄 restaurant.dart
│   ├── 📄 user.dart
│   └── ...
│
├── 📁 presentation
│   ├── 📁 screens
│   │   ├── 📄 home_screen.dart
│   │   ├── 📄 search_screen.dart
│   │   └── ...
│   └── 📁 widgets
│       ├── 📄 custom_buttons.dart
│       ├── 📄 custm_textfiels.dart
│       └── ...      
│
└── 📁 repositories
    ├── 📁 restaurant_repos
    ├── 📁 pickups_repos
    └── ...
```
## ScreenShots.

More ScreenShots [Here](https://github.com/mo7amedaliEbaid/garcon/blob/6d3d4b77f8af52adc75265375c3e40f251a382c0/screenshots)


<p float="left">
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/80d3e467d2f5470368ccb4ee2cc672745e0eeeb2/screenshots/splash.jpg" width="180" alt="splash"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/80d3e467d2f5470368ccb4ee2cc672745e0eeeb2/screenshots/ad.jpg" width="180" alt="ad"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/80d3e467d2f5470368ccb4ee2cc672745e0eeeb2/screenshots/home.jpg" width="180" alt="home"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/80d3e467d2f5470368ccb4ee2cc672745e0eeeb2/screenshots/home1.jpg" width="180" alt="home1"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/92478c8c88e12aab2aa1ed2ab41027e6af89aaec/screenshots/filterSheet.jpg" width="180" alt="filter"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/80d3e467d2f5470368ccb4ee2cc672745e0eeeb2/screenshots/noconnect.jpg" width="180" alt="noConnect"/>

  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/92478c8c88e12aab2aa1ed2ab41027e6af89aaec/screenshots/signupCom.jpg" width="180" alt="signup"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/fb4c182390e3f4306257c1d11c5b449c0fa718ea/screenshots/signin.jpg" width="180" alt="signin"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/92478c8c88e12aab2aa1ed2ab41027e6af89aaec/screenshots/choose.jpg" width="180" alt="choose"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/92478c8c88e12aab2aa1ed2ab41027e6af89aaec/screenshots/account.jpg" width="180" alt="account"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/9ef8c0432fb561a88bb49289e4bd6e6102e91c32/screenshots/about.jpg" width="180" alt="about"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/9ef8c0432fb561a88bb49289e4bd6e6102e91c32/screenshots/booking2.jpg" width="180" alt="booking2"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/9ef8c0432fb561a88bb49289e4bd6e6102e91c32/screenshots/checkout.jpg" width="180" alt="checkout"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/9ef8c0432fb561a88bb49289e4bd6e6102e91c32/screenshots/info1.jpg" width="180" alt="info1"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/9ef8c0432fb561a88bb49289e4bd6e6102e91c32/screenshots/photoview.jpg" width="180" alt="photoview"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/9ef8c0432fb561a88bb49289e4bd6e6102e91c32/screenshots/settings.jpg" width="180" alt="settings"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/7ddc400f8507ffd78a4c48b2a63a1dca12b7be52/screenshots/stripe.jpg" width="180" alt="stripe"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/1b4bdbd9767eb21b90a4830b90146afa756fe6d8/screenshots/reservasions.jpg" width="180" alt="reservasions"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/1b4bdbd9767eb21b90a4830b90146afa756fe6d8/screenshots/preorders.jpg" width="180" alt="preorders"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/1b4bdbd9767eb21b90a4830b90146afa756fe6d8/screenshots/pickup2.jpg" width="180" alt="pickups2"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/1b4bdbd9767eb21b90a4830b90146afa756fe6d8/screenshots/cart.jpg" width="180" alt="cart"/>
  <img src="https://github.com/mo7amedaliEbaid/garcon/blob/1b4bdbd9767eb21b90a4830b90146afa756fe6d8/screenshots/pickup_order_checkout.jpg" width="180" alt="pickOrder"/>
</p>

## Demos


https://github.com/user-attachments/assets/a0d9afb7-9918-4dd6-b2b3-eb22ab82856d




https://github.com/user-attachments/assets/291582c1-c7bc-4b17-998d-600f28cc980f




https://github.com/user-attachments/assets/913288aa-1a49-44dc-8f9a-bb64d7dc09cf




https://github.com/user-attachments/assets/c5604b7c-8de6-4c92-9db5-3074dc14b617

