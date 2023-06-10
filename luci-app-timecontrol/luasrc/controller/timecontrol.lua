module("luci.controller.timecontrol", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/timecontrol") then return end

    entry({"admin", "control"}, firstchild(), "Control", 44).dependent = false
    local page = entry({"admin", "control", "timecontrol"}, cbi("timecontrol"), _("Internet Time Control"))
	page.order = 10
	page.dependent = true
	page.acl_depends = { "luci-app-timecontrol" }
    entry({"admin", "control", "timecontrol", "status"}, call("status")).leaf = true
end

function status()
    local e = {}
    local FW4 = luci.sys.exec("$(command -v fw4)")
    if FW4 ~= nil then
        e.status = luci.sys.call("nft list table inet fw4 | grep TIMECONTROL >/dev/null") == 0
    else
        e.status = luci.sys.call("iptables -L FORWARD | grep TIMECONTROL >/dev/null") == 0
    end
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end