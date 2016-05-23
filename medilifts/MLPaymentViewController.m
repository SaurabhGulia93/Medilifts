//
//  MLPaymentViewController.m
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MLPaymentViewController.h"
#import "MLHeaderView.h"
#import "MAUtility.h"

@interface MLPaymentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) MLHeaderView *headerView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MLPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Payments";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    
    NSAttributedString *attrStr1 = [self getTitleAttrText:@"PAYMENT METHOD" str2:@"We except cash, worker comp, and personal injury accepted cases only.we will soon be accepting credit cards and medical. We Will be accepting Medi-Cal soon.We provide medi-cal transportation services for Approved Workman's Comp and Personal Injury patients."];
    
    NSAttributedString *attrStr2 = [self getTitleAttrText:nil str2:nil];
    
    self.headerView = [[MLHeaderView alloc] initWithFrame:CGRectZero imageName1:@"payment" imageName12:@"card" attributedString1:attrStr1 attributedString2:attrStr2];
    
    [self.headerView setChangeImageSize:YES];
    
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
    
    if(str2){
        
        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment                = NSTextAlignmentLeft;
        
        NSDictionary *headerTitleDict2 = @{NSFontAttributeName : REGULAR(14),
                                           NSForegroundColorAttributeName : kDarkerGrayFontColor,
                                           NSParagraphStyleAttributeName:paragraphStyle
                                           };
        
        NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:str2 attributes:headerTitleDict2];
        [attStr appendAttributedString:headerAttr1];
    }
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
