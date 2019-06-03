//
//  ManagerViewController.m
//  Cash_Register
//
//  Created by Yinhuan Yuan on 5/1/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import "ManagerViewController.h"
#import "PurchaseHistoryTableViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Manager";
    NSString *testName2 = [[self.purchases objectAtIndex:0] name];
    NSLog(@"testname2: %@", testName2);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:  @"to_purchase_history"])
    {
        PurchaseHistoryTableViewController * targetVC = (PurchaseHistoryTableViewController *)segue.destinationViewController;
        targetVC.purchases = self.purchases;
    }
}
@end
