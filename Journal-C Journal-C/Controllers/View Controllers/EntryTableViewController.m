//
//  EntryTableViewController.m
//  Journal-C Journal-C
//
//  Created by Drew Miller on 8/10/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import "EntryTableViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryViewController.h"

@interface EntryTableViewController ()

@end

@implementation EntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry * entry = EntryController.sharedInstance.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle: NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timestamp];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry * entry = EntryController.sharedInstance.entries[indexPath.row];
        [[EntryController sharedInstance] removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        EntryViewController * destinationVC = segue.destinationViewController;
        Entry * entryToSend = EntryController.sharedInstance.entries[indexPath.row];
        destinationVC.entryToReceive = entryToSend;
    }
}
@end
