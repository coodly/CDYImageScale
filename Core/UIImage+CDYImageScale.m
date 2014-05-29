/*
 * Copyright 2014 Coodly OÜ
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "UIImage+CDYImageScale.h"

@implementation UIImage (CDYImageScale)

- (UIImage *)scaleTo:(CGSize)targetSize mode:(UIViewContentMode)mode {
    CGRect drawFrame = CGRectZero;
    if (mode == UIViewContentModeScaleAspectFill) {
        CGFloat scaledImageWidth;
        CGFloat scaledImageHeight;
        if (self.size.height > self.size.width) {
            scaledImageWidth = targetSize.width;
            scaledImageHeight = (scaledImageWidth * self.size.height) / self.size.width;
        } else {
            scaledImageHeight = targetSize.height;
            scaledImageWidth = (scaledImageHeight * self.size.width) / self.size.height;
        }

        drawFrame = CGRectMake((targetSize.width - scaledImageWidth) / 2, (targetSize.height - scaledImageHeight) / 2, scaledImageWidth, scaledImageHeight);
    }

    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    [self drawInRect:drawFrame];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
