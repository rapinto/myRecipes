//
//  NewRecipeViewController.m
//  MyRecipesBook
//
//  Created by Ades on 02/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#define kTextViewMarginTop 138
#define kTextViewMarginBottom 27



#import "RecipeCreatorTitleViewController.h"
#import "RecipeCreatorInteractor.h"



@interface RecipeCreatorTitleViewController ()

@end

@implementation RecipeCreatorTitleViewController




#pragma mark -
#pragma mark Object Life Cycle Methods



- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self addNotificationsObservers];
        [self initRecipeCreatorInteractor];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self addNotificationsObservers];
        [self initRecipeCreatorInteractor];
    }
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self addNotificationsObservers];
        [self initRecipeCreatorInteractor];
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
}


- (void)viewDidLayoutSubviews
{
    if (!_isLoaded)
    {
        [self setupView];
    }
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


- (void)initRecipeCreatorInteractor
{
    RecipeCreatorInteractor* lNewRecipeInteractor = [[RecipeCreatorInteractor alloc] init];
    _recipeCreatorInteractor = lNewRecipeInteractor;
}


- (void)keyboardWillShow:(NSNotification*)notification
{
    CGRect keyboardBounds = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    [self.view layoutIfNeeded];
    _tableViewBottomContraint.constant = keyboardBounds.size.height;
    
    [UIView animateWithDuration:[duration doubleValue]
                          delay:0
                        options:[curve integerValue]
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:NULL];
}


- (void)keyboardWillHide:(NSNotification*)notification
{
    CGRect keyboardBounds = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    
    [self.view layoutIfNeeded];
    _tableViewBottomContraint.constant = 0.0f;
    
    [UIView animateWithDuration:[duration doubleValue]
                          delay:0
                        options:[curve integerValue]
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:NULL];
}



#pragma mark -
#pragma mark View Update Methods



- (void)setupView
{
    UIColor *color = [UIColor lightGrayColor];
    _recipeTitleTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"EnterTitle", @"")
                                                                                  attributes:@{NSForegroundColorAttributeName: color}];
    
    
    UIView* lEmptyFooter = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.tableFooterView = lEmptyFooter;
    
    [self updateTableHeaderViewFrame];
    
    _rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Next", @"")
                                                           style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(onNextButtonPressed:)];
    _rightBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = _rightBarButtonItem;
}


- (void)updateTableHeaderViewFrame
{
    CGSize sizeThatFitsTextView = [_recipeDescriptiontextView sizeThatFits:CGSizeMake(_recipeDescriptiontextView.frame.size.width, MAXFLOAT)];
    
    CGFloat lTextViewHeight = ceil(MAX(sizeThatFitsTextView.height,
                                       _tableView.frame.size.height - (kTextViewMarginTop + kTextViewMarginBottom)));
    
    _tableView.tableHeaderView.frame = CGRectMake(0,
                                                  0,
                                                  self.view.frame.size.width,
                                                  kTextViewMarginTop + lTextViewHeight + kTextViewMarginBottom);
    
    _tableView.tableHeaderView = _tableView.tableHeaderView;
}


- (void)updateRightBarButtonItemForTitle:(NSString*)currentRecipeTitle
{
    if ([currentRecipeTitle length] > 0)
    {
        _rightBarButtonItem.enabled = YES;
    }
    else
    {
        _rightBarButtonItem.enabled = NO;
    }
}



#pragma mark -
#pragma mark User Interaction Methods



- (void)onNextButtonPressed:(id)sender
{
    _recipeCreatorInteractor.recipeTitle = _recipeTitleTextfield.text;
    _recipeCreatorInteractor.recipeDefinition = _recipeDescriptiontextView.text;
    
    [_recipeTitleTextfield resignFirstResponder];
    [_recipeDescriptiontextView resignFirstResponder];
}



#pragma mark -
#pragma mark Text Field Delegate Methods



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString* lNewString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    [self updateRightBarButtonItemForTitle:lNewString];
    
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.attributedPlaceholder = nil;
    
    _firstResponderView = textField;
    
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    UIColor *color = [UIColor lightGrayColor];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"EnterTitle", @"") attributes:@{NSForegroundColorAttributeName: color}];
    
    if (_firstResponderView == textField)
    {
        _firstResponderView = nil;
    }
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_recipeDescriptiontextView becomeFirstResponder];
    
    _recipeCreatorInteractor.recipeTitle = textField.text;
    
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
    
    
    _recipeCreatorInteractor.recipeDefinition = textView.text;
    
    
    return YES;
}


- (void)textViewDidChange:(UITextView *)textView
{
    [self updateTableHeaderViewFrame];
}



@end
