//
//  TEVTopExpandingScrollView.h
//  TopExpandingView
//
//  Created by Matt on 8/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEVTopExpandingScrollView : UIView <UIScrollViewDelegate>

@property UIView *topView;
@property (nonatomic) int minTopViewHeight;
@property (nonatomic) int maxTopViewHeight;
@property (nonatomic) int topViewHeight;

@property UIScrollView *scrollView;

#pragma mark Initialisation Methods
- (id)init;
- (id)initWithFrame:(CGRect)frame;
- (id)initWithTopView:(UIView *)view;

#pragma mark Property Setter Methods
- (void)setTopViewHeight:(int)topViewHeight;
- (void)setMinTopViewHeight:(int)minTopViewHeight;
- (void)setMaxTopViewHeight:(int)maxTopViewHeight;

#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end
