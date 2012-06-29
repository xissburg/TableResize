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
    self.dataArray = [[NSArray alloc] initWithObjects:@"Hi.", @"How are you?", @"Hope you're doing good.", @"This", @"is", @"an", @"example", @"of how", @"to", @"properly", @"\"resize\"", @"your", @"table", @"view", @"so that", @"you", @"can", @"display", @"something", @"like a", @"keyboard", @"under it", @"and still", @"have the", @"desired", @"behavior (to", @"be able to", @"scroll", @"till the", @"bottom) without", @"any", @"glitches", @"at all.", @"Usually", @"we would", @"try to", @"do this", @"by", @"changing", @"the frame", @"of the", @"table view, and", @"that is", @"the cause", @"of the", @"glitch, for", @"some", @"reason.", @"The", @"trick", @"is to", @"change the", @"contentInset", @"instead.", @"This technique", @"applies", @"to", @"scroll", @"views", @"as well, of", @"course.", @"Hope", @"this", @"helps", @"you", @"to get", @"rid", @"of", @"that", @"annoying", @"glitch", @"once", @"and", @"for", @"all.", nil];
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
    [UIView animateWithDuration:0.25 animations:^{
        CGRect r = self.textContainerView.frame;
        r.origin.y = self.view.frame.size.height - 216 - r.size.height;
        self.textContainerView.frame = r;
        
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 216, 0); // Set the height of the keyboard into the bottom inset
        self.tableView.contentInset = insets;
        self.tableView.scrollIndicatorInsets = insets; // Also set it to the scroll indicators otherwise they're going to move behind the keyboard
        
    }];
    
    // If you want to, you can also scroll keep the bottom of the tableView visible on the top of the keyboard, no glitches!
    if (self.tableView.contentOffset.y == self.tableView.contentSize.height - self.tableView.frame.size.height) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect r = self.textContainerView.frame;
        r.origin.y = self.view.frame.size.height - r.size.height;
        self.textContainerView.frame = r;

        // Just zero the insets out
        self.tableView.contentInset = UIEdgeInsetsZero;
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
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
