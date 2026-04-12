# PROJECT NAME

---

## Supported Platforms
| Platform | Compiler                         | Build system    | Status |
|----------|----------------------------------|-----------------|--------|
| Windows  | MSVC (Visual Studio 2026 / 18.x) | MSBuild / Ninja | ✅      |
| Linux    | GCC ≥ 13                         | Ninja / Make    | ✅      |
| MacOS    | GCC ≥ 13 / Clang                 | Ninja / Make    | 🚧     |
| iOS      |                                  |                 | ❌      |
| tvOS     |                                  |                 | ❌      |
| Android  |                                  |                 | ❌      |
| Web      |                                  |                 | ❌      |

## Build

### Prerequisites
The following dependencies must be installed on your system:

- [CMake ≥ 4.0.0](https://cmake.org/)
- [Git](https://git-scm.com/)

---

## Usage

>

---

## Documentation

---

## Development

This section targets developers and contributors.

### CMake Options
| Option                    | Default | Description                                   |
|---------------------------|---------|-----------------------------------------------|
| `BUILD_APP`               | `ON`    | Build modules and apps                        |
| `BUILD_DOC_HTML`          | `OFF`   | Generate HTML documentation                   |
| `BUILD_DOC_PDF`           | `OFF`   | Generate PDF documentation (Linux/macOS only) |
| `BUILD_TESTS`             | `OFF`   | Build unit tests                              |
| `RUN_CLANG_TIDY`          | `OFF`   | Run clang-tidy static analysis                |
| `RUN_CLANG_TIDY_ERRORS`   | `OFF`   | Treat clang-tidy warnings as errors           |
| `RUN_CLANG_FORMAT_ERRORS` | `OFF`   | Treat clang-format warnings as errors         |
| `RUN_CLANG_FORMAT_FORMAT` | `OFF`   | Run clang-format                              |

### Preprocessor macros
| Macro                 | Example value | Description                            |
|-----------------------|---------------|----------------------------------------|
| `PROJECT_BUILD_TYPE`  | `Release`     | build type (e. g. Release, Debug, ...) |
| `PROJECT_COMMIT_HASH` | `8a14a71`     | git commit hash                        |
| `PROJECT_NAME`        | `my_app`      | Project name as defined in `project()` |
| `PROJECT_VERSION`     | `1.2.3`       | Semver version                         |
| `PLATFORM_WINDOWS`    | *(defined)*   | Target platform is Windows             |
| `PLATFORM_LINUX`      | *(defined)*   | Target platform is Linux               |
| `PLATFORM_MACOS`      | *(defined)*   | Target platform is macOS               |
| `PLATFORM_ANDROID`    | *(defined)*   | Target platform is Android             |


### Tests
Tests are built with [GoogleTest](https://github.com/google/googletest).

```bash
cmake -B build -S . -DBUILD_TESTS=ON
cmake --build build
./build/tests/sig_tests
```

---
### Build Doxygen documentation
Documentation is generated with [Doxygen](https://www.doxygen.nl/) and outputs to `build/documentation/`.

```bash
cmake -B build -S . -DBUILD_DOC_HTML=ON -DBUILD_DOC_PDF=ON
cmake --build build --target doc
```

Then open in browser `build/documentation/html/index.html`.
> PDF generation isn't  supported on Windows.

---

## Third-party libraries
- [doxygen-awesome-css](https://github.com/jothepro/doxygen-awesome-css): A custom CSS theme for Doxygen documentation.
- [googletest](https://github.com/google/googletest): A testing framework for C++.
- [nlohmann-json](https://github.com/nlohmann/json): JSON cpp.
- [spdlog](https://github.com/gabime/spdlog): Logging library.

---

## Contributing
Want to contribute? See [Contributing guidelines](./CONTRIBUTING.md).

---

## Security
Please review our [Security Policy](./SECURITY.md) for more information on reporting security vulnerabilities.

---

## License
This project is licensed under the `` License - see the [License](./LICENSE.md) file for details.
