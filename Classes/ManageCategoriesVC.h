//
//  ManageCategoriesVC.h
//  Catalog
//
//  Created by Phuwanart Larpmark on 5/9/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ManageCategoriesVC : UIViewController <UITextFieldDelegate> {
	NSManagedObjectContext *_context;
	NSEntityDescription *_entity;
	
	IBOutlet UITextField *nameTextfield;
}

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) NSEntityDescription *entity;

- (IBAction)save:(id)sender;

@end
