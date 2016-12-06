
/**
 *
 *  Xcode 6 下创建 PrefixHeader.pch 预载文件
 *  Build Setting -> Prefix Header -> 设置为 $(SRCROOT)/项目名/PrefixHeader.pch
 *  Build Setting -> Precompile Prefix Header 为YES
 *
 */


// 忽略警告
// 编译时，编译警告忽略掉某些文件
// 只需在在文件的Compiler Flags 中加入 -w 参数



/// 所有第三方库所用到的framework



/**
 *  AFNetworking
 *
 * 	@framework
 *
 *      CFNetwork.framework
 *      SystemConfiguration.framework
 *      MobileCoreServices.framework
 *      Security.framework
 *
 *  非ARC模式下，需要对AFNetworking相关类添加 -fobjc-arc
 */


/**
 *  ASIHttpRequest
 *
 *  @framework
 *
 *      SystemConfiguration.framework
 *      MobileCoreServices.framework
 *      CFNetwork.framework
 *      CoreGraphics.framework
 *      libz.dylib
 *
 *  ARC模式下，需要对ASIHttpRequest相关类添加 -fno-objc-arc
 */


/**
 *  GCDAsyncSocket
 *
 *  @framework
 *
 *      Security.framework
 *      CFNetwork.framework
 */


/**
 *  GDataXMLNode
 *  
 * 	@framework
 * 
 *      libxml2.dylib
 *	Header Search Paths 改为 ${SDKROOT}/usr/include/libxml2
 *	
 *	ARC模式下，Build Phases->Complile Sources->GDataXMLNode.m->Complier Flags设置为 -fno-objc-arc
 */


/**
 *  SVProgressHUD
 *
 *  @framework
 *
 *      QuartzCore.framework
 */

 

 