# JsInterop Annotations &middot; ![Latest Release](https://img.shields.io/github/v/release/google/jsinterop-annotations) &middot; [![Build Status](https://github.com/google/jsinterop-annotations/actions/workflows/ci.yaml/badge.svg)](https://github.com/google/jsinterop-annotations/actions/workflows/ci.yaml)



JsInterop Annotations contains a set of java annotations that drive the
javascript code generation of [J2CL transpiler](https://github.com/google/j2cl)
or [GWT](https://github.com/gwtproject/gwt)

Bazel dependency
----------------
If your project uses [Bazel](https://bazel.build), J2CL repository already
provides targets `@j2cl//:jsinterop-annotations` and
`@j2cl://jsinterop-annotations-j2cl` for Server/Android and J2CL respectively.

Maven dependency
----------------
If your project uses [Maven](https://maven.apache.org), add the following maven
dependency in your `pom.xml`. Replace `RELEASE_VERSION` with an actual
[release version](https://github.com/google/jsinterop-annotations/releases):

    <dependency>
      <groupId>com.google.jsinterop</groupId>
      <artifactId>jsinterop-annotations</artifactId>
      <version>RELEASE_VERSION</version>
    </dependency>

Build GWT compatible maven jar files
------------------------------------
If you want to build the last version on your own, follow the instructions
below:

- Install [Bazelisk](https://github.com/bazelbuild/bazelisk):

```shell
    $ npm install -g @bazel/bazelisk
    $ alias bazel=bazelisk
```
- Clone this git repository:
  ```shell
  $ git clone https://github.com/google/jsinterop-annotations.git
  ```
- Run the release script:
  ```shell
      $ cd jsinterop-annotations
      $ ./maven/release_jsinterop_annotations.sh --version local --no-deploy
  ```

 The script will output the directory containing the generated jar files that
 can be used with maven.

Contributing
------------
Please refer to [the contributing document](CONTRIBUTING.md).

Licensing
---------
Please refer to [the license file](LICENSE).

Disclaimer
----------
This is not an official Google product.

