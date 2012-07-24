//
//  InfoView.h
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView : UITextView{
	UIActivityIndicatorView *indicator;
}
- (id) initWithFrame: (CGRect) frame information: (NSString *) information;
- (void) startAnimating;
- (void) stopAnimating;

@end
