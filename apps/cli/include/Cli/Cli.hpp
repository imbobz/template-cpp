///
/// @file Cli.hpp
/// @brief Declaration of the ur_namespace::Cli class.
///
/// Cli is the single entry-point for command-line argument processing in the
/// @e ur_namespace application. It follows the Rule of Five, explicitly deleting every
/// copy/move constructor and assignment operator so that only one Cli instance
/// can exist at a time (typically owned by @c main()).
///

#pragma once

#include <print>

namespace ur_namespace
{

    ///
    /// @class Cli
    /// @brief Parses and exposes the application's command-line interface.
    ///
    /// @par Example
    /// @code{.cpp}
    /// int main(int argc, char* argv[])
    /// {
    ///     Cli cli;
    ///     cli.parse(argc, argv);   // to be implemented
    ///     if (cli.verbose())
    ///         std::print("{}", "Verbose mode enabled\n");
    /// }
    /// @endcode
    ///
    class Cli
    {
    public:

        Cli(const Cli &) = delete;
        Cli &operator=(const Cli &) = delete;
        Cli(Cli &&) = delete;
        Cli &operator=(Cli &&) = delete;

        ///
        /// @brief print hellow world
        ///
        static void hello_world()
        {
                std::print("{2} {1}{0}!\n", 23, "C++", "Hello");
        }

    }; // class Cli

} // namespace ur_namespace
