#include "Core/Core.hpp"

constexpr std::string platformToStr()
{
    std::string platform;
#ifdef PLATFORM_WINDOWS
    platform = "Windows";
#elifdef PLATFORM_MACOS
    platform = "macOS";
#elifdef PLATFORM_LINUX
    platform = "Linux";
#elifdef PLATFORM_ANDROID
    platform = "Android";
#else
    platform = "";
#endif
    return platform;
}

void core::Core::printMetadata()
{
    std::print("name: {0}\nversion: {1}\ncommit hash: {2}\nbuild type: {3}\nplatform: {4}\n",
               PROJECT_NAME, PROJECT_VERSION, PROJECT_COMMIT_HASH, PROJECT_BUILD_TYPE,
               platformToStr());
}
