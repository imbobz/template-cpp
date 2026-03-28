///
/// @file Core.hpp
/// @brief
///
/// `Core.hpp`
///

#pragma once

#include <print>

namespace core
{

    ///
    /// @class Core
    /// @brief Class for Core
    ///
    class Core
    {
        public:

            Core(const Core &) = delete;
            Core &operator=(const Core &) = delete;
            Core(Core &&) = delete;
            Core &operator=(Core &&) = delete;

            ///
            /// @brief print Project metadata
            ///
            static void printMetadata();

    }; // class Core

} // namespace core
