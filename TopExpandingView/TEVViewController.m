//
//  TEVViewController.m
//  TopExpandingView
//
//  Created by Matt on 8/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "TEVViewController.h"

@interface TEVViewController ()

@end

@implementation TEVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	TEVTopExpandingScrollView *test = [TEVTopExpandingScrollView alloc];
	[test setTopViewHeight:160];
	[test setMinTopViewHeight:160];
	[test setMaxTopViewHeight:200];
	test = [test init];
	
	[[self view] addSubview:test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
