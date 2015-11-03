//
//  ViewController.h
//  DataBase
//
//  Created by Ketan Raval on 03/11/15.
//  Copyright © 2015 zetrixweb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    IBOutlet UITextField *txtPass;
    IBOutlet UITextField *txtSal;
    IBOutlet UITextField *txtNum;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtName;
}
- (IBAction)btnSaveCclicked:(id)sender;
- (IBAction)showAllDataClicked:(id)sender;

@end

