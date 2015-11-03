//
//  ViewController.m
//  DataBase
//
//  Created by Ketan Raval on 03/11/15.
//  Copyright © 2015 zetrixweb. All rights reserved.
//

#import "ViewController.h"
#import "Helper.h"
#import "Database.h"
#import "AllDataVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if TARGET_IPHONE_SIMULATOR
    // where are you?
    NSLog(@"Documents Directory: %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
#endif
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSaveCclicked:(id)sender {
    if([self validate]){
        
        NSString *insert=[NSString stringWithFormat:@"INSERT INTO emp (name,email,num,sal,pass) VALUES ('%@','%@','%@','%@','%@')",txtName.text,txtEmail.text,txtNum.text,txtSal.text,txtPass.text];
        
        [[Database shareDatabase] Insert:insert];
        
        txtPass.text = @"";
        txtSal.text = @"";
        txtNum.text = @"";
        txtName.text = @"";
        txtEmail.text = @"";
        
       
    }
}

- (IBAction)showAllDataClicked:(id)sender {
    AllDataVC *objAllData = [self.storyboard instantiateViewControllerWithIdentifier:@"AllDataVC"];
    [self.navigationController pushViewController:objAllData animated:YES];
}

-(BOOL)validate{
    if(txtName.text.length<1){
        [Helper globalAlert:@"Enter name"];
        return false;
    }else if(![Helper validateEmailWithString:txtEmail.text]){
        [Helper globalAlert:@"Enter valid email id"];
        return false;
    }else if(txtNum.text.length<10){
        [Helper globalAlert:@"Enter valid Number"];
        return false;
    }else if(txtSal.text.length<3){
        [Helper globalAlert:@"Enter valid salary"];
        return false;
    }else if(txtPass.text.length<5){
        [Helper globalAlert:@"Min. Pass Lenght is 5"];
        return false;
    }else{
        return true;
    }
}
@end
