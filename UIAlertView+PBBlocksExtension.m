/**
 * @note NON-ARC
 */
#import "UIAlertView+PBBlocksExtension.h"

//
@implementation UIAlertView (PBBlocksExtension)
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
            handler:(PBBlocksAlertViewHandler)handler
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [self initWithTitle:title
                       message:message
                      delegate:nil
             cancelButtonTitle:cancelButtonTitle
             otherButtonTitles:nil];
    if( self ){
        va_list args;
        va_start(args, otherButtonTitles);
        for( NSString* arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*) ){
            [self addButtonWithTitle:arg];
        }
        va_end(args);
        self.delegate = [[[PBBlocksAlertViewHolder alloc] initWithHandler:handler] autorelease];
    }
    return self;
}

@end

//
@implementation PBBlocksAlertViewHolder
@synthesize handler = _handler;

- (id)initWithHandler:(PBBlocksAlertViewHandler)aHandler
{
    self = [super init];
    if( self ){
        self.handler = aHandler;
        [self retain];
    }
    return self;
}

- (void)dealloc
{
    self.handler = nil;
    [super dealloc];
}

#pragma mark - UIAlerViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if( self.handler ){
         self.handler( alertView, buttonIndex );
    }
    [self release];
}

@end
