using Clang.Generators

cd(@__DIR__)

include_dir = "C:\\Users\\erst0014\\OneDrive - Securitas\\Dokument 1\\WiringPi\\WiringPi\\wiringPi\\"


clang_dir = "C:\\Users\\erst0014\\OneDrive - Securitas\\Dokument 1\\WiringPi\\WiringPi\\wiringPi\\"

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$include_dir")

#headers = [joinpath(clang_dir, header) for header in readdir(clang_dir) if endswith(header, ".h")]
# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
#headers = detect_headers(clang_dir, args)
headers = [joinpath(clang_dir, "wiringPi.h")]

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)