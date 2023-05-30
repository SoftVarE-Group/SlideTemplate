#!/usr/bin/env texlua

bundle = ""
module = "SlideTemplate"
ctanpkg = module
builddir = os.getenv("TMPDIR")

-- Package date ======================================================
packagedate = os.date("!%Y-%m-%d")

-- Tests ======================================================
test_order = {"log", "pdf"}
checkengines={"pdftex"}
checkformat="latex"

-- interacting with git ==============================================
function git(...)
    local args = {...}
    table.insert(args, 1, 'git')
    local cmd = table.concat(args, ' ')
    print('Executing:', cmd)
    os.execute(cmd)
end

-- TODO: rest

-- cleanup ===========================================================
cleanfiles = {module .. "-ctan.curlopt", module .. "-ctan.zip"}
