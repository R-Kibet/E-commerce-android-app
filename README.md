# E-COMMERCE Android application
Application running on Flutter for the front_end and node.js for the backend

## Table of Contents
* [Description](#description)
* [File Structure](#file-structure)
* [Requirements](#requirements)
* [Quick Start](#quick-start)
* [Usage](#usage)
* [Bugs](#bugs)


## Description
**The application**

Will help us to:

1. Create a buyer or seller profile
2. Manage (create, update, destroy, etc) via the UI
3. Store products to mongodb server

In this case, we want to be able to manage the objects of our application:
#As Admin/Seller
* Create a new product
* Retrieve an product from a database etc…
* Update attributes of the product
* Delete the product
* Viewing Orders
* Changing Order Status
* Viewing Total Earnings
* Viewing Category Based Earnings (on Graph)

#AS Consumer
* Create your own cart
* Retrieve an product from a database etc…
* Update the products on you cart
* Delete the product on your cart

* The application will automatically do the stats of your cart.

## File Structure

These are the files with the custom funtions and system calls, each one contains a brief description:



|   ***File***    |  ***Description***                   |
|---------------|---------------------------------------|
|  #Flutter                                      |  
|  [`main`](.main.dart)	|  program file file	|
|  [`common`](/widget) |  Contains all the widget and app bars |
|  [`constants`](/global) |  contains global files to be used repeatedly |
|  [`enums`](/menu &/action) | contains menu and action bar |
|  [`models`](./product/user) |  User schema and model schema |
|  [`services`](/auth/admin/provider) |  admin auth and provider services|
|  [`utils`](/pick_image/snackbar) |  utilities folder and pop ups |
|  [`views`] |  Contains all the screen to be viewed in tha app |
|  # NODE.JS (SERVER)|
|  [`Index`](./index.js) |  run server program |
|  [`middleware`](/auth/admin) |  Contains middleware APIs |
|  [`models`](/product/user) |  product and user schema |
|  [`routes`](/auth/admin) |  authentication and admin routes |
|  [`utils`](/encrypt) |  encryption for senstitive data	       |
|  [`README.md`](./README.md) | README.md file |

## Requirements
After cloning this repository, migrate to ```amazon_clone``` folder. Then, follow the following steps:
- Create MongoDB Project & Cluster
- Click on Connect, follow the process where you will get the uri.- Replace the MongoDB uri with yours in ```server/index.js```.
- create ```lib/constants/.env.dart``` file, create "String uri = IP Address". 
- Create Cloudinary Project, enable unsigned operation in settings.
- Head to ```lib/services/admin/admin_services.dart```, replace final cloud  with your Cloud Name and Upload Preset respectively.

## Quick Start
Then run the following commands to run your app:

### Server Side
```bash
  cd server
  npm install
  npm run dev (for continuous development)
  OR
  npm start (to run script 1 time)
```

### Client Side
```bash
  flutter pub get
  open -a simulator (to get iOS Simulator)
  flutter run
```

## Tech Used
**Server**: Node.js, Express, Mongoose, MongoDB, Cloudinary

**Client**: Flutter, Provider
