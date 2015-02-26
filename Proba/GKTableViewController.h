//
//  GKTableViewController.h
//  Proba
//
//  Created by GK Work on 15.02.26..
//  Copyright (c) 2015. dms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *many;
@property (weak, nonatomic) IBOutlet UILabel *big;
@property (weak, nonatomic) IBOutlet UILabel *small;

@end


@interface GKTableViewController : UITableViewController

@end
