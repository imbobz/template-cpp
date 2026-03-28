///
/// @file Cli.hpp
/// @brief This file contains the Cli class declaration
/// @namespace ur_namespace
///

#pragma once

#include <iostream>

namespace ur_namespace
{

    ///
    /// @class Cli
    /// @brief Class for Cli
    /// @namespace ur_namespace
    ///
    class Cli
    {
    public:
        Cli() = default;
        ~Cli() = default;

        Cli(const Cli &) = delete;
        Cli &operator=(const Cli &) = delete;
        Cli(Cli &&) = delete;
        Cli &operator=(Cli &&) = delete;

        ///
        /// @brief print hellow world
        ///
        static void hello_world()
        {
            std::cout << "Hello World!" << std::endl;
        }

    }; // class Cli

} // namespace ur_namespace
