//
//  LocationViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "LocationViewController.h"
#import "PropertyViewController.h"


@interface LocationViewController (PrivateMethods)
- (void)goHome:(id)sender;
@end


@implementation LocationViewController

@synthesize location, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:location.name];
	
	UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quadrant.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(goHome:)];
	
	[self.navigationItem setLeftBarButtonItem:homeButton];
	[homeButton release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)goHome:(id)sender {
	[delegate locationViewControllerDidClose:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [location.properties count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
	Property *property = [location.properties objectAtIndex:indexPath.row];
	
	[cell.textLabel setText:property.name];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PropertyViewController *controller = [[PropertyViewController alloc] initWithStyle:UITableViewStyleGrouped];
	
	[controller setProperty:[location.properties objectAtIndex:indexPath.row]];
	[self.navigationController pushViewController:controller animated:YES];
	
	[controller release];
}

- (void)dealloc {
	[location release];
    [super dealloc];
}

@end