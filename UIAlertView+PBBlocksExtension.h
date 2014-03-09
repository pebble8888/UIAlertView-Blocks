/**
 * @note NON-ARC
 */
#import <UIKit/UIKit.h>

//
@interface UIAlertView (PBBlocksExtension)
typedef void (^PBBlocksAlertViewHandler)(UIAlertView* alertView, NSInteger buttonIndex);
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
            handler:(PBBlocksAlertViewHandler)handler
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;
@end

//
@interface PBBlocksAlertViewHolder : NSObject<UIAlertViewDelegate>
@property (nonatomic, copy) PBBlocksAlertViewHandler handler;
- (id)initWithHandler:(PBBlocksAlertViewHandler)aHandler;
@end
