//
//  NewRecipeViewController.m
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#define kTextViewMarginTop 138
#define kTextViewMarginBottom 27



#import "NewRecipeViewController.h"

@interface NewRecipeViewController ()

@end

@implementation NewRecipeViewController




#pragma mark -
#pragma mark Object Life Cycle Methods



- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self addNotificationsObservers];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self addNotificationsObservers];
    }
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self addNotificationsObservers];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark -
#pragma mark Data Management Methods



- (void)addNotificationsObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}


- (void)keyboardWillShow:(NSNotification*)notification
{
    CGRect keyboardBounds = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
        
    [self updateTableViewFrameWithAnimationDuration:duration
                                     animationCurve:curve
                                     keyboardHeight:keyboardBounds.size.height];
}


- (void)keyboardWillHide:(NSNotification*)notification
{
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    [self updateTableViewFrameWithAnimationDuration:duration
                                     animationCurve:curve
                                     keyboardHeight:0];
}



#pragma mark -
#pragma mark View Update Methods



- (void)setupView
{
    UIView* lEmptyFooter = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.tableFooterView = lEmptyFooter;
    
    
    [self updateTableHeaderViewFrame];
}


- (void)updateTableHeaderViewFrame
{
    CGSize sizeThatFitsTextView = [_recipeDescriptiontextView sizeThatFits:CGSizeMake(_recipeDescriptiontextView.frame.size.width, MAXFLOAT)];
    
    
    CGFloat lTextViewHeight = MAX(sizeThatFitsTextView.height, _tableView.frame.size.height - (kTextViewMarginTop + sizeThatFitsTextView.height + kTextViewMarginBottom));
    
    
    _recipeDescriptiontextView.frame = CGRectMake(_recipeDescriptiontextView.frame.origin.x,
                                                  _recipeDescriptiontextView.frame.origin.y,
                                                  _recipeDescriptiontextView.frame.size.width,
                                                  lTextViewHeight);
    
    _tableView.tableHeaderView.frame = CGRectMake(0,
                                                  0,
                                                  self.view.frame.size.width,
                                                  kTextViewMarginTop + lTextViewHeight + kTextViewMarginBottom);
    
    _tableView.tableHeaderView = _tableView.tableHeaderView;
    
}


- (void)updateTableViewFrameWitheyboardHeight:(float)keyboardHeight
{
    _tableView.frame = CGRectMake(_tableView.frame.origin.x,
                                  _tableView.frame.origin.y,
                                  _tableView.frame.size.width,
                                  self.view.frame.size.height - keyboardHeight);
}


- (void)updateTableViewFrameWithAnimationDuration:(NSNumber*)animationDuration
                                   animationCurve:(NSNumber*)animationCurve
                                    keyboardHeight:(float)keyboardHeight
{
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:[animationDuration doubleValue]];
        [UIView setAnimationCurve:[animationCurve intValue]];
        
        
        _tableView.frame = CGRectMake(_tableView.frame.origin.x,
                                      _tableView.frame.origin.y,
                                      _tableView.frame.size.width,
                                      self.view.frame.size.height - keyboardHeight);
        [UIView commitAnimations];
    
    
    NSLog(@"self frame %@", [NSValue valueWithCGRect:self.view.frame]);
    
    NSLog(@"next frame %@", [NSValue valueWithCGRect:CGRectMake(_tableView.frame.origin.x,
                                                               _tableView.frame.origin.y,
                                                               _tableView.frame.size.width,
                                                               self.view.frame.size.height - keyboardHeight)]);
}



#pragma mark -
#pragma mark Text Field Delegate Methods



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _firstResponderView = textField;
    
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (_firstResponderView == textField)
    {
        _firstResponderView = nil;
    }
    
    return YES;
}



#pragma mark -
#pragma mark Text View Delegate Methods



- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    _firstResponderView = textView;
    
    return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if (_firstResponderView == textView)
    {
        _firstResponderView = nil;
    }
    
    return YES;
}


- (void)textViewDidChange:(UITextView *)textView
{
    [self updateTableHeaderViewFrame];
}



@end
