"""import_annotations_jar build macro

This macro is intended for internal-use only to re-import the annotations JAR
into a JavaInfo provider without keeping dependency information.
"""

def _impl_import_annotations_jar(ctx):
    if ctx.file.jar.extension != "jar":
        fail("jar must be a file with extension .jar")
    return JavaInfo(output_jar = ctx.file.jar, compile_jar = ctx.file.jar)

import_annotations_jar = rule(
    implementation = _impl_import_annotations_jar,
    attrs = {
        "jar": attr.label(
            allow_single_file = True,
        ),
    },
    fragments = ["java"],
)
