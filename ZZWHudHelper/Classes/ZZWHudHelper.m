//
//  ZZWHudHelper.m
//  WeCan
//
//  Created by Summer on 2018/4/19.
//  Copyright © 2018年 WeCan. All rights reserved.
//

#import "ZZWHudHelper.h"

@interface ZZWHudHelper()


@end
@implementation ZZWHudHelper

+(instancetype)shareInstance{
    static id _shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[self alloc] init];
    });
    
    return _shareInstance;
}
-(id)init{
    self = [super init];
    if (self) {
        _hud = nil;
    }
    return self;
}

-(void)showHudInSuperView:(UIView *)superView withText:(NSString *)text withType:(HudMode)type{
    _hud = [MBProgressHUD new];
    if (superView == nil)  superView = [UIApplication sharedApplication].keyWindow;
        
    _mode = type;
    switch (type) {
        case HudModeTitle:{
            _hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
            _hud.labelText = text;
            _hud.mode = MBProgressHUDModeText;

        }
            
            break;
        case HudModeDefault:{
            _hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
            _hud.labelText = text;
//            _hud.color = UITools.defaultHudColor;
            if (nil == text) {
                _hud.labelText = @"请稍等";
            }
        }
            
            break;
            
        default:
            break;
    }
    
}
-(void)hideHud{
    [_hud hide:YES afterDelay:0];
    self.hud = nil;
}

- (void)showOnlyText:(NSString *)text{
    [self showHudInSuperView:nil withText:text withType:HudModeTitle];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
        
//        [MBProgressHUD hideHUDForView: [UIApplication sharedApplication].keyWindow  animated:YES];
//        self-> _hud = nil;
    });
}

-(BOOL)hideHudInSuperView:(UIView *)superView{
    BOOL result;
    if (superView == nil) {
        [self hideHud];
        result = YES;
    }else{
        switch (_mode) {
            case HudModeDefault:
                result = [MBProgressHUD hideHUDForView:superView animated:YES];
                break;
            case HudModeTitle:
                [_hud removeFromSuperview];
                result = YES;
                break;
                
            default:
                break;
        }
        _hud = nil;
    }
    
    return result;
}

-(void)setText:(NSString *)text{
    _text = [text copy];
    _hud.labelText = text;
}


-(void)setMode:(HudMode)mode{
    _mode = mode;
    switch (mode) {
        case HudModeDefault:

            break;
        case HudModeTitle:
            _hud.mode = MBProgressHUDModeText;
            break;
            
        default:
            break;
    }
    
}
@end
