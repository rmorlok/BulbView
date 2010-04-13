//
//  MTIBulbView.h
//  Copyright 2009 Ryan Morlok
//  http://softwareblog.morlok.net/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

typedef enum {
	MTIBulbViewAlignLeft		=-1,
	MTIBulbViewAlignCenter		= 0,
	MTIBulbViewAlignRight		= 1
} MTIBulbViewAlignment;

#if TARGET_OS_IPHONE
@interface MTIBulbView : UIView {
#else
@interface MTIBulbView : NSView {
#endif
	
	CGColorRef litColor;
	CGColorRef dimColor;
	NSString *text;
	MTIBulbViewAlignment alignment;
}

@property(nonatomic) CGColorRef litColor;
@property(nonatomic) CGColorRef dimColor;
@property(nonatomic, retain) NSString *text;
@property(nonatomic) MTIBulbViewAlignment alignment;

@end
