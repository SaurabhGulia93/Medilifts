//
//  MLServicesViewController.m
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MLServicesViewController.h"
#import "MLHeaderView.h"
#import "MAUtility.h"

@interface MLServicesViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MLHeaderView *headerView;

@end

@implementation MLServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Services";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    
    NSAttributedString *attrStr1 = [self getTitleAttrText:@"WELCOME TO MEDILIFTS" str2:@"Medi Lift Medi-cal Transportation, provides non-emergency transportation to the elderly and the disabled. We are a service-oriented company which caters to people in need of reliable transportation services"];
    
    NSAttributedString *attrStr2 = [self getTitleAttrText:@"We service" str2:@"All attorney visits, Medi-Cal appointments, Doctor's Appointments, Non-Emergency Hospital Visits, Hospital Discharge, Dialysis, Radiation, Pulmonary and Cardiac Rehabilitation.We provide Medi-Cal transportation services for Approved Workman's Comp and Personal Injury patients.Inquire about our transportation \"on lien\" program."];
                                    
                                    
    
    self.headerView = [[MLHeaderView alloc] initWithFrame:CGRectZero imageName1:@"ser1" imageName12:@"ser2" attributedString1:attrStr1 attributedString2:attrStr2];
    
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, [self.headerView requireHeightForWidht:self.view.frame.size.width attributedString1:attrStr1 attributedString2:attrStr2]);
    self.tableView.tableHeaderView = self.headerView;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    CGRect frame = self.view.bounds;
    self.tableView.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSAttributedString *)getTitleAttrText:(NSString *)str1 str2:(NSString *)str2{
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
    
    if(str1){
        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment                = NSTextAlignmentCenter;
        paragraphStyle.paragraphSpacing = 3;
        
        NSDictionary *headerTitleDict1 = @{NSFontAttributeName : MEDIUM(18),
                                           NSForegroundColorAttributeName : kBlackFontColor,
                                           NSParagraphStyleAttributeName:paragraphStyle,
                                           NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                           };
        
        NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n\n",str1] attributes:headerTitleDict1];
        [attStr appendAttributedString:headerAttr1];
    }
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment                = NSTextAlignmentLeft;
    
    NSDictionary *headerTitleDict2 = @{NSFontAttributeName : REGULAR(14),
                                       NSForegroundColorAttributeName : kDarkerGrayFontColor,
                                       NSParagraphStyleAttributeName:paragraphStyle
                                       };
    
    NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:str2 attributes:headerTitleDict2];
    [attStr appendAttributedString:headerAttr1];
    return [[NSAttributedString alloc] initWithAttributedString:attStr];
}


#pragma mark - TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

@end
