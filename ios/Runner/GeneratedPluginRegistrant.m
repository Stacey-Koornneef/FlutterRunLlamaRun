//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<camera_avfoundation/CameraPlugin.h>)
#import <camera_avfoundation/CameraPlugin.h>
#else
@import camera_avfoundation;
#endif

#if __has_include(<image_picker_ios/FLTImagePickerPlugin.h>)
#import <image_picker_ios/FLTImagePickerPlugin.h>
#else
@import image_picker_ios;
#endif

#if __has_include(<learning_text_recognition/LearningTextRecognitionPlugin.h>)
#import <learning_text_recognition/LearningTextRecognitionPlugin.h>
#else
@import learning_text_recognition;
#endif

#if __has_include(<simple_ocr_plugin/SimpleOcrPlugin.h>)
#import <simple_ocr_plugin/SimpleOcrPlugin.h>
#else
@import simple_ocr_plugin;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CameraPlugin registerWithRegistrar:[registry registrarForPlugin:@"CameraPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [LearningTextRecognitionPlugin registerWithRegistrar:[registry registrarForPlugin:@"LearningTextRecognitionPlugin"]];
  [SimpleOcrPlugin registerWithRegistrar:[registry registrarForPlugin:@"SimpleOcrPlugin"]];
}

@end
