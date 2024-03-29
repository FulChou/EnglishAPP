//
//  ZFCountingLabel.m
//  EnglishAPPDemo
//
//  Created by 周福 on 2019/9/16.
//  Copyright © 2019 org.csu. All rights reserved.
//

#import "ZFCountingLabel.h"

@interface ZFCountingLabel ()
@property (nonatomic, strong) CADisplayLink *playLink;
@property (nonatomic, assign) NSInteger displayPerSecond;

@property (nonatomic, assign) CGFloat fromValue;
@property (nonatomic, assign) CGFloat toValue;

@property (nonatomic, assign) CGFloat increaseValue;
@property (nonatomic, assign) CGFloat perValue;

@end
@implementation ZFCountingLabel

- (instancetype)init {
    if (self = [super init]) {
        [self initValues];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initValues];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initValues];
}

- (void)initValues {
    _duration = 2.0;
    _displayPerSecond = 30;
}

- (void)countingFrom:(CGFloat)fromValue to:(CGFloat)toValue {
    [self countingFrom:fromValue to:toValue duration:_duration];
}

- (void)countingFrom:(CGFloat)fromValue to:(CGFloat)toValue duration:(CGFloat)duration {
    
    _fromValue = fromValue;
    _toValue = toValue;
    _duration = duration;
    
    _increaseValue = _fromValue;
    _perValue = (_toValue - _fromValue)/(_duration==0?1:(_displayPerSecond*_duration));
    
    if (self.playLink) {
        [self.playLink invalidate];
        self.playLink = nil;
    }
    
    CADisplayLink *playLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(countingAction)];
    playLink.preferredFramesPerSecond = _displayPerSecond;
    [playLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [playLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:UITrackingRunLoopMode];
    self.playLink = playLink;
    
}

- (void)countingAction {
    _increaseValue += _perValue;
    
    if (_fromValue < _toValue) {
        if (_increaseValue >= _toValue) {
            [self stopDisplayLink];
        }
    } else {
        if (_increaseValue <= _toValue) {
            [self stopDisplayLink];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.text = [NSString stringWithFormat:@"%.0f%%",self->_increaseValue];
    });
}

- (void)stopDisplayLink {
    
    [self.playLink invalidate];
    self.playLink = nil;
    
    _increaseValue = _toValue;
}

@end
