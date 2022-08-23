alias_list = (
    ("cargo", "rust"),
    ("rustc", "rust"),
    ("clojure", "clojure"),
    ("deno", "denoland/deno"),
    ("elixir", "elixir"),
    # ("go", "golang"),
    ("javac", "openjdk"),
    ("java", "openjdk"),
    ("julia", "julia"),
    ("nim", "nimlang/nim"),
    ("pypy", "pypy"),
    ("racket", "racket/racket"),
    ("stack", "haskell"),
    ("swift", "swift"),
)

for (cmd, img) in alias_list:
    print(f"alias {cmd}='docker run -t --rm -v \"$PWD:/wrk\" -w /wrk {img} {cmd}'")
