//
//  RecipeCategoryesViewController.m
//  MyRecipesBook
//
//  Created by Raphaël Pinto on 07/08/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//

#import "RecipeCategoryesViewController.h"

@interface RecipeCategoryesViewController ()

@end

@implementation RecipeCategoryesViewController



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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil recipeCreatorInteractor:(RecipeCreatorInteractor*)recipeCreatorInteractor
{
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        _recipeCreatorInteractor = recipeCreatorInteractor;
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
    
    self.title = NSLocalizedString(@"NewRecipe2/5", @"");
}


- (void)viewDidLayoutSubviews
{
    if (!_isLoaded)
    {
        _isLoaded = YES;
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


- (void)keyboardWillShow:(NSNotification*)notification
{
    CGRect keyboardBounds = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    [self.view layoutIfNeeded];
    _tableViewBottomConstraint.constant = keyboardBounds.size.height;
    
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
    _tableViewBottomConstraint.constant = 0.0f;
    
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
    UIView* lEmptyFooter = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.tableFooterView = lEmptyFooter;
    
    
    _tableView.tableHeaderView.frame = CGRectMake(0,
                                                  0,
                                                  self.view.frame.size.width,
                                                  self.view.frame.size.height);
    _tableView.tableHeaderView = _tableView.tableHeaderView;
    
    
    
    _rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Next", @"")
                                                           style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(onNextButtonPressed:)];
    _rightBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = _rightBarButtonItem;
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
}



#pragma mark -
#pragma mark Text Field Delegate Methods



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString* lNewString = [textField.text stringByReplacingCharactersInRange:range withString:string];
   
    
    [self updateRightBarButtonItemForTitle:lNewString];
    
    return YES;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self updateRightBarButtonItemForTitle:nil];
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}



@end
