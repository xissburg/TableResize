//
//  ViewController.m
//  TableResize
//
//  Created by xiss burg on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize textContainerView;
@synthesize textView;
@synthesize dataArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = [[NSArray alloc] initWithObjects:@"lmao", @"rofl", @"lol", @"you", @"are", @"a", @"fucking", @"dick", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect r = self.textContainerView.frame;
        r.origin.y = self.view.frame.size.height - 216 - r.size.height;
        self.textContainerView.frame = r;
        
        r = self.tableView.frame;
        r.size.height = self.view.frame.size.height - 216 - self.textContainerView.frame.size.height;
        self.tableView.frame = r;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{

    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect r = self.textContainerView.frame;
        r.origin.y = self.view.frame.size.height - r.size.height;
        self.textContainerView.frame = r;
        
        r = self.tableView.frame;
        r.size.height = self.view.frame.size.height - self.textContainerView.frame.size.height;
        self.tableView.frame = r;
        
        self.tableView.contentOffset = CGPointMake(0.0f, self.tableView.contentSize.height - r.size.height + 1.0f);
        
    } completion:^(BOOL finished) {
        
    }];        
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)derpButtonTouchUpInside:(id)sender 
{
    [self.textView resignFirstResponder];
}

@end
