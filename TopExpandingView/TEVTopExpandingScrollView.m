//
//  TEVTopExpandingScrollView.m
//  TopExpandingView
//
//  Created by Matt on 8/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "TEVTopExpandingScrollView.h"

@implementation TEVTopExpandingScrollView

- (id)init
{
	CGSize size = [UIScreen mainScreen].bounds.size;
	return [self initWithFrame:CGRectMake(0,
										  0,
										  size.width,
										  size.height - 20)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
	{
		if ( !_scrollView )
		{
			_scrollView = [[UIScrollView alloc] initWithFrame:frame];
			[_scrollView setDelegate:self];
		}
		
		if ( !_topViewHeight )
		{
			_topViewHeight = 180;
		}
		
		if ( !_topView )
		{
			UIImage *image = [UIImage imageNamed:@"testImage"];
			_topView = [[UIImageView alloc] initWithImage:image];
		}
					
		[_topView setContentMode:UIViewContentModeCenter];
		[_topView setContentMode:UIViewContentModeScaleAspectFill]; // ***
		[_topView setFrame:CGRectMake(frame.origin.x,
									 frame.origin.y,
									 frame.size.width,
									 _topViewHeight)];
		[_topView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		
		UIView *bottom = [[UIView alloc] initWithFrame:
						  CGRectMake(frame.origin.x,
									 _topViewHeight,
									 frame.size.width,
									 1280 - _topViewHeight)];
		[bottom setBackgroundColor:[UIColor whiteColor]];
		[bottom setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		
		[_scrollView addSubview:bottom];
		[_scrollView setContentSize:CGSizeMake(frame.size.width, 1280)];
		[_scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ];
		[_scrollView setAutoresizesSubviews:YES];
		
		[self setBackgroundColor:[UIColor redColor]];
		[self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[self addSubview:_topView];
		[self addSubview:_scrollView];
		
    }
    return self;
}

- (id)initWithTopView:(UIView *)view
{
	_topView = view;
	return [self init];
}

#pragma mark Setters

- (void)setTopViewHeight:(int)topViewHeight
{
	_topViewHeight = topViewHeight;
	[self checkMaxAndMin];
}

- (void)setMinTopViewHeight:(int)minTopViewHeight
{
	_minTopViewHeight = minTopViewHeight;
	[self checkMaxAndMin];
}

- (void)setMaxTopViewHeight:(int)maxTopViewHeight
{
	_maxTopViewHeight = maxTopViewHeight;
	[self checkMaxAndMin];
}

- (void)checkMaxAndMin
{
	if ( _minTopViewHeight > _topViewHeight )
	{
		_minTopViewHeight = _topViewHeight;
	}
	if ( _maxTopViewHeight < _topViewHeight )
	{
		_maxTopViewHeight = _topViewHeight;
	}
}

#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	int yOffset = scrollView.contentOffset.y;
	
	// Hits Max Height
	if ( _maxTopViewHeight && _topViewHeight > _maxTopViewHeight + yOffset )
	{
		NSLog(@"Hitting Max Height %f", scrollView.contentOffset.y);
		[_topView setFrame:
		 CGRectMake(_topView.frame.origin.x,
					_topViewHeight - _maxTopViewHeight - yOffset,
					_topView.frame.size.width,
					_maxTopViewHeight)];
	}
	
	// Hits Min Height
	else if ( _minTopViewHeight && _minTopViewHeight + yOffset > _topViewHeight  )
	{
		NSLog(@"Hitting Min Height %f", scrollView.contentOffset.y);
		[_topView setFrame:
		 CGRectMake(_topView.frame.origin.x,
					_topViewHeight - _minTopViewHeight - yOffset,
					_topView.frame.size.width,
					_minTopViewHeight)];
	}
	
	// Other
	else if ( yOffset < _topViewHeight )
	{
		NSLog(@"Not hitting limits %f", scrollView.contentOffset.y);
		[_topView setFrame:
		 CGRectMake(_topView.frame.origin.x,
					_topView.frame.origin.y,
					_topView.frame.size.width,
					_topViewHeight - yOffset)];
	}
}

@end