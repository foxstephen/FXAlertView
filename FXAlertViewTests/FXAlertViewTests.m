//
//  FXAlertViewTests.m
//  FXAlertViewTests
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FXAlert.h"

@interface FXAlertViewTests : XCTestCase

@end

@implementation FXAlertViewTests

- (void)setUp {
    [super setUp];
 
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    UIFont *testFont = [UIFont fontWithName:@"Zapfino" size:20];
    UIColor *testColour = [UIColor redColor];
    
    FXAlertController *testAlert = [[FXAlertController alloc ]initWithTitle:@"Test" message:@"This is a test"];
    XCTAssertNotNil(testAlert, @"testAlert failed initialisation.");
    
    testAlert.font = testFont;
    XCTAssertEqualObjects(testAlert.font, testFont);
    
    testAlert.titleFont = testFont;
    XCTAssertEqualObjects(testAlert.titleFont, testFont);
    
    testAlert.standardButtonColour = testColour;
    XCTAssertEqualObjects(testAlert.standardButtonColour, testColour);
    
    testAlert.cancelButtonColour = testColour;
    XCTAssertEqualObjects(testAlert.cancelButtonColour, testColour);
    
    
    FXAlertButton *testButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    XCTAssertNotNil(testButton, @"test Button failed initialisation");
    
    XCTAssertEqual(testButton.type, FXAlertButtonTypeStandard);
    
    
    XCTAssertEqualObjects([FXAlertButton standardColour], [UIColor colorWithRed:0.125 green:0.784 blue:0.392 alpha:1.0]);
    XCTAssertEqualObjects([FXAlertButton cancelColour], [UIColor colorWithWhite:0.8 alpha:1.0]);
    
    [testAlert addButton:testButton];
    
    XCTAssertEqualObjects(testButton.titleLabel.font, testFont);
    XCTAssertEqualObjects(testButton.backgroundColor, testColour);

    

    
}


@end
