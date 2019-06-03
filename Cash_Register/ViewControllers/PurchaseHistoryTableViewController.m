//
//  PurchaseHistoryTableViewController.m
//  Cash_Register
//
//  Created by Yinhuan Yuan on 5/1/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import "PurchaseHistoryTableViewController.h"
#import "PurchaseHistory.h"
#import "ViewController.h"
#import "PurchaseDetailsViewController.h"

@interface PurchaseHistoryTableViewController () <UITableViewDelegate, UITableViewDataSource>
//@property (nonatomic) ViewController* cashRegister;
//@property (nonatomic) NSString *cellID;
@end

@implementation PurchaseHistoryTableViewController
@synthesize purchases = _purchases;
- (void)viewDidLoad {
    [super viewDidLoad];
   // self.cellID = @"cell";
   // NSString *testName2 = [[self.purchases objectAtIndex:0] name];
   // NSLog(@"testname: %@", testName2);
   /* double price = [[self.purchases objectAtIndex:0] price];
     NSLog(@"price: %f", price);
     NSString *priceStr = [NSString stringWithFormat:@"%f", price];
    NSString *priceStr1 = [@(price) stringValue];
    NSLog(@"priceStr: %@", priceStr);*/
}

-(NSMutableArray*) purchases{
   
    if (!_purchases) {
        _purchases = [[NSMutableArray alloc]init];
    }
    return _purchases;
}
-(void) setPurchases:(NSMutableArray *)purchases {
    _purchases = purchases;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.purchases.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.purchases objectAtIndex:indexPath.row] name];
    int quantity = [[self.purchases objectAtIndex:indexPath.row] quantity];
    NSString *quantityStr = [NSString stringWithFormat:@"%d", quantity];
    cell.detailTextLabel.text = quantityStr;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.singlePurchase = [self.purchases objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier:@"purchase_detail" sender:self];
}
#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     PurchaseDetailsViewController* targetVC = [segue destinationViewController];
     targetVC.singlePurchase = self.singlePurchase;
 }


@end
