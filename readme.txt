IPHONE SOFTWARE ENGINEERING - Assignment 2
Project: RMIT University Cinema App
Version: RMIT_CINEMA_Version 2.0

Xcode Folder Details  - Xcode Version 7.3
———————————————
Header(Connect with OC)
- OC-Header
- TimePickerModule - Reference materials online
- pickCellTest-Bridging-Header.h
- PickerCellsController.m
- PickerCellsDelegate.h
- PickerCellController.h
- PickerCells.h
- RMIT_CINEMA_Version2.0-Bridging-Header.h
Model
- UIenhance
- UIphoto.swift    -  entension image size and improve graphic view

- TicketModel
- TicketTableViewCell.swift       -  modle for Custom table cell
- TicketTableViewCell.xib         -  Custom table cell UI component
- TicektsList.plist               -  Plist hard store tickets price and type

- TicketPickerModel
- AreaModel.swift               - Reference picker view controller online
- AreaFactory.swift             - Reference picker view controller online
- PickerView.swift              - reference picker viwe controller online

- MovieDetailsModel
- MovieTableViewCell.swift
- MovieHistoryList.plist
- HistoryMovieModel.swift
- AccessRemoteInfo.swift
- MovieInfo + CoreDataProperties.swift
- MovieInfo.swift
- MovieHotTableViewCell.swift
- MovieComingTableViewCell.swift
- History + CoreDataProperties.swift
- History.swift
- HistoryModel.swift
- MovieModel.swift

- PersonalDetailsModel
- Form+CoreDataProperties.swift     - extension data Info about Form.swift
- Form.swift                        - Personl register information stored here
- CurrentUser.swift                 - Store current user details and share it's instance
- FormModel.swift                   -

- PersonalDetailsModel
- PersonlDetailsInforProcessor.swift   — model for Login & Register details
- MovieDetailsModel
- MovieHistoryList.plist   — Property list for the details of each movie include name,time and price
- HistoryMovieModel.swift   — model for movie details

Controller
- UserServiceController
- TickerPrintViewController.swift

- Map
- MapViewController.swift
- MapDetails.swift

- MovieViewController
- ShowMovieDetailsViewController.swift
- TimePickerViewController.swift
- MovieMainViewController.swift
- MovieShowingViewController.swift
- MovieHotViewController.swift
- MovieComingViewController.swift

- HelpTabBarController
- HelpPageViewController.swift   — Help Page Tab bar controller
- Account
- HistoryMovieTableViewCell.xib   — Design the new table view cell
- HistoryMovieTableViewCell.swift  —  Controller of HistoryMovieTableViewCell.xib
- ForgetDetailsViewController.swift  —  Contain the functionalities of Forgot details page
- PersonalDetailsViewController.swift  —  Contain the functionalities of Personal details page
- HistoryViewController.swift   —  Contain the functionalities of History record page
- Settings
- SettingViewController.swift  	— Setting Page
- TermsAndConditionsViewController.swift     	 	— Terms&Conditions Page
- FeedbackViewController.swift 			— Feedback Page
- Login&RegisterController
- FirstViewController.swift       — Checking Membership page
- LoginViewController.swift 	— Login Page
- RegisterViewController.swift		— Register Page
- HomePageViewController.swift	— Home Page

ViewController.swift   — Reference page


Project Features Details:
———————————————
1. Welcome Page(Reference Page)  —  contain five Uni page with animation
2. Checking membership page, Login Page, Register Page —  (Allow the uni student to login and the people who’s the member of RMIT to register)
3. Home Page — Allow the user to jump to movie function pages and help function pages
4. Help Function Pages (Contains 6 wireframes)   —  1. user can view their account details
2. user can reset their password
3. user can view their cost history
4. Show the terms&conditions for users
5. user can submit feedback about this app
- Main funcitonalities about Movie Page
6. User can choose Showing Now, Coming Soon, Whats Hot, These three types of function will display different type of movies
7. User can book their favourite movies and choose their suitable ticket type
8. User can check out their ticket and print it
9. User can use this app to find us and their location



Testing Feature:
UI Test(4)  —	 we have 4 UI test    —    RegisterPageUITests.swift 						       —     LoginPageUITests.swift
—     HelpPageUIFunctionCheckingUITests.swift
—     HelpPageUIFunctionCheckingUITests2.swift
(Warning once you running these UI Tests make sure you change the Initial View Controller to the page which you want to test)
For example you want to running the  HelpPageUIFunctionCheckingUITests.swift and  HelpPageUIFunctionCheckingUITests2.swift   : 1. Change the HelpPageTabBarViewController as the initial view controller.
Run these two UI Tests after you finish the first step.

Uint Test(12) - we have more than 12 Uint test

1. Register Form functions testing
2. User information testing
3. Coredata recording testing
4. Map location testing
5  User history recording testing



Contact Details with developer
———————————————
Developer: Junhui Hou(s3462460@student.rmit.edu.au),  Jiapeng Zhu(s3403275@student.rmit.edu.au)

