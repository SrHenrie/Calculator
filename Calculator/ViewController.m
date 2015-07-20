//
//  ViewController.m
//  Calculator
//
//  Created by TRM on 7/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *displayLabel;
@property (assign, nonatomic) BOOL isInTheMiddleOfTypingANumber;
@property (assign, nonatomic) double displayValue;
@property (strong, nonatomic) NSMutableArray *operandStack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.operandStack = [NSMutableArray new];
    
    self.displayLabel = [UILabel new];
    self.displayLabel.textAlignment = NSTextAlignmentRight;
    self.displayLabel.font = [UIFont systemFontOfSize:32.0];
    self.displayLabel.backgroundColor = [UIColor lightGrayColor];
    self.displayLabel.text = @"0";
    [self.displayLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.displayLabel];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.displayLabel
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:5.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.displayLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0
                                               constant:25.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.displayLabel
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1.0
                                               constant:-5.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.displayLabel
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:1.0
                                               constant:50];
    [self.view addConstraint:constraint];
    
    
    UIButton *button0 = [UIButton new];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
    [button0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button0 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button0 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    UIButton *button1 = [UIButton new];
    [button1 setTitle:@"1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button1 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton new];
    [button2 setTitle:@"2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button2 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton new];
    [button3 setTitle:@"3" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button3 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton new];
    [button4 setTitle:@"4" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button4 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton new];
    [button5 setTitle:@"5" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button5 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button5 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];

    UIButton *button6 = [UIButton new];
    [button6 setTitle:@"6" forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button6 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button6 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton *button7 = [UIButton new];
    [button7 setTitle:@"7" forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button7 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button7 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    
    UIButton *button8 = [UIButton new];
    [button8 setTitle:@"8" forState:UIControlStateNormal];
    [button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button8 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button8 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    
    UIButton *button9 = [UIButton new];
    [button9 setTitle:@"9" forState:UIControlStateNormal];
    [button9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button9 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button9 addTarget:self action:@selector(appendDigit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button9];
    
    UIButton *buttonEnter = [UIButton new];
    [buttonEnter setTitle:@"Enter" forState:UIControlStateNormal];
    [buttonEnter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonEnter setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonEnter addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonEnter];
    
    UIButton *buttonDivide = [UIButton new];
    [buttonDivide setTitle:@"/" forState:UIControlStateNormal];
    [buttonDivide setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonDivide setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonDivide addTarget:self action:@selector(operate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDivide];
    
    UIButton *buttonMultiply = [UIButton new];
    [buttonMultiply setTitle:@"*" forState:UIControlStateNormal];
    [buttonMultiply setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonMultiply setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonMultiply addTarget:self action:@selector(operate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonMultiply];
    
    UIButton *buttonSubtract = [UIButton new];
    [buttonSubtract setTitle:@"-" forState:UIControlStateNormal];
    [buttonSubtract setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonSubtract setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonSubtract addTarget:self action:@selector(operate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSubtract];
    
    UIButton *buttonAdd = [UIButton new];
    [buttonAdd setTitle:@"+" forState:UIControlStateNormal];
    [buttonAdd setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonAdd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonAdd addTarget:self action:@selector(operate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAdd];
    
    NSDictionary *buttonsDictionary = NSDictionaryOfVariableBindings(button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonAdd, buttonDivide, buttonMultiply, buttonSubtract, buttonEnter);
    
    NSArray *buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button7][button8][button9][buttonDivide]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:buttonsDictionary];
    [self.view addConstraints:buttonConstraints];
    
    buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button4][button5][button6][buttonMultiply]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:buttonsDictionary];
    [self.view addConstraints:buttonConstraints];
    
    buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button1][button2][button3][buttonSubtract]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:buttonsDictionary];
    [self.view addConstraints:buttonConstraints];
    
    buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button0][buttonEnter][buttonAdd]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:buttonsDictionary];
    [self.view addConstraints:buttonConstraints];
    
    buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button7][button4][button1][button0]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:buttonsDictionary];
    [self.view addConstraints:buttonConstraints];
    
    
    //I use button7 the top most, left most button to constrain everthing else to, the starting position of all the buttons - the others will follow this because of out constraints above, and the height and width of the other buttons are equally constrained to button7
    constraint = [NSLayoutConstraint constraintWithItem:button7
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.displayLabel
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:5.0];
    [self.view addConstraint:constraint];
    
    NSArray *buttonsHeightArray = @[button0, button1, button2, button3, button4, button5, button6, button8, button9, buttonAdd, buttonSubtract, buttonMultiply, buttonDivide, buttonEnter];
    
    for (int i = 0; i < buttonsHeightArray.count; i++) {
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:buttonsHeightArray[i]
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:button7
                                                                            attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0
                                                                             constant:0.0];
        [self.view addConstraint:heightConstraint];
    }
    
    NSArray *buttonsWidthArray = @[button0, button1, button2, button3, button4, button5, button6, button8, button9, buttonAdd, buttonSubtract, buttonMultiply, buttonDivide];
    
    for (int i = 0; i < buttonsWidthArray.count; i++) {
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:buttonsWidthArray[i]
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:button7
                                                                           attribute:NSLayoutAttributeWidth
                                                                          multiplier:1.0
                                                                            constant:0.0];
        [self.view addConstraint:widthConstraint];
    }
    
    NSLayoutConstraint *enterWidthConstraint = [NSLayoutConstraint constraintWithItem:buttonEnter
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:button7
                                                                            attribute:NSLayoutAttributeWidth
                                                                           multiplier:2.0
                                                                             constant:0.0];
    [self.view addConstraint:enterWidthConstraint];
}

- (void)appendDigit:(UIButton *)button {
    NSString *digit = button.titleLabel.text;
    
    if (self.isInTheMiddleOfTypingANumber) {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:digit];
    }
    else {
        self.displayLabel.text = digit;
        self.isInTheMiddleOfTypingANumber = YES;
    }
    
}

- (double)displayValue {
    return self.displayLabel.text.doubleValue;
}

- (void)setDisplayValue:(double)displayValue {
    self.displayLabel.text = [NSString stringWithFormat:@"%f", displayValue];
    self.isInTheMiddleOfTypingANumber = NO;
}

- (void)enter {
    self.isInTheMiddleOfTypingANumber = NO;
    NSNumber *number = [NSNumber numberWithDouble:self.displayValue];
    [self.operandStack addObject:number];
    NSLog(@"%@", self.operandStack);
}

- (NSNumber *)popOperandStack {
    NSNumber *lastNumber = [self.operandStack lastObject];
    [self.operandStack removeLastObject];
    return lastNumber;
}

- (void)operate:(UIButton *)button {
    
    if (self.isInTheMiddleOfTypingANumber) {
        [self enter];
    }
    
    if (self.operandStack.count >= 2) {
        NSNumber *number1 = [self popOperandStack];
        NSNumber *number2 = [self popOperandStack];
        
        NSString *operation = button.titleLabel.text;
        
        if ([operation isEqualToString:@"/"]) {
            self.displayValue = [number2 doubleValue] / [number1 doubleValue];
        } else if ([operation isEqualToString:@"*"]) {
            self.displayValue = [number2 doubleValue] * [number1 doubleValue];
        } else if ([operation isEqualToString:@"-"]) {
            self.displayValue = [number2 doubleValue] - [number1 doubleValue];
        } else if ([operation isEqualToString:@"+"]) {
            self.displayValue = [number2 doubleValue] + [number1 doubleValue];
        }
        
        [self enter];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
