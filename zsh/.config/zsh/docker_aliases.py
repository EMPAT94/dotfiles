alias_list = (
    ("cargo", "rust"),
    ("clojure", "clojure"),
    ("deno", "denoland/deno"),
    ("elixir", "elixir"),
    ("go", "golang"),
    ("javac", "openjdk"),
    ("java", "openjdk"),
    ("julia", "julia"),
    ("nim", "nimlang/nim"),
    ("pypy", "pypy"),
    ("python", "python:3.11-rc-bullseye"),
    ("racket", "racket/racket"),
    ("stack", "haskell"),
    ("swift", "swift"),
)

for (cmd, img) in alias_list:
    print(f"alias {cmd}='docker run --rm -it -v \"$PWD:/wrk\" -w /wrk {img} {cmd}'")
