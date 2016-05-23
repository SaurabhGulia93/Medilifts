//
//  ViewController.m
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MLContactUSViewController.h"
#import "MLHeaderView.h"
#import "MAUtility.h"
#import "MATextView.h"
#import "MATextFieldTitleCell.h"
#import "MATextViewCell.h"
#import "MANewServiceRequest.h"
#import "MLStyle.h"
#import "MLContactUsDataObject.h"
#import "MAKeyboardAccessoryView.h"
#import "MAMyPlanConfirmationFooterView.h"
#import "MAReferFriendFooterView.h"


@interface MLContactUSViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, MAKeyboardAccessoryViewDelegate, UITextViewDelegate, MAReferFriendShareDelegate>
{
    CGFloat _keyH;
    NSIndexPath *indexPathToMakeFirstResponder;
}
@property (nonatomic, strong) MATextField *editingField;
@property (nonatomic, strong) MATextField *currentlyEditingTF;
@property (nonatomic, strong) MAKeyboardAccessoryView *keyboardAccessoryView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) MLHeaderView *headerView;
@property (nonatomic, strong) MAReferFriendFooterView *headerView;
@property (nonatomic, strong) MAMyPlanConfirmationFooterView *footerView;

@end

@implementation MLContactUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Contact Us";
    self.view.backgroundColor = [UIColor whiteColor];
    
    MAAccessoryViewMode mode = MAAllButtons;
    _keyboardAccessoryView = [[MAKeyboardAccessoryView alloc] initWithFrame:CGRectZero andMode:mode];
    _keyboardAccessoryView.delegate = self;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    
    NSAttributedString *attrStr1 = [self getTitleAttrText:@"CONTACT US"];
    
    self.headerView = [[MAReferFriendFooterView alloc] initWithFrame:CGRectZero withOptions:nil];
    self.headerView.delegate = self;

    
//    self.headerView = [[MLHeaderView alloc] initWithFrame:CGRectZero imageName1:@"contactUsBanner" imageName12:nil attributedString1:attrStr1 attributedString2:nil];
    
    self.footerView = [[MAMyPlanConfirmationFooterView alloc] initWithFrame:CGRectZero withButtonTitle:@"Submit"];
    [self.footerView.sendButton addTarget:self action:@selector(sendButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    
    self.dataArr = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<MLMessage + 1; i++){
        
        MLContactUsDataObject *data = [[MLContactUsDataObject alloc] init];
        data.value = @"";
        data.isInvalid = NO;
        
        switch (i) {
            case MLName:
                data.title = @"Name";
                data.placeHolderTitle = @"Enter Name";
                break;
                
            case MLEmail:
                data.title = @"Email";
                data.placeHolderTitle = @"Enter Email";
                break;
                
            case MLPhoneNumber:
                data.title = @"Phone Number";
                data.placeHolderTitle = @"Enter Phone Number";
                break;
                
            case MLMessage:
                data.title = @"Message";
                data.placeHolderTitle = @"Enter Message";
                break;
                
            default:
                break;
        }
        
        [self.dataArr addObject:data];
    }

    
    // Do any additional setup after loading the view.
}

-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    CGRect frame = self.view.bounds;
    _keyboardAccessoryView.frame = CGRectMake(0, 0, 0, kKeyboardAccessoryHeight);
    self.tableView.frame = frame;
    
    float footerH = [self.headerView requiredHeightForWidth:frame.size.width];
    self.headerView.frame = CGRectMake(0, 0, frame.size.width, footerH);
    self.tableView.tableHeaderView = self.headerView;

    
//    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, [self.headerView requireHeightForWidht:self.view.frame.size.width attributedString1:nil attributedString2:nil] - 20);
//    self.tableView.tableHeaderView = self.headerView;
    
    if(self.footerView){
        
        float footerH = [MAMyPlanConfirmationFooterView requiredHeightForWidth:0.0f];
        self.footerView.frame = CGRectMake(0, 0, frame.size.width, footerH);
        self.tableView.tableFooterView = self.footerView;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)updateInsets
{
    self.tableView.contentInset = (UIEdgeInsets) {0.0, 0.0, _keyH, 0.0};
    self.tableView.scrollIndicatorInsets =  (UIEdgeInsets) {0.0, 0.0, _keyH, 0.0};
}

#pragma mark - Keyboard Delegates

- (void)keyboardWillShow:(NSNotification*)notification
{
    NSDictionary *userInfo = [notification userInfo];
    double animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    _keyH = CGRectGetMaxY(self.view.bounds) - CGRectGetMinY(keyboardRect);
    
    [UIView animateWithDuration:animationDuration delay:0
                        options:(animationCurve << 16) | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self updateInsets];
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    double animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    _keyH = 0.0;
    
    [self.view setNeedsLayout];
    [UIView animateWithDuration:animationDuration delay:0
                        options:(animationCurve << 16) | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self updateInsets];
                     }
                     completion:^(BOOL finished) {
                     }];
}

#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLContactUsDataObject *data = [self.dataArr objectAtIndex:indexPath.row];
    return [MATextFieldTitleCell heightForWidth:kLOBBigContentWidth withTitleText:data.title];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"myPlanConfirmCell";
    
    MATextFieldTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MATextFieldTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    MLContactUsDataObject *data = [self.dataArr objectAtIndex:indexPath.row];
    cell.tf.tag = indexPath.row;
    cell.tf.inputAccessoryView = _keyboardAccessoryView;
    cell.tf.keyboardType = UIKeyboardTypeEmailAddress;
    cell.tf.delegate = self;
    [cell disableTf:NO];
    cell.tf.isInvalid = data.isInvalid;
    [cell.rightView setHidden:YES];
    cell.tf.placeholder = data.placeHolderTitle;
    cell.tf.text = @"";
    
    [cell updateTitleWithText:data.title forWidth:kLOBBigContentWidth];
    
    
    if(indexPath.row == MLPhoneNumber){
        cell.tf.keyboardType = UIKeyboardTypeNumberPad;
    }
    else if(indexPath.row == MLEmail){
        cell.tf.keyboardType = UIKeyboardTypeEmailAddress;
    }
    
    return cell;
}

#pragma mark - UITextFieldDelegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _currentlyEditingTF = (MATextField *)textField;
    _currentlyEditingTF.isInvalid = NO;
    MLContactUsDataObject *data = [self.dataArr objectAtIndex:_currentlyEditingTF.tag];
    data.isInvalid = NO;
    [self.keyboardAccessoryView enableAll];
    
    switch (_currentlyEditingTF.tag) {
            
        case MLName:
            [self.keyboardAccessoryView disablePrevious];
            break;
        
        case MLMessage:
            [self.keyboardAccessoryView disableNext];
            break;
        
        default:
            [self.keyboardAccessoryView enableAll];
            break;
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *text = nil;
    MATextField *tf = (MATextField *)textField;
    text = [tf.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self updateDataUsageForRow:tf.tag andText:(text.length > 0) ? text : @""];
}

-(void)updateDataUsageForRow:(NSInteger)rowVal andText:(NSString *)text
{
    MLContactUsDataObject *data = [self.dataArr objectAtIndex:rowVal];
    data.value = text;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

#pragma mark - KeyboardAccessoryDelegate

- (void)didTapDoneButton
{
    [self.view endEditing:YES];
}

-(void)didTapNextButton
{
    indexPathToMakeFirstResponder = [NSIndexPath indexPathForRow:_currentlyEditingTF.tag + 1 inSection:0];
    
    MATextFieldTitleCell *nextCell = (MATextFieldTitleCell *)[self.tableView cellForRowAtIndexPath:indexPathToMakeFirstResponder];
    
    if (nextCell) {
        [nextCell.tf becomeFirstResponder];
        indexPathToMakeFirstResponder = nil;
    }
    
}

-(void)didTapPreviousButton{
    
    if (_currentlyEditingTF.tag)
    {
        indexPathToMakeFirstResponder = [NSIndexPath indexPathForRow:_currentlyEditingTF.tag - 1 inSection:0];
        
        MATextFieldTitleCell *nextCell = (MATextFieldTitleCell *)[self.tableView cellForRowAtIndexPath:indexPathToMakeFirstResponder];
        
        if (nextCell) {
            [nextCell.tf becomeFirstResponder];
            indexPathToMakeFirstResponder = nil;
        }
        else
        {
            [self.tableView scrollToRowAtIndexPath:indexPathToMakeFirstResponder atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    }
    
}

-(void)sendButtonTapped:(UIButton *)sender{
    
//    BOOL isValid = [self validateInputData];
//    if(isValid)
//    {
//        NSUInteger i;
//        
//        //These below key values are entered by user
//        
//        i = MLName;
//        NSString *firstName = (i < self.dataArr.count && [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value]) ? [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value] : @"";
//        
//        i = MLPhoneNumber;
//        NSString *mobile = (i < self.dataArr.count && [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value]) ? [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value] : @"";
//        
//        i = MLEmail;
//        NSString *emailId = (i < self.dataArr.count && [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value]) ? [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value] : @"";
//        
//        i = MLMessage;
//        NSString *city = (i < self.dataArr.count && [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value]) ? [(MLContactUsDataObject *)[self.dataArr objectAtIndex:i] value] : @"";
    
//        NSDictionary *payload = nil;
//        
//        payload = @{@"firstName" : firstName ? firstName : @"",
//                    @"mobile" : mobile ? mobile : @"",
//                    @"emailId" : emailId ? emailId : @"",
//                    @"city" : city ? city : @"",
//                    @"address" : address ? address : @"",
//                    @"zipCode" : zipCode ? zipCode : @"",
//                    };
//        
//        
//        //        __weak __typeof(self) weakself = self;
//        
//        [MAUtility showHUDWithTitle:@" Processing ..."];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://medilifts.org/sendQuery.php"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSDictionary *dictionary = @{@"Name": @"Saurabh",
                                 @"Email" : @"saurabhgulia93@gmail.com",
                                 @"Phone" : @"8130460561",
                                 @"Message" : @"You are awesome!"
                                 };
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:data];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ %@\n", response, error);
                                                           if(error == nil)
                                                           {
                                                               
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
    
        
        
//   }
}

-(BOOL)validateInputData{
    
    BOOL isValid = YES;
    
    for(NSUInteger i = 0; i<self.dataArr.count; i++){
        
        MLContactUsDataObject *data = [self.dataArr objectAtIndex:i];
        switch (i) {
            case MLName:
                isValid = [self validateFirstLastName:data.value];
                if(!isValid){
                    [MAUtility showToast:@"Please enter a valid name."];
                }
                break;
                
            case MLPhoneNumber:
                isValid = [MAUtility validatePhoneNumberString:data.value];
                if(!isValid){
                    [MAUtility showToast:@"Please enter a valid phone number."];
                }
                break;
                
            case MLEmail:
                isValid = [MAUtility stringIsValidEmail:data.value];
                if(!isValid){
                    [MAUtility showToast:@"Please enter a valid email."];
                }
                break;
                
            case MLMessage:
                isValid = [self validateFirstLastName:data.value];
                if(!isValid){
                    [MAUtility showToast:@"Please enter a valid message."];
                }
                break;
                
            default:
                break;
        }
        
        if(!isValid){
            
            data.isInvalid = YES;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView reloadData];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            break;
        }
    }
    
    return isValid;
}


- (BOOL)validateFirstLastName:(NSString *)text{
    
    if (!(text.length >= 1 && text.length <= 100)) {
        return NO;
    }
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:kMALoginNameAcceptableChars] invertedSet];
    NSString *filtered = [[text componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [text isEqualToString:filtered];
}


-(NSAttributedString *)getTitleAttrText:(NSString *)str{
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment                = NSTextAlignmentCenter;
    
    NSDictionary *headerTitleDict1 = @{NSFontAttributeName : MEDIUM(18),
                                       NSForegroundColorAttributeName : kBlackFontColor,
                                       NSParagraphStyleAttributeName:paragraphStyle,
                                       NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                       };
    
    NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:str attributes:headerTitleDict1];
    [attStr appendAttributedString:headerAttr1];
    return [[NSAttributedString alloc] initWithAttributedString:attStr];
}

#pragma mark - MAReferFriendShareDelegate

-(void)didTapAtButtonToShare:(NSUInteger)tag{
    
    
    switch (tag) {
        case 1:
            break;
            
        case 2:
            break;
            
        case 3:
            break;
            
        case 4:
            break;
            
        default:
            break;
    }
}


@end
