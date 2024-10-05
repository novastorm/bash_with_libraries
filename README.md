# BASH with Library Modules

 Building projects using bash starts to get unwieldly quickly as the lines of source grows. This is an example of a bash script using other bash scripts as library modules.

### Scope

Use `local VAR` to mitigate overwriting global environment variables.

Quote variable expansions. Use "$VAR"

### Naming conventions

Namespacing functions mitigates shadowing functions present before a file is sourced. The convention is `namespace::function_name`. This will allow the function to be loaded and called from the parent script.

Script variables local to the file should be lower case.

Exported variables should be upper case and use a uniquie PREFIX.
