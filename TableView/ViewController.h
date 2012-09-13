//
//  ViewController.h
//  TableView
//
//  Created by Apple on 9/12/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *sectionTitle;
    NSMutableArray *contents;
}

@property (nonatomic, retain) NSArray *sectionTitle;
@property (nonatomic, retain) NSMutableArray *contents;

- (void) linkToOtherView: (NSString *)viewName;

- (IBAction)btnLink:(id)sender;


@end
