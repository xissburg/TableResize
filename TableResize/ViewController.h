//
//  ViewController.h
//  TableResize
//
//  Created by xiss burg on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *textContainerView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)derpButtonTouchUpInside:(id)sender;

@end
