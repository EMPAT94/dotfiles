alias_list = (
    ("pypy", "pypy"),
    ("clojure", "clojure"),
    ("nim", "nimlang/nim"),
    ("julia", "julia"),
    ("cargo", "rust"),
    ("go", "golang"),
    ("javac", "openjdk"),
    ("java", "openjdk"),
    ("swift", "swift"),
    ("elixir", "elixir"),
    ("deno", "denoland/deno"),
)

for (cmd, img) in alias_list:
    print(f"alias {cmd}='docker run --rm -it -v \"$PWD:/wrk\" -w /wrk {img} {cmd}'")
