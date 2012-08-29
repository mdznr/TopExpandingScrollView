//
//  TEVViewControlleriPad.m
//  TopExpandingView
//
//  Created by Matt on 8/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "TEVViewControlleriPad.h"

@interface TEVViewControlleriPad ()

@end

@implementation TEVViewControlleriPad

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	TEVTopExpandingScrollView *test = [TEVTopExpandingScrollView alloc];
	[test setTopViewHeight:160];
	[test setMinTopViewHeight:160];
	[test setMaxTopViewHeight:200];
	test = [test init];
	[test setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[[self view] addSubview:test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
