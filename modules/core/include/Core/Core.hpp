///
/// @file Core.hpp
/// @brief This file contains the Core class declaration
/// @namespace ur_namespace
///

#pragma once

#include <iostream>

namespace ur_namespace
{

    ///
    /// @class Core
    /// @brief Class for Core
    /// @namespace
    ///
    class Core
    {
        public:
            Core() = default;
            ~Core() = default;

            Core(const Core &) = delete;
            Core &operator=(const Core &) = delete;
            Core(Core &&) = delete;
            Core &operator=(Core &&) = delete;

            ///
            /// @brief print hellow world
            ///
            static void hello_world()
            {
                std::cout << "Hello World!" << std::endl;
            }

    }; // class Core

} // namespace ur_namespace
