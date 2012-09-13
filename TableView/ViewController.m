//
//  ViewController.m
//  TableView
//
//  Created by Apple on 9/12/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sectionTitle;
@synthesize contents;

#pragma mark - view lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    sectionTitle = [[NSArray alloc] initWithObjects:@"Japanese Cartoon Characters", @"US Cartoon Characters", nil ];
    contents = [[NSMutableArray alloc] initWithCapacity: 2];
    [contents insertObject:[NSArray arrayWithObjects:@"Doraemon", @"Hello Kitty", @"Totoro", @"Mario", @"Astro Boy", @"Pikachu",nil]  atIndex:0];
    [contents insertObject:[NSArray arrayWithObjects:@"Bugs Bunny", @"Tom and Jerry", @"Popeye the Sailor Man", @"Donald Duck",nil]  atIndex:1];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Table View

// set number of section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [sectionTitle count];
}

// set number of rows in each section
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    {
    return [[contents objectAtIndex:section] count];
}

// set value of cell in row
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]; // declare cell for table view cell *
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]; // initail cell *
    }
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; // cell style
    
    //cell.textLabel.text = [items objectAtIndex:indexPath.row]; // set array to cell of table view
    cell.textLabel.text = [[contents objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
   // NSLog(@"%d", indexPath.section);
    return cell;
}

// select row event
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *msg = [NSString stringWithFormat:@"You have selected %@", [[contents objectAtIndex:indexPath.section ] objectAtIndex:indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected Item" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil ];
    [alert show];
}

// change header section of table view
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionHeader = nil;
	
    sectionHeader = [sectionTitle objectAtIndex:section];
	
	return sectionHeader;
}

#pragma mark - Other methods

- (void) linkToOtherView:(NSString *)viewName {
    UIViewController* flipViewController = [[UIViewController alloc] initWithNibName:viewName bundle:[NSBundle mainBundle]];
    [self.view addSubview:flipViewController.view];
}

- (IBAction)btnLink:(id)sender {
    UIViewController* flipViewController = [[UIViewController alloc] initWithNibName:@"NewView" bundle:[NSBundle mainBundle]];
    [self.view addSubview:flipViewController.view];
}

@end
