//
//  CalendarTransitionEffects.m
//  TelerikUIExamples
//
//  Copyright (c) 2014 Telerik. All rights reserved.
//

#import "CalendarTransitionEffects.h"
#import <TelerikUI/TelerikUI.h>

@interface CalendarTransitionEffects () <TKCalendarPresenterDelegate>

@property (nonatomic, strong) TKCalendar *calendarView;
@property (nonatomic, strong) UIButton *buttonPrev;
@property (nonatomic, strong) UIButton *buttonNext;

@end

@implementation CalendarTransitionEffects
{
    NSInteger _colorIndex;
    NSInteger _oldColorIndex;
    NSArray *_colors;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _colorIndex = 0;
        _colors = @[ [UIColor colorWithRed:0. green:1. blue:0. alpha:0.3],
                     [UIColor colorWithRed:1. green:0. blue:0. alpha:0.3],
                     [UIColor colorWithRed:0. green:0. blue:1. alpha:0.3],
                     [UIColor colorWithRed:1. green:1. blue:0. alpha:0.3],
                     [UIColor colorWithRed:0. green:1. blue:1. alpha:0.3],
                     [UIColor colorWithRed:1. green:0. blue:1. alpha:0.3]
                   ];
        
        [self addOption:@"Flip effect" selector:@selector(selectFlipEffect)];
        [self addOption:@"Float effect" selector:@selector(selectFloatEffect)];
        [self addOption:@"Fold effect" selector:@selector(selectFoldEffect)];
        [self addOption:@"Rotate effect" selector:@selector(selectRotateEffect)];
        [self addOption:@"Card effect" selector:@selector(selectCardEffect)];
        [self addOption:@"Scroll effect" selector:@selector(selectScrollEffect)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.bounds.size.width, 44)];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:toolbar];
    
    UIBarButtonItem *buttonPrev = [[UIBarButtonItem alloc] initWithTitle:@"Prev month" style:UIBarButtonItemStylePlain target:self action:@selector(prevTouched:)];
    UIBarButtonItem *buttonNext = [[UIBarButtonItem alloc] initWithTitle:@"Next month" style:UIBarButtonItemStylePlain target:self action:@selector(nextTouched:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    toolbar.items = @[buttonPrev, space, buttonNext];
    
    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - toolbar.frame.size.height);
    self.calendarView = [[TKCalendar alloc] initWithFrame:CGRectInset(rect, 0, 0)];
    self.calendarView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.calendarView];
    
    TKCalendarMonthPresenter *presenter = (TKCalendarMonthPresenter*)self.calendarView.presenter;
    presenter.transitionMode = TKCalendarTransitionModeFlip;
    presenter.delegate = self;
    presenter.headerIsSticky = YES;
    presenter.contentView.backgroundColor = _colors[_colorIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prevTouched:(id)sender
{
    [_calendarView navigateBack:YES];
}

- (void)nextTouched:(id)sender
{
    [_calendarView navigateForward:YES];
}

- (void)selectFlipEffect
{
    [self setTransition:TKCalendarTransitionModeFlip isVertical:NO];
}

- (void)selectFloatEffect
{
    [self setTransition:TKCalendarTransitionModeFloat isVertical:NO];
}

- (void)selectFoldEffect
{
    [self setTransition:TKCalendarTransitionModeFold isVertical:NO];
}

- (void)selectRotateEffect
{
    [self setTransition:TKCalendarTransitionModeRotate isVertical:NO];
}

- (void)selectCardEffect
{
    [self setTransition:TKCalendarTransitionModeCard isVertical:YES];
}

- (void)selectScrollEffect
{
    [self setTransition:TKCalendarTransitionModeScroll isVertical:YES];
}

- (void)setTransition:(TKCalendarTransitionMode)transitionMode isVertical:(BOOL)isVertical
{
    TKCalendarMonthPresenter *presenter = (TKCalendarMonthPresenter*)_calendarView.presenter;
    presenter.delegate = self;
    presenter.headerIsSticky = YES;
    presenter.transitionIsVertical = isVertical;
    presenter.transitionMode = transitionMode;
}

#pragma mark TKCalendarPresenterDelegate

- (void)presenter:(id<TKCalendarPresenter>)presenter beginTransition:(TKViewTransition *)transition
{
    _oldColorIndex = _colorIndex;
    _colorIndex = (_colorIndex + 1) % _colors.count;
    TKCalendarMonthPresenter *monthPresenter = (TKCalendarMonthPresenter*)presenter;
    monthPresenter.contentView.backgroundColor = _colors[_colorIndex];
}

- (void)presenter:(id<TKCalendarPresenter>)presenter finishTransition:(BOOL)canceled
{
    if (canceled) {
        TKCalendarMonthPresenter *monthPresenter = (TKCalendarMonthPresenter*)presenter;
        monthPresenter.contentView.backgroundColor = _colors[_oldColorIndex];
        _colorIndex = _oldColorIndex;
    }
}

@end