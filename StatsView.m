//
//  StatsView.m
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "StatsView.h"

@implementation StatsView


- (id) initWithFrame: (CGRect) frame symbol: (NSString *) sym
{
	self = [super initWithFrame: frame];
	if (self) {
		stkSymbol = sym;
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
		self.font = [UIFont fontWithName: @"Courier" size: 14];
		self.editable = NO;
		self.text = @"";
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	// get stock data from yahoo finance URL
	NSString *urlGetString =@"http://finance.yahoo.com/d/quotes.csv?s=";
	urlGetString = [urlGetString stringByAppendingFormat:
					@"%@&f=sd1t1l1ohgpjkee7e8e9dyqr1b4rp5p6a2n",stkSymbol];
	NSURL *url = [[NSURL alloc] initWithString: urlGetString];
	NSError *err;
	NSString *sData = [[NSString alloc]
					   initWithContentsOfURL: url
					   encoding: NSUTF8StringEncoding
					   error: &err
					   ];
	
	UIView *v = self;
	if (v != nil)
	{
		if (sData == nil) 
			self.text = [err localizedDescription]; // display error message
		else 
		{
			self.text = @"- Stats -";
			// parse data
			NSArray *components = [sData componentsSeparatedByString:@","];
			NSString *symbol = [components objectAtIndex:0];	
			symbol = [symbol substringWithRange: NSMakeRange (1, symbol.length - 2)];//remove double quotes
			NSString *date = [components objectAtIndex:1];
			date = [date substringWithRange: NSMakeRange (1, date.length - 2)];//remove double quotes
			NSString *time = [components objectAtIndex:2];
			time = [time substringWithRange: NSMakeRange (1, time.length - 2)];//remove double quotes
			NSString *lastPrice = [components objectAtIndex:3];
			//			NSString *open  = [components objectAtIndex:4];
			//			NSString *high  = [components objectAtIndex:5];
			//			NSString *low   = [components objectAtIndex:6];
			//			NSString *close = [components objectAtIndex:7];
			//			NSString *fiftyTwoWeekLow = [components objectAtIndex:8];
			//			NSString *fiftyTwoWeekHigh = [components objectAtIndex:9];
			NSString *eps = [components objectAtIndex:10];
			//			NSString *epsEstCurrYr  = [components objectAtIndex:11];
			//			NSString *epsEstNextYr  = [components objectAtIndex:12];
			//			NSString *epsEstNextQtr = [components objectAtIndex:13];
			NSString *div = [components objectAtIndex:14];
			NSString *divYield = [components objectAtIndex:15];
			NSString *exDivDate = [components objectAtIndex:16];
			exDivDate = [exDivDate substringWithRange: NSMakeRange (1, exDivDate.length - 2)];//remove double quotes			
			NSString *divPayDate = [components objectAtIndex:17];
			divPayDate = [divPayDate substringWithRange: NSMakeRange (1, divPayDate.length - 2)];//remove double quotes				
			NSString *bookValue = [components objectAtIndex:18];
			NSString *peRatio = [components objectAtIndex:19];
			NSString *priceToSalesRatio = [components objectAtIndex:20];			
			NSString *priceToBookRatio = [components objectAtIndex:21];	
			NSString *avgDailyVol = [components objectAtIndex:22];
			NSString *companyName = [components objectAtIndex:23];
			companyName = [companyName substringWithRange: NSMakeRange (1, companyName.length - 4)];//remove double quotes
			
			// format adv with commas			
			NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init]; // Create formatter 
			[formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // Set to decimal style with commas
			NSNumber *nADV = [NSNumber numberWithDouble:([avgDailyVol doubleValue])];
			NSString *formattedADV = [formatter stringForObjectValue: nADV];
			
			// display data 	
			
			
			self.text = [self.text stringByAppendingFormat:
						 @"\n\nSymbol: %@ at %@ on %@\n\nLast Price          : %@\nEPS                 : %@\nDiv                 : %@\nBook Value          : %@\nP/E Ratio           : %@\nDiv Yield           : %@\nPrice to Sales Ratio: %@\nPrice to Book Ratio : %@\nAvg Daily Vol       : %@\n",symbol,time,date,lastPrice,eps,div,bookValue,peRatio,divYield,priceToSalesRatio,priceToBookRatio,formattedADV];
			
		}
	}
}


@end
