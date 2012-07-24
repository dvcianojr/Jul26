//
//  InfoController.h
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoController : UIViewController{
	NSString *information;
	NSString *sym;
}

- (id) initWithTitle: (NSString *) title information: (NSString *) i symbol: (NSString *) stkSym;

@end
