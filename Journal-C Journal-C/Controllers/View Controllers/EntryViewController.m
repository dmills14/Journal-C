//
//  EntryViewController.m
//  Journal-C Journal-C
//
//  Created by Drew Miller on 8/10/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import "EntryViewController.h"

@interface EntryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    // Do any additional setup after loading the view.
}

- (void)updateViews
{
    if (self.entryToReceive)
    {
        self.titleTextField.text = self.entryToReceive.title;
        self.bodyTextView.text = self.entryToReceive.bodyText;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entryToReceive)
    {
        [EntryController.sharedInstance updateEntry: self.entryToReceive title: self.entryToReceive.title bodyText :self.entryToReceive.bodyText];
    } else {
       //Entry * entry = [[Entry alloc] initWithName:self.titleTextField.text abbreviation:self.bodyTextView.text];
        Entry * entry = [[Entry alloc] initWithName:self.titleTextField.text bodyText:self.bodyTextView.text timestamp:[NSDate new]];
        [[EntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
