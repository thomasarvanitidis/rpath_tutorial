from conans import ConanFile, CMake


class MyMathsConan(ConanFile):
    name = "mymaths"
    version = "0.1"
    license = "MIT"
    author = "Thomas Arvanitidis thomasarvanitidis@gmail.com"
    url = "https://github.com/thomasarvanitidis/rpath_tutorial"
    description = "High-level maths lib depending on fastmatrix"
    topics = ("maths", "high-level")
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "verbose": [True, False]}
    default_options = {"shared": True, "verbose": True}
    generators = "cmake"
    exports_sources = "*"

    def requirements(self):
        self.requires.add("fastmatrix/0.1@testuser/develop")

    def build(self):
        cmake = CMake(self)
        cmake.verbose = self.options.verbose
        cmake.configure()
        cmake.build()

    def package(self):
        self.copy("*.h", dst="include")
        self.copy("*.so", dst="lib", keep_path=False)
        self.copy("*.dylib", dst="lib", keep_path=False)
        self.copy("*.a", dst="lib", keep_path=False)

    def package_info(self):
        self.cpp_info.libs = ["mymaths"]
