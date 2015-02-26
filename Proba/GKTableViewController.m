//
//  GKTableViewController.m
//  Proba
//
//  Created by GK Work on 15.02.26..
//  Copyright (c) 2015. dms. All rights reserved.
//

#import "GKTableViewController.h"

#define NUM_OF_CELLS 50

#define BIG_FIX_LENGTH 10
#define BIG_VARIABLE_LENGTH 10
#define MANY_FIX_LENGTH 10
#define MANY_VARIABLE_LENGTH 500
#define SMALL_FIX_LENGTH 20
#define SMALL_VARIABLE_LENGTH 10

@implementation GKCell

@end


@interface GKTableViewController ()

@property (nonatomic, strong) NSMutableArray *content;

@end


@implementation GKTableViewController

@synthesize content = _content;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.content = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<NUM_OF_CELLS; i++) {
        NSUInteger bigLength = arc4random_uniform(BIG_VARIABLE_LENGTH) + BIG_FIX_LENGTH;
        NSUInteger manyLength = arc4random_uniform(MANY_VARIABLE_LENGTH) + MANY_FIX_LENGTH;
        NSUInteger smallLength = arc4random_uniform(SMALL_VARIABLE_LENGTH) + SMALL_FIX_LENGTH;
        
        NSString *big = [self randomStringInLength:bigLength];
        NSString *many = [self randomStringInLength:manyLength];
        NSString *small = [self randomStringInLength:smallLength];
        
        [self.content addObject:@{@"big": big,
                                  @"small": small,
                                  @"many": many}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return NUM_OF_CELLS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dict = [self.content objectAtIndex:indexPath.row];
    
    cell.big.text = dict[@"big"];
    cell.small.text = dict[@"small"];
    cell.many.text = dict[@"many"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - Helper

- (NSString *)randomStringInLength:(NSUInteger)length
{
    NSString *letters = @"asdf ghjkl ";
    
    NSMutableString *string = [[NSMutableString alloc] init];
    
    NSString *prevLetter = @"";
    for (NSUInteger i=0; i<length; i++) {
        NSUInteger rnd = arc4random_uniform((int)[letters length]);
        NSString *rndLetter = [letters substringWithRange:NSMakeRange(rnd, 1)];
        
        if (![rndLetter isEqualToString:prevLetter]) {
            [string appendString:rndLetter];
            prevLetter = rndLetter;
        }
    }
    
    return string;
}

@end
