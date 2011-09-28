#import "FontListerViewController.h"

@implementation FontListerViewController

@synthesize fonts;

- (void)dealloc
{
    [fonts release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *mFonts = [[[NSMutableArray alloc] init] autorelease];
    
    NSArray *familyNames = [UIFont familyNames];
    NSArray *sortedFamilyNames = [familyNames sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for (NSString *family in sortedFamilyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:family];
        NSArray *sortedFontNames = [fontNames sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        for (NSString *font in sortedFontNames) {
            [mFonts addObject:font];
        }
    }
    
    NSLog(@"%@", mFonts);
    
    self.fonts = mFonts;
}

- (void)viewDidUnload
{
    self.fonts = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fonts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TVC"];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] init] autorelease];
        
        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(5, 5, cell.frame.size.width - 10, cell.frame.size.height - 10)] autorelease];
        
        [cell addSubview:label];
    }
    
    for (UIView *v in [cell subviews]) {
        if ([v isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)v;
            
            label.font = [UIFont fontWithName:[self.fonts objectAtIndex:indexPath.row] size:16.0];
            label.text = [self.fonts objectAtIndex:indexPath.row];
        }
    }
    
    return cell;
}
@end
