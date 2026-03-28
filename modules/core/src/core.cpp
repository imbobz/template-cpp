#include "Core/Core.hpp"

void core::Core::printMetadata()
{

    std::print("name: {0}\nversion: {1}\ncommit hash: {2}\nbuild type: {3}\n", PROJECT_NAME, PROJECT_VERSION, PROJECT_COMMIT_HASH, PROJECT_BUILD_TYPE);
#ifdef PLATFORM_WINDOWS
    std::print("platform: Windows\n");
#elifdef PLATFORM_MACOS
    std::print("platform: macOS\n");
#elifdef PLATFORM_LINUX
    std::print("platform: Linux\n");
#elifdef PLATFORM_ANDROID
    std::print("platform: Android\n");
#else
#error "Unsupported platform"
#endif

}
