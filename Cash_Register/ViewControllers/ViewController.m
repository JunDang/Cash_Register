//
//  ViewController.m
//  Cash_Register
//
//  Created by Yinhuan Yuan on 4/30/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
#import "PurchaseHistory.h"
#import "ManagerViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLbl;
@property (weak, nonatomic) IBOutlet UIPickerView *invertoryPickerView;
@property (weak, nonatomic) IBOutlet UILabel *quantityLbl;

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) Item *item;
@property (nonatomic) Item *buyingItem;
@property (nonatomic) int buyingQuantity;
@property (nonatomic) double totalPrice;
@property (weak, nonatomic) IBOutlet UILabel *errorMessageLbl;

// for tableviewcontroller

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.nameLbl sizeToFit];
    //[self.totalPriceLbl sizeToFit];
    self.navigationItem.title = @"Cash_Register";
    self.errorMessageLbl.numberOfLines = 4;
    self.errorMessageLbl.lineBreakMode = UILineBreakModeWordWrap;
}
-(NSMutableArray*)items {
    if (!_items) {
        Item* pants = [[Item alloc]initWithName:@"pants" price:109.99 quantity:5];
        Item* shoes = [[Item alloc]initWithName:@"shoes" price:300.99 quantity:10];
        Item* shirts = [[Item alloc]initWithName:@"shirts" price:99.99 quantity:10];
        Item* dress = [[Item alloc]initWithName:@"dress" price:499.99 quantity:10];
        
        _items = [[NSMutableArray alloc]initWithObjects:pants, shoes, shirts, dress, nil];
    }
    return _items;
}

- (IBAction)clearBtnPressed:(UIButton *)sender {
    NSLog(@"clear");
    self.totalPriceLbl.text = @"";
    self.quantityLbl.text = @"";
    //self.nameLbl.text = @"";
    self.errorMessageLbl.text = @"";
}

- (IBAction)numBtnPressed:(UIButton *)sender {
    self.errorMessageLbl.text = @"";
    self.totalPriceLbl.text = @"";
    self.quantityLbl.text = [NSString  stringWithFormat:@"%@%@", self.quantityLbl.text, sender.titleLabel.text];
    self.buyingQuantity = [self.quantityLbl.text intValue];
   
    self.totalPrice = [self.buyingItem price] * self.buyingQuantity;
    self.totalPriceLbl.text = [NSString  stringWithFormat:@"%g", self.totalPrice];
}

- (IBAction)buyBtnPressed:(UIButton *)sender {
  
    int availableQuantity = [self.buyingItem quantity];
    int leftQuantity = availableQuantity - self.buyingQuantity;
    if (leftQuantity < 0){
        self.errorMessageLbl.text = [NSString stringWithFormat:@"available quantity is: %d", availableQuantity];
        NSLog(@"%@", self.errorMessageLbl.text);
        return;
    }
    self.totalPrice = [self.buyingItem price] * self.buyingQuantity;
    [self.buyingItem setQuantity:leftQuantity];
    [self.invertoryPickerView reloadAllComponents];
    [self updatePurchaseArray];
    //self.totalPriceLbl.text = @"";
    //self.quantityLbl.text = @"";
    //self.nameLbl.text = @"";
    self.errorMessageLbl.text = @"";
}

-(void)updatePurchaseArray {
    NSDate *date = [NSDate date];
    NSLog(@"total price: %f", self.totalPrice);
    PurchaseHistory *purchase = [[PurchaseHistory alloc] initWithName:self.nameLbl.text price:self.totalPrice quantity: self.buyingQuantity purchaseDate: date];
    if (!_purchaseArray) {
        _purchaseArray = [[NSMutableArray alloc]init];
    }
    [self.purchaseArray addObject: purchase];
    double price = [[self.purchaseArray objectAtIndex:0] price];
    NSLog(@"total price: %f", price);
  
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.items.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   
    return [[self.items objectAtIndex: row] description];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.totalPriceLbl.text = @"";
    self.quantityLbl.text = @"";
    self.buyingQuantity = 0;
    self.buyingItem = [self.items objectAtIndex:row];
    self.nameLbl.text = self.buyingItem.name;
    double totalPrice = [self.buyingItem price] * self.buyingQuantity;
    self.totalPriceLbl.text = [NSString  stringWithFormat:@"%g", totalPrice];
 }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
       if ([segue.identifier isEqualToString:  @"to_manager"])
           {
             ManagerViewController * targetVC = (ManagerViewController *)segue.destinationViewController;
             targetVC.purchases = self.purchaseArray;
       }
 }
@end
