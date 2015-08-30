# FXAlertView-iOS
An alernative alert to the native iOS UIAlertController and UIAlertView.

# Screenshot
![alt tag](https://github.com/StephenFox1995/FXAlertView-iOS/blob/master/Assets/Screenshot.png)

#Usage
Maker sure to import the header file `FXAlert.h`. To make an alert create an instance of `FXAlertController`.
```
FXAlertController *fxAlertView = [[FXAlertController alloc] initWithTitle:@"ALERT" message:@"This is a cool alert, isn't it?"];
```


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
```
[fxAlertView addButton:standardButton];
```
Standard Button

![alt tag](https://github.com/StephenFox1995/FXAlertView-iOS/blob/master/Assets/StandardButton.png)

Cancel Button

![alt tag](https://github.com/StephenFox1995/FXAlertView-iOS/blob/master/Assets/CancelButton.png)


#Presenting FXAlertController
To present an alert just call `-presentViewController:animated:completion:` like you would to present any other UIViewController.

```
[self presentViewController:fxAlertView animated:YES completion:nil];
```

#License

```
The MIT License (MIT)

Copyright (c) 2015 Stephen Fox

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
