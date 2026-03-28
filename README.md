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
| Android  |                                  |                 | 🚧     |
| Web      |                                  |                 | 🚧     |

## Build

### Prerequisites
The following dependencies must be installed on your system:

- [CMake ≥ 4.0.0](https://cmake.org/)
- [Git](https://git-scm.com/)

### CMake Options

| Option           | Default | Description                                   |
|------------------|---------|-----------------------------------------------|
| `BUILD_DOC_HTML` | `OFF`   | Generate HTML documentation                   |
| `BUILD_DOC_PDF`  | `OFF`   | Generate PDF documentation (Linux/macOS only) |
| `BUILD_TESTS`    | `OFF`   | Build unit tests                              |

---

## Usage

>

---

## Documentation

---

## Development

This section targets developers and contributors.

### CMake Build options

- `BUILD_DOC_HTML` (default: `OFF`): Enable building Doxygen html documentation.
- `BUILD_DOC_PDF` (default: `OFF`): Enable building Doxygen pdf documentation.
- `BUILD_TESTS` (default: `OFF`): Enable building unit tests.

### Preprocessor macros

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

- [Doxygen Awesome CSS](https://github.com/jothepro/doxygen-awesome-css): A custom CSS theme for Doxygen documentation.
- [Google Test](https://github.com/google/googletest): A testing framework for C++.

---

## Contributing

Want to contribute? See [Contributing guidelines](./CONTRIBUTING.md).

---

## Security

Please review our [Security Policy](./SECURITY.md) for more information on reporting security vulnerabilities.

---

## License

This project is licensed under the `` License - see the [License](./LICENSE.md) file for details.
