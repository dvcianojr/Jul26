//
//  InfoView.m
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

- (id) initWithFrame: (CGRect) frame information: (NSString *) information
{
	self = [super initWithFrame: frame];
	if (self) {
		indicator = [[UIActivityIndicatorView alloc] initWithFrame: CGRectZero];
		CGRect b = self.bounds;
		CGPoint point = CGPointMake(self.center.x, b.size.height /2.0 - 30);
		indicator.center = point;	
		indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		indicator.hidesWhenStopped = NO;	//default is YES
		indicator.hidden = YES;
		[self addSubview: indicator];
		
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
		self.font = [UIFont fontWithName: @"Courier" size: 14];
		self.text = @"- Description -";
		self.text = [self.text stringByAppendingFormat: @"\n\n%@",information];
		self.editable = NO;		
	}
	return self;
}
- (void) startAnimating
{
	self.text = @"";
	CGRect b = self.bounds;
	CGPoint point = CGPointMake(self.center.x, b.size.height /2.0 - 30);
	indicator.center = point;	
	indicator.hidden = NO;
	//label.text = @"Started";
	[indicator startAnimating];
}


- (void) stopAnimating
{
	//label.text = @"Stopped";
	[indicator stopAnimating];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
