add_executable(plug_in MACOSX_BUNDLE Empty.txt)
set_target_properties(plug_in PROPERTIES
  LINKER_LANGUAGE CXX
  XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED "NO"
  XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ""
  XCODE_ATTRIBUTE_ENABLE_BITCODE "NO"
  MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Info.plist.in"
  MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.app.plug_in"
  XCODE_EXPLICIT_FILE_TYPE "wrapper.cfbundle"
  XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
)

add_executable(app MACOSX_BUNDLE main.m)
add_dependencies(app plug_in)
set_target_properties(app PROPERTIES
  XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED "NO"
  XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ""
  XCODE_EMBED_PLUGINS plug_in
  MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.app"
)
