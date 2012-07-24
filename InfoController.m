//
//  InfoController.m
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "InfoController.h"
#import "InfoView.h"
#import "StatsView.h"

@interface InfoController ()

@end

@implementation InfoController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}


- (id) initWithTitle: (NSString *) title information: (NSString *) i symbol: (NSString *) stkSym{
	self = [super initWithNibName: nil bundle: nil];
	if (self) {
		// Custom initialization
		self.title = title;
		sym = stkSym;
		self.navigationItem.leftBarButtonItem =
		[[UIBarButtonItem alloc] initWithTitle: @"Stats"
										 style: UIBarButtonItemStylePlain
										target: self
										action: @selector(stats)
		 ];
		
		self.navigationItem.rightBarButtonItem =
		[[UIBarButtonItem alloc] initWithTitle: @"Done"
										 style: UIBarButtonItemStylePlain
										target: self
										action: @selector(done)
		 ];
		information = i;
	}
	return self;
}

- (void) stats{
	[(InfoView *)self.view startAnimating];
	[(InfoView *)self.view setNeedsDisplay];
	self.navigationItem.leftBarButtonItem = nil;
	[self performSelector:@selector(loadStats) withObject:nil afterDelay:1];
	
	
}
- (void) loadStats{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[StatsView alloc] initWithFrame: frame symbol: sym];
}
- (void) done {
	[self dismissModalViewControllerAnimated: YES];
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[InfoView alloc] initWithFrame: frame information: information];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end
