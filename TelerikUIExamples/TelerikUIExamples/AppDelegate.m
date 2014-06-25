//
//  AppDelegate.m
//  TelerikUIExamples
//
//  Copyright (c) 2013 Telerik. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ExampleInfo.h"

#import "ColumnAndBarChart.h"
#import "LineAreaSpline.h"
#import "ScatterChart.h"
#import "PieDonut.h"
#import "StackedColumnChart.h"
#import "StackedAreaChart.h"
#import "FinancialChart.h"
#import "NumericAxis.h"
#import "CategoricalAxis.h"
#import "DateTimeAxis.h"
#import "MultipleAxes.h"
#import "NegativeValues.h"
#import "PanZoom.h"
#import "DefaultAnimation.h"
#import "CustomAnimationAreaChart.h"
#import "CustomAnimationLineChart.h"
#import "CustomAnimationPieChart.h"
#import "UIKitDynamicsAnimation.h"
#import "BindWithDataPoint.h"
#import "BindWithCustomObject.h"
#import "BindWithDelegate.h"
#import "Customize.h"
#import "BandAndLineAnnotations.h"
#import "BalloonAnnotation.h"
#import "LayerAnnotation.h"
#import "ViewAnnotation.h"
#import "CrossLineAnnotation.h"
#import "CustomAnnotation.h"
#import "Trackball.h"
#import "BubbleChart.h"

#import "IndicatorsViewController.h"

#import "CalendarWithEvents.h"
#import "CalendarViewModes.h"
#import "CalendarTransitionEffects.h"
#import "CalendarSelection.h"
#import "iOS7StyleCalendar.h"
#import "CalendarCustomization.h"
#import "CalendarEventKitDataBinding.h"
#import "LocalizedCalendar.h"
#import "FeedbackExampleController.h"

#import "DataPersistence.h"
#import "DataSynchronization.h"

#import "DataPersistence.h"
#import "DataSynchronization.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ViewController *mainViewController = [[ViewController alloc] initWithExample:[self createExamples]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navigationController.navigationBar.translucent = NO;
    
    TKFeedbackController *feedbackController = [[TKFeedbackController alloc] init];
    feedbackController.dataSource = [[TKPlatformFeedbackSource alloc] initWithKey:@"58cb0070-f612-11e3-b9fc-55b0b983d3be" uid:@"iosteam@telerik.com"];
    feedbackController.contentController = navigationController;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = feedbackController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (ExampleInfo*)createExamples
{
    NSDictionary *examples = @{
                               
        @"1.Chart": @{
               @"1.Chart Types": @{
                       @"1.Column / Bar chart": [ColumnAndBarChart class],
                       @"2.Line / Area / Spline chart": [LineAreaSpline class],
                       @"3.Scatter chart": [ScatterChart class],
                       @"4.Bubble chart": [BubbleChart class],
                       @"5.Pie chart": [PieDonut class],
                       @"6.Stacked Column chart": [StackedColumnChart class],
                       @"7.Stacked Area chart": [StackedAreaChart class],
                       @"8.Financial chart": [FinancialChart class],
                       @"9.Indicators": [IndicatorsViewController class]
                       },
               
               @"2.Axis Types": @{
                       @"1.Numeric axis": [NumericAxis class],
                       @"2.Categorical axis": [CategoricalAxis class],
                       @"3.Date/Time axis": [DateTimeAxis class],
                       @"4.Multiple axes": [MultipleAxes class],
                       @"5.Negative values": [NegativeValues class]
                       },
               
               @"3.Animations": @{
                       @"1.Default animations": [DefaultAnimation class],
                       @"2.Custom animation - line chart": [CustomAnimationLineChart class],
                       @"3.Custom animation - area chart": [CustomAnimationAreaChart class],
                       @"4.Custom animation - pie chart": [CustomAnimationPieChart class],
                       @"5.UIKit dynamics animation": [UIKitDynamicsAnimation class]
                       },
               
               @"4.Binding": @{
                       @"1.Bind with data point": [BindWithDataPoint class],
                       @"2.Bind with custom object": [BindWithCustomObject class],
                       @"3.Bind with delegate": [BindWithDelegate class]
                       },
               
               @"5.Pan/Zoom": [PanZoom class],
               @"6.Customize": [Customize class],
               @"7.Annotations": @{
                       @"1.Band and line annotations": [BandAndLineAnnotations class],
                       @"2.Balloon annotation": [BalloonAnnotation class],
                       @"3.Layer annotation": [LayerAnnotation class],
                       @"4.View annotation": [ViewAnnotation class],
                       @"5.Cross line annotation": [CrossLineAnnotation class],
                       @"6.Custom annotation": [CustomAnnotation class],
                       @"7.Trackball": [Trackball class]
                       },
        },
                                  
        @"2.Calendar": @{
                  @"1. Calendar with events": [CalendarWithEvents class],
                  @"2. View modes": [CalendarViewModes class],
                  @"3. Transition effects": [CalendarTransitionEffects class],
                  @"4. Selection": [CalendarSelection class],
                  @"5. iOS 7 style calendar": [iOS7StyleCalendar class],
                  @"6. Customization": [CalendarCustomization class],
                  @"7. EventKit data binding": [CalendarEventKitDataBinding class],
                  @"8. Localized calendar": [LocalizedCalendar class]
          },
        @"3.Feedback": [FeedbackExampleController class],
        @"4.DataSync": @{
                @"1. Data Persistence": [DataPersistence class],
                @"2. Synchronize Data": [DataSynchronization class]
                }
        };
    
    NSArray *examplesArray = [self createExamplesRecursively:examples];
    return [[ExampleInfo alloc] initWithExamples:examplesArray withTitle:@"Examples"];
}

- (NSArray*)createExamplesRecursively:(NSDictionary*)examplesDict
{
    NSArray *orderedKeys = [[examplesDict allKeys] sortedArrayUsingSelector:@selector(localizedStandardCompare:)];
    
    NSMutableArray *examplesArray = [[NSMutableArray alloc] init];
    for (NSString *exampleKey in orderedKeys) {
        id example = [examplesDict valueForKey:exampleKey];
        NSRange firstDotIndex = [exampleKey rangeOfString:@"."];
        NSString *exampleName = [exampleKey substringFromIndex:firstDotIndex.location+firstDotIndex.length];
        if ([example isKindOfClass:[NSDictionary class]]) {
            NSArray *array = [self createExamplesRecursively:(NSDictionary*)example];
            [examplesArray addObject:[[ExampleInfo alloc] initWithExamples:array withTitle:exampleName]];
        }
        else {
            [examplesArray addObject:[[ExampleInfo alloc] initWithClass:(Class)example withTitle:exampleName]];
        }
    }
    
    return examplesArray;
}

@end