//
//  DCAddDreamViewController.m
//  DreamCatcher
//
//  Created by Aneesh on 07/11/13.
//  Copyright (c) 2013 Ammini Inc. All rights reserved.
//

#import "DCAddDreamViewController.h"
#import "DCAddDreamWordsViewController.h"
#import "DCAddDreamVoiceViewController.h"
#import "DCAddDreamPicsViewController.h"


@interface DCAddDreamViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *sectionHeaders;
    NSMutableArray *dataArray;
}
@end

@implementation DCAddDreamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title=@"Add Dream";

    
    sectionHeaders=[[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    
    //Initialize the dataArray
    dataArray = [[NSMutableArray alloc] init];
    
    //First section data
    NSArray *firstItemsArray = [[NSArray alloc] initWithObjects:@"Type it in Words", nil];
    NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:firstItemsArray forKey:@"data"];
    [dataArray addObject:firstItemsArrayDict];
    
    //Second section data
    NSArray *secondItemsArray = [[NSArray alloc] initWithObjects:@"Say it in your Voice",nil];
    NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:secondItemsArray forKey:@"data"];
    [dataArray addObject:secondItemsArrayDict];
    
    NSArray *thirdItemsArray = [[NSArray alloc] initWithObjects:@"Show it in Pics", nil];
    NSDictionary *thirdItemsArrayDict = [NSDictionary dictionaryWithObject:thirdItemsArray forKey:@"data"];
    [dataArray addObject:thirdItemsArrayDict];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dismissVC:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma UITableViewDataSource 

#pragma UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sectionHeaders count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [dataArray objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"data"];
    return [array count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [sectionHeaders objectAtIndex:section];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    /*
    if(section == 1){
        return @"This is a footer";
    } else {
        return @"";
    }*/
    return @"";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the selected country
    
    NSString *selectedCell = nil;
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    NSLog(@"%@", selectedCell);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    switch (indexPath.section) {
        case 0:
        {
            [self performSegueWithIdentifier:@"1" sender:self];
            break;
        }
        case 1:
        {
            [self performSegueWithIdentifier:@"2" sender:self];
            break;
        }
        case 2:
        {
            [self performSegueWithIdentifier:@"3" sender:self];
            break;
        }
            
        default:
            break;
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"1"])
	{
		DCAddDreamWordsViewController *vc =[[DCAddDreamWordsViewController alloc]init];
       vc= segue.destinationViewController;
	}
    if ([segue.identifier isEqualToString:@"2"])
	{
		DCAddDreamVoiceViewController *vc =[[DCAddDreamVoiceViewController alloc]init];
        vc= segue.destinationViewController;
	}
    if ([segue.identifier isEqualToString:@"3"])
	{
		DCAddDreamPicsViewController *vc =[[DCAddDreamPicsViewController alloc]init];
        vc= segue.destinationViewController;
	}
    
}
@end
