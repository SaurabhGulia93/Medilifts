//
//  MLHomeViewController.m
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MLHomeViewController.h"
#import "MLHeaderView.h"
#import "MAUtility.h"

@interface MLHomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MLHeaderView *headerView;

@end

@implementation MLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    
    NSAttributedString *attrStr1 = [self getTitleAttrText:@"WELCOME TO MEDILIFTS" str2:@"Medi Lift Medi-cal Transportation is a non-emergency Medi-Cal transportation provider. We serve many regions of Los Angeles County: Northridge, North Hollywood (N. Hollywood), San Fernando Valley, Encino, Topanga, Agoura Hills, Granada Hills, Reseda, Topanga Park, Valley Glen, Burbank, Lake Balboa, Sherman Oaks, Valley Village, Calabasas, Studio City, Van Nuys East, Calabasas, San Fernando, Sun Valley, Van Nuys West, North Hills, Canoga Park, North Hollywood, Sylmar, Winnetka, Chatsworth, Northridge, Tarzana, Woodland Hills, Orange County, Riverside County and San Bernardino County. (Coming soon to Nevada)"];
    
    NSAttributedString *attrStr2 = [self getTitleAttrText:nil str2:@"We provide professional, door-to-door transportation to the elderly and the disabled. Medi Lift provides transportation to dialysis, radiation and chemo therapy, nursing homes, rehabs, rehabilitation centers, convalescent facilities, long term care facilities, assisted living centers. We assist clients from time of pick-up to drop-off to make sure that they get there safely and in plenty of time. Each driver has a clean record and has completed Standard CPR and First Aid Training."];
    
    self.headerView = [[MLHeaderView alloc] initWithFrame:CGRectZero imageName1:@"car" imageName12:@"van1" attributedString1:attrStr1 attributedString2:attrStr2];
    
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, [self.headerView requireHeightForWidht:self.view.frame.size.width attributedString1:attrStr1 attributedString2:attrStr2]);
    self.tableView.tableHeaderView = self.headerView;
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
        paragraphStyle.paragraphSpacing = 2;
        
        NSDictionary *headerTitleDict1 = @{NSFontAttributeName : MEDIUM(20),
                                           NSForegroundColorAttributeName : kBlackFontColor,
                                           NSParagraphStyleAttributeName:paragraphStyle,
                                           NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                           };
        
        NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n\n",str1] attributes:headerTitleDict1];
        [attStr appendAttributedString:headerAttr1];
    }
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment                = NSTextAlignmentLeft;
    paragraphStyle.paragraphSpacing = 2;

    NSDictionary *headerTitleDict2 = @{NSFontAttributeName : REGULAR(15),
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
