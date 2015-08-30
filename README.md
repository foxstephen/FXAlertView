# FXAlertView-iOS
An alernative alert to the native iOS UIAlertController and UIAlertView.

# Screenshot
![alt tag](https://github.com/StephenFox1995/FXAlertView-iOS/blob/master/Screen%20Shot%202015-08-30%20at%2023.17.28.png)

#Usage
Maker sure to import the header file `FXAlert.h`. To make an alert create an instance of `FXAlertController`.
```FXAlertController *fxAlertView = [[FXAlertController alloc] initWithTitle:@"ALERT" message:@"This is a cool alert, isn't it?"];```


#FXAlertButton
To add an action to a button create a `FXAlertButton`

`FXAlertButton` is a subclass of `UIButton` so you still get all the functionality of a `UIButton`. When constructing a button specify which type of button you want to create, there's two type `FXAlertButtonTypeStandard` and `FXAlertButtonTypeCancel`. The buttons will be positioned based on their type.

Standard Button.
```
FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
```

Cancel Button
``` 
FXAlertButton *cancelButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeCancel];
```

You can then setup the button like you would a normal `UIButton`.
```
[standardButton setTitle:@"Sure is!" forState:UIControlStateNormal];
[fxAlertView addButton:standardButton];
[standardButton addTarget:self action:@selector(someAction) forControlEvents:UIControlEventTouchUpInside];
```

Once setup add the button to the alert as follows
```[fxAlertView addButton:standardButton];```


#Presenting FXAlertController
To present an alert just call `-presentViewController:animated:completion:` like you would to present any other UIViewController.
```[self presentViewController:fxAlertView animated:YES completion:nil];```

