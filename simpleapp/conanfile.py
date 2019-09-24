from conans import ConanFile, CMake


class SimpleAppConan(ConanFile):
    name = "simpleapp"
    version = "0.1"
    license = "MIT"
    author = "Thomas Arvanitidis thomasarvanitidis@gmail.com"
    url = "https://github.com/thomasarvanitidis/rpath_tutorial"
    description = "Simple app that links to mymaths"
    topics = ("executable", "calculator")
    settings = "os", "compiler", "build_type", "arch"
    options = {"verbose": [True, False]}
    default_options = {"verbose": True}
    generators = "cmake"
    exports_sources = "*"

    def requirements(self):
        self.requires.add("mymaths/0.1@thomas/develop")

    def build(self):
        cmake = CMake(self)
        cmake.verbose = self.options.verbose
        cmake.configure()
        cmake.build()

    def package(self):
        self.copy("*", dst="bin", keep_path=False)

    def package_info(self):
        self.cpp_info.libs = ["simpleapp"]
