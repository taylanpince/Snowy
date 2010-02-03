//
//  FloorplansViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"
#import "Floorplan.h"
#import "FloorplanScrollerView.h"
#import "FloorplansViewController.h"


@interface FloorplansViewController (PrivateMethods)
- (void)changePage:(id)sender;
- (void)loadScrollViewWithPage:(int)page;
- (void)flipActivePanel:(UIView *)panel;
- (void)transitionDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
@end


@implementation FloorplansViewController

@synthesize floorplans, floorplanViews;

- (void)loadView {
	FloorplanScrollerView *scrollerView = [[FloorplanScrollerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	self.view = scrollerView;
	
	[scrollerView release];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setTitle:@"Floorplans"];
	
	floorplanViews = [[NSMutableArray alloc] init];
	
	for (Floorplan *floorplan in floorplans) {
		[floorplanViews addObject:[NSNull null]];
	}
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	
	[mainView.scrollView setDelegate:self];
	[mainView.pageControl setNumberOfPages:[floorplanViews count]];
	[mainView.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
	
	inVirtualTour = NO;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	
	[mainView.scrollView setContentSize:CGSizeMake([floorplanViews count] * mainView.scrollView.frame.size.width, mainView.scrollView.frame.size.height)];
	
	[self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= [floorplanViews count]) return;
	
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	FloorplanView *floorplanView = [floorplanViews objectAtIndex:page];
	Floorplan *floorplan = (Floorplan *)[floorplans objectAtIndex:page];
	
	if ((NSNull *)floorplanView == [NSNull null]) {
		floorplanView = [[FloorplanView alloc] initWithFrame:CGRectMake(mainView.scrollView.frame.size.width * page, 0.0, mainView.scrollView.frame.size.width, mainView.scrollView.frame.size.height)];
		
		[floorplanView setDelegate:self];
		[floorplanView setImagePath:floorplan.image_path];
		[floorplanView setBookmarked:[floorplan isBookmarked]];
		[floorplanViews replaceObjectAtIndex:page withObject:floorplanView];
		[mainView.scrollView addSubview:floorplanView];
		[floorplanView release];
	}
}

- (void)floorplanViewDidTouchInfoButton:(FloorplanView *)view {
	[self flipActivePanel:view];
}

- (void)virtualTourViewDidTouchInfoButton:(VirtualTourView *)view {
	[self flipActivePanel:view];
}

- (void)flipActivePanel:(UIView *)panel {
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	CGFloat pageWidth = mainView.scrollView.frame.size.width;
    int page = floor((mainView.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	
	[mainView.scrollView setScrollEnabled:NO];
	[mainView.pageControl setUserInteractionEnabled:NO];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
	
    if (!inVirtualTour) {
		VirtualTourView *virtualTourView = [[VirtualTourView alloc] initWithFrame:mainView.frame];
		
		[virtualTourView setDelegate:self];
		[virtualTourView setImagePath:[(Floorplan *)[floorplans objectAtIndex:page] virtual_tour_path]];
		[virtualTourView setInfoBubbles:[(Floorplan *)[floorplans objectAtIndex:page] info_bubbles]];
		
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:mainView cache:YES];
		[mainView.scrollView removeFromSuperview];
		[mainView addSubview:virtualTourView];
		[virtualTourView release];
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:mainView cache:YES];
        [panel removeFromSuperview];
        [mainView addSubview:mainView.scrollView];
    }
	
	[UIView commitAnimations];
	
	inVirtualTour = !inVirtualTour;
}

- (void)transitionDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	[[(FloorplanScrollerView *)[self view] scrollView] setScrollEnabled:!inVirtualTour];
	[[(FloorplanScrollerView *)[self view] pageControl] setUserInteractionEnabled:!inVirtualTour];
}

- (void)floorplanViewDidTouchBookmarkButton:(FloorplanView *)view {
	FloorplanScrollerView *mainView = (FloorplanScrollerView *)[self view];
	CGFloat pageWidth = mainView.scrollView.frame.size.width;
    int page = floor((mainView.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	Floorplan *floorplan = (Floorplan *)[floorplans objectAtIndex:page];
	
	[floorplan toggleBookmark];
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
	if (inVirtualTour) {
		return;
	}
	
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
	[floorplans release];
	[floorplanViews release];
    [super dealloc];
}

@end