//
//  ManageCategoriesVC.m
//  Catalog
//
//  Created by Phuwanart Larpmark on 5/9/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ManageCategoriesVC.h"


@implementation ManageCategoriesVC

@synthesize context = _context; 
@synthesize entity = _entity;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[nameTextfield becomeFirstResponder];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark Action

- (IBAction)save:(id)sender
{
	NSLog(@"%@", nameTextfield.text);
	
	NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[self.entity name] inManagedObjectContext:self.context];
	
	// If appropriate, configure the new managed object.
	[newManagedObject setValue:nameTextfield.text forKey:@"name"];
	
	// Save the context.
	NSError *error = nil;
	if (![self.context save:&error]) {
	    /*
	     Replace this implementation with code to handle the error appropriately.
	     
	     abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
	     */
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	} else {
		[self.navigationController popViewControllerAnimated:YES];
	}	
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

@end
