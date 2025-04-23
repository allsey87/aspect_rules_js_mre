"""custom_rule.bzl"""

JS_CONTENT = """
Console.log('hello world!')
"""

def _custom_rule_impl(ctx):
    output_js = ctx.actions.declare_file(ctx.label.name + ".js")
    outputs = [output_js]
    ctx.actions.write(output_js, JS_CONTENT, is_executable=False)
    return DefaultInfo(files = depset(outputs))

custom_rule = rule(
    implementation = _custom_rule_impl,
)
