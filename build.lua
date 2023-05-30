#!/usr/bin/env texlua

bundle = ""
module = "SlideTemplate"
ctanpkg = module
builddir = os.getenv("TMPDIR")

-- Package version ===================================================
local handle = io.popen("git describe --tags $(git rev-list --tags --max-count=1)")
local oldtag = handle:read("*a")
handle:close()
newsubtag = string.sub(oldtag, 4)
newmajortag = string.sub(oldtag, 0, 3)
if (options["target"] == "tag") then
    newsubtag = newsubtag + 1
end
packageversion = newmajortag .. math.floor(newsubtag)

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
