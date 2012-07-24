//
//  StatsView.h
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsView : UITextView{
	
	NSString *stkSymbol;
}

- (id) initWithFrame: (CGRect) frame symbol: (NSString *) sym;

@end
