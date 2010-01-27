//
//  FloorplansViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"
#import "Floorplan.h"
#import "FloorplanView.h"
#import "FloorplanScrollerView.h"
#import "FloorplansViewController.h"


@interface FloorplansViewController (PrivateMethods)
- (void)changePage:(id)sender;
- (void)loadScrollViewWithPage:(int)page;
@end


@implementation FloorplansViewController

@synthesize property, floorplans;

- (void)loadView {
	FloorplanScrollerView *scrollerView = [[FloorplanScrollerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	self.view = scrollerView;
	
	[scrollerView release];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setTitle:@"Floorplans"];
	
	floorplans = [[NSMutableArray alloc] init];
	
	for (Floorplan *floorplan in property.floorplans) {
		[floorplans addObject:[NSNull null]];
	}
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	
	[mainView.scrollView setDelegate:self];
	[mainView.pageControl setNumberOfPages:[floorplans count]];
	[mainView.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	
	[mainView.scrollView setContentSize:CGSizeMake([floorplans count] * mainView.scrollView.frame.size.width, mainView.scrollView.frame.size.height)];
	
	[self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= [floorplans count]) return;
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	FloorplanView *floorplanView = [floorplans objectAtIndex:page];
	
	if ((NSNull *)floorplanView == [NSNull null]) {
		floorplanView = [[FloorplanView alloc] initWithFrame:CGRectMake(mainView.scrollView.frame.size.width * page, 0.0, mainView.scrollView.frame.size.width, mainView.scrollView.frame.size.height)];
		
		[floorplanView setImagePath:[(Floorplan *)[property.floorplans objectAtIndex:page] image_path]];
		[floorplans replaceObjectAtIndex:page withObject:floorplanView];
		[mainView.scrollView addSubview:floorplanView];
		[floorplanView release];
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (pageControlUsed) {
        return;
    }
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
    CGFloat pageWidth = mainView.scrollView.frame.size.width;
	
    int page = floor((mainView.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
	mainView.pageControl.currentPage = page;
	
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    // TODO: Unload unnecessary views
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (void)changePage:(id)sender {
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
    int page = mainView.pageControl.currentPage;
	
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    CGRect frame = mainView.scrollView.frame;
	
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    
	[mainView.scrollView scrollRectToVisible:frame animated:YES];
	
    pageControlUsed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)dealloc {
	[property release];
	[floorplans release];
    [super dealloc];
}

@end