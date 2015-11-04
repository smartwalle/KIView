//
//  KITextView.m
//  Kitalker
//
//  Created by 杨 烽 on 13-12-24.
//
//

#import "KITextView.h"

#define kPlaceholderLabelTag 917998899

@interface KITextView ()
@property (nonatomic, strong) UILabel *placeholderLabel;
@end

@implementation KITextView

- (void)dealloc {
    _placeholderLabel = nil;
    _placeholder = nil;
    _placeholderColor = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (id)init {
    if (self = [super init]) {
        [self _initFinished];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        [self _initFinished];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    if (self = [super initWithFrame:frame textContainer:textContainer]) {
        [self _initFinished];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _initFinished];
    }
    return self;
}

- (void)_initFinished {
    [self setPlaceholder:@""];
    [self setPlaceholderColor:[UIColor lightGrayColor]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textChanged:(NSNotification *)notification {
    if([[self placeholder] length] == 0) {
        return;
    }
    
    if ([[self text] length] == 0) {
        [[self viewWithTag:kPlaceholderLabelTag] setAlpha:1];
    } else {
        [[self viewWithTag:kPlaceholderLabelTag] setAlpha:0];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect {
    if([[self placeholder] length] > 0) {
        if (_placeholderLabel == nil ) {
            _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeholderLabel.numberOfLines = 0;
            _placeholderLabel.font = self.font;
            _placeholderLabel.backgroundColor = [UIColor clearColor];
            _placeholderLabel.textColor = self.placeholderColor;
            _placeholderLabel.alpha = 0;
            _placeholderLabel.tag = kPlaceholderLabelTag;
            [self addSubview:_placeholderLabel];
        }
        _placeholderLabel.text = self.placeholder;
        [_placeholderLabel sizeToFit];
        [self sendSubviewToBack:_placeholderLabel];
    }
    
    if([[self text] length] == 0 && [[self placeholder] length] > 0 ) {
        [[self viewWithTag:kPlaceholderLabelTag] setAlpha:1];
    }
    [super drawRect:rect];
}

@end
