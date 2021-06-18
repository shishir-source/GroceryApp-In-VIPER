<h2>What is VIPER architecture?</h2>

<b style= " color: #000000 ">VIPER</b> design pattern is based on Single Responsibility Principle which leads to a clean architecture.

This pattern implements ‘separation of concern’ paradigm. Mostly like MVP or MVC, it follows a modular approach. One feature, one module. For each module, <b>VIPER</b> has five different classes with distinct roles. No class goes beyond its sole purpose.

These classes are following:

1.	The <b>View</b> is the user interface. This corresponds to a SwiftUI View.
2.	The <b>Interactor</b>. is a class that mediates between the presenter and the data. It takes direction from the presenter.
3.	The <b>Presenter</b> is the “traffic cop” of the architecture, directing data between the view and interactor, taking user actions and calling to router to move the user between views.
4.	An <b>Entity</b> represents application data.
5.	The <b>Router</b> handles navigation between screens. That’s different than it is in SwiftUI, where the view shows any new views.

 
 ![viper](https://user-images.githubusercontent.com/29437415/122590218-0fd76680-d083-11eb-85ce-77253e0f93cf.png)
 
 
 <img width="1440" alt="Screenshot 2021-06-18 at 9 54 24 PM" src="https://user-images.githubusercontent.com/29437415/122590254-1cf45580-d083-11eb-8659-4c97165af54b.png">

 


References: 

•	https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6

•	https://medium.com/cr8resume/viper-architecture-for-ios-project-with-simple-demo-example-7a07321dbd29#:~:text=VIPER%20is%20a%20backronym%20for,whatever%20the%20presenter%20tells%20it

•	https://www.raywenderlich.com/8440907-getting-started-with-the-viper-architecture-pattern

