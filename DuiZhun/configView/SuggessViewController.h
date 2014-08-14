//
//  SuggessViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransitionViewController.h"

@interface SuggessViewController : TransitionViewController<UITextViewDelegate>
{

    __weak IBOutlet UIImageView *suggessImage;
    __weak IBOutlet UIButton *leftImage;
}
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *lenthLabel;

- (IBAction)submit:(id)sender;
- (IBAction)close:(id)sender;

@end
