//
//  SKScrollingNode.m
//  spritybird
//
//  Created by Alexis Creuzot on 09/02/2014.
//  Copyright (c) 2014 Alexis Creuzot. All rights reserved.
//

#import "SKScrollingNode.h"

@implementation SKScrollingNode


+ (id) scrollingNodeWithImageNamed:(NSString *)name inContainerWidth:(float) width
{
    UIImage * image = [UIImage imageNamed:name];
    
    SKScrollingNode * realNode = [SKScrollingNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(width, image.size.height)];
    realNode.scrollingSpeed = 1;
    
    float total = 0;
    while(total<(width + image.size.width)){
        SKSpriteNode * child = [SKSpriteNode spriteNodeWithImageNamed:name ];
        [child setAnchorPoint:CGPointZero];
        [child setPosition:CGPointMake(total, 0)];
        [realNode addChild:child];
        total+=child.size.width;
    }
    
    return realNode;
}


- (void) update:(NSTimeInterval)currentTime
{
    [self.children enumerateObjectsUsingBlock:^(SKNode * _Nonnull child, NSUInteger idx, BOOL * _Nonnull stop) {
        child.position = CGPointMake(child.position.x-self.scrollingSpeed, child.position.y);
        if (child.position.x <= -child.frame.size.width){
            float delta = child.position.x+child.frame.size.width;
            child.position = CGPointMake(child.frame.size.width*(self.children.count-1)+delta, child.position.y);
        }
    }];
}

@end
