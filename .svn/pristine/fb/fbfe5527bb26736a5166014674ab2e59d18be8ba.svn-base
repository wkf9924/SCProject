
/**
 *  非常重要
 *
 *  请仔细阅读Class文件目录下所有已写好的 宏、单例方法
 *
 */

IOS8以后定位问题添加这个在infoPlist离
<key>NSLocationAlwaysUsageDescription</key>
<true/>
<key>NSLocationWhenInUseUsageDescription</key>
<true/>

**********bitcode
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>

ios9http请求


在Info.plist中添加NSAppTransportSecurity类型Dictionary。

在NSAppTransportSecurity下添加NSAllowsArbitraryLoads类型Boolean,值设为YES


label自适应高度
// iOS7中用以下方法替代过时的iOS6中的sizeWithFont:constrainedToSize:lineBreakMode:方法
UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
CGRect expectedSizeMessage = [message boundingRectWithSize:CGSizeMake((self.bounds.size.width * CSToastMaxWidth) - imageWidth, self.bounds.size.height * CSToastMaxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil];

