//
//  PurchaseDetailsViewController.m
//  Cash_Register
//
//  Created by Yinhuan Yuan on 5/1/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import "PurchaseDetailsViewController.h"

@interface PurchaseDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *quantityLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;



@end

@implementation PurchaseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLbl.text = [self.singlePurchase name];
    self.quantityLbl.text = [NSString  stringWithFormat:@"%d", [self.singlePurchase quantity]];
    self.totalCostLbl.text = [NSString  stringWithFormat:@"%g", [self.singlePurchase price]];
    self.dateLbl.text = [self.singlePurchase description];
}
- (IBAction)doneBtnPressed:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
