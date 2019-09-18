# JsInterop Annotations   &middot; [![Build Status](https://secure.travis-ci.org/google/jsinterop-annotations.png?branch=master)](http://travis-ci.org/google/jsinterop-annotations)

JsInterop Annotations contains a set of java annotations that drive the
javascript code generation of [J2CL transpiler](https://github.com/google/j2cl)
or [GWT](https://github.com/gwtproject/gwt)

Build with Bazel
----------------
If you want to build the last version on your own, follow the instructions
below:

- Install [Bazel](https://bazel.build/versions/master/docs/install.html).
- clone this repository with git: `git clone https://github.com/google/jsinterop-base.git`
- Inside the repository, have bazel build the jar files:

    $ bazel build //java/jsinterop/annotations

 - For building the source jar file:

    $ bazel build //java/jsinterop/annotations:annotations-src.jar

The jars are available in your `bazel-bin/java/jsinterop/annotations` directory.

Bazel dependency
----------------
If your project use [Bazel](https://bazel.build), add this repository as an
external dependency in your `WORKSPACE` file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_google_jsinterop_annotations",
    strip_prefix = "jsinterop-annotations-master",
    url = "https://github.com/google/jsinterop-annotations/archive/master.zip",
)
```

Then add `@com_google_jsinterop_annotations//:jsinterop-annotations-j2cl` to
your `j2cl_library` deps.

Maven dependency
----------------
If your project use [Maven](https://maven.apache.org), add maven dependency in
your pom.xml:

    <dependency>
        <groupId>com.google.jsinterop</groupId>
        <artifactId>jsinterop-annotations</artifactId>
        <version>1.0.2</version>
    </dependency>



Download the jar file
----------------------
You can also download manually [the jar file](https://repo1.maven.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.2/jsinterop-annotations-1.0.2.jar).

Contributing
------------
Please refer to [the contributing document](CONTRIBUTING.md).

Licensing
---------
Please refer to [the license file](LICENSE).

Disclaimer
----------
This is not an official Google product.

