//
//  ViewController.m
//  CalendarDemo
//
//  Created by Andy Wu on 6/26/17.
//  Copyright © 2017 Andy Wu. All rights reserved.
//

#import "ViewController.h"
#import "FSCalendar.h"
#import "CalenderColors.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController () <FSCalendarDataSource, FSCalendarDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) FSCalendar *calendar;

/// 使用手势切换scope
@property (strong, nonatomic) UIPanGestureRecognizer *scopeGesture;

/// 日期格式
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)loadView {
	[super loadView];
	[self.view addSubview:self.calendar];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.calendar addGestureRecognizer:self.scopeGesture];
}

#pragma mark - FSCalendarDelegate

- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated {
	calendar.frame = (CGRect){calendar.frame.origin, bounds.size};
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
	NSLog(@"didSelectDate() --- %@", [self.dateFormatter stringFromDate:date]);
}

# pragma mark - Accessories

- (FSCalendar *)calendar {
	if (_calendar == nil) {
		_calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 300)];
		_calendar.dataSource = self;
		_calendar.delegate = self;
		_calendar.scope = FSCalendarScopeMonth;
		_calendar.allowsMultipleSelection = false;
		_calendar.firstWeekday = 1;
//		_calendar.calendarHeaderView = nil;
		_calendar.appearance.weekdayTextColor = GRAY_COLOR;
		_calendar.appearance.selectionColor = GREEN_COLOR;
		_calendar.appearance.todaySelectionColor = GREEN_COLOR;
		_calendar.appearance.todayColor = GREEN_COLOR;
		_calendar.appearance.borderRadius = 0.3;
		_calendar.headerHeight = 0;
		_calendar.placeholderType = FSCalendarPlaceholderTypeNone;
	}
	return _calendar;
}

- (UIPanGestureRecognizer *)scopeGesture {
	if (_scopeGesture == nil) {
		_scopeGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.calendar action:@selector(handleScopeGesture:)];
		_scopeGesture.delegate = self;
		_scopeGesture.minimumNumberOfTouches = 1;
		_scopeGesture.maximumNumberOfTouches = 2;
	}
	return _scopeGesture;
}

- (NSDateFormatter *)dateFormatter {
	if (_dateFormatter == nil) {
		_dateFormatter = [[NSDateFormatter alloc] init];
		_dateFormatter.dateFormat = @"YYYY-MM-dd";
	}
	return _dateFormatter;
}

@end
