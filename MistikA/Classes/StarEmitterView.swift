//
//  StarEmitterView.swift
//  MistikA
//
//  Created by Tadas Ziemys on 11/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit
import QuartzCore

class StarEmitterView: UIView {

    var starsEmitter: CAEmitterLayer?
    
    override func awakeFromNib() {

        starsEmitter = CAEmitterLayer()
        
        
        if starsEmitter != nil {
            //configure the emitter layer
            starsEmitter!.emitterPosition = CGPointMake(160, 240);
            starsEmitter!.emitterSize = CGSizeMake(self.superview!.bounds.size.width,self.superview!.bounds.size.height);
            starsEmitter!.renderMode = kCAEmitterLayerPoints;
            starsEmitter!.emitterShape = kCAEmitterLayerRectangle;
            starsEmitter!.emitterMode = kCAEmitterLayerUnordered;
            
            var stars = CAEmitterCell()
            stars.birthRate = 2
            stars.lifetime = 10
            stars.lifetimeRange = 0.5
            stars.color = UIColor.whiteColor().CGColor
            stars.contents = UIImage(named: "particle.png")!.CGImage
            stars.velocityRange = 300
            stars.emissionRange = 360
            stars.scale = 0.2
            stars.scaleRange = 0.1
            stars.alphaRange = 0.1
            stars.alphaSpeed = 0.6
            
            stars.name = "stars"
            
            //add the cell to the layer and we're done
            starsEmitter!.emitterCells = [stars];
            
            
            layer.addSublayer(starsEmitter)
        }
    }
    
    func layerClass() -> AnyClass {
        return CAEmitterLayer.classForCoder()
    }
    
}


/*
@implementation Emitter
{
CAEmitterLayer* starsEmitter; //1
}

-(void)awakeFromNib
{
//set ref to the layer
starsEmitter = (CAEmitterLayer*)self.layer; //2

//configure the emitter layer
starsEmitter.emitterPosition = CGPointMake(160, 240);
starsEmitter.emitterSize = CGSizeMake(self.superview.bounds.size.width,self.superview.bounds.size.height);
NSLog(@"width = %f, height = %f", starsEmitter.emitterSize.width, starsEmitter.emitterSize.height);
starsEmitter.renderMode = kCAEmitterLayerPoints;
starsEmitter.emitterShape = kCAEmitterLayerRectangle;
starsEmitter.emitterMode = kCAEmitterLayerUnordered;

CAEmitterCell* stars = [CAEmitterCell emitterCell];
stars.birthRate = 0;
stars.lifetime = 10;
stars.lifetimeRange = 0.5;
stars.color = [[UIColor colorWithRed:255 green:255 blue:255 alpha:0]
CGColor];
stars.contents = (id)[[UIImage imageNamed:@"particle.png"] CGImage];
stars.velocityRange = 500;
stars.emissionRange = 360;
stars.scale = 0.2;
stars.scaleRange = 0.1;
stars.alphaRange = 0.3;
stars.alphaSpeed  = 0.5;

[stars setName:@"stars"];

//add the cell to the layer and we're done
starsEmitter.emitterCells = [NSArray arrayWithObject:stars];

}

+ (Class) layerClass //3
{
//configure the UIView to have emitter layer
return [CAEmitterLayer class];
}

-(void)setIsEmitting:(BOOL)isEmitting
{
//turn on/off the emitting of particles
[starsEmitter setValue:[NSNumber numberWithInt:isEmitting?2:0]
forKeyPath:@"emitterCells.stars.birthRate"];
}

-(void)stopAnimations {

[starsEmitter removeAllAnimations];
}

*/