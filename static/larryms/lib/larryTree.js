layui.define(["jquery"], function (r) {
    "use strict";
    var c = layui.$, i = layui.hint();
    var n = function (r) {
        this.options = r;
        this.data = "larryms"
    }, a = "larry-tree-enter";
    var l = {
        arrow: ["larry-icon-up", "larry-icon-up1"],
        checkbox: ["larry-fuxuankuang", "larry-fuxuankuang1"],
        radio: ["larry-radio", "larry-danxuankuangxuanzhong-copy"],
        branch: [],
        leaf: []
    };
    n.prototype.init = function (r) {
        var a = this;
        r.addClass("larry-box larry-tree");
        if (a.options.skin) {
            r.addClass("larry-tree-skin-" + a.options.skin)
        }
        a.tree(r)
    };
    n.prototype.handling = function (r) {
        var n = this;
        if (r !== undefined && typeof r === "string") {
            c.ajax({
                type: "POST", url: r, async: false, dataType: "json", success: function (r, a, e) {
                    n.data = r
                }, error: function (r, a, e) {
                    i.error("数据源读取出错")
                }
            })
        } else if (r !== undefined && typeof r === "object") {
            n.data = r
        } else {
            return "error"
        }
    };
    n.prototype.tree = function (i, r) {
        var a = this, t = a.options, e = r || t.url || t.data;
        if (a.handling(e) !== "error") {
            var n = a.data
        }
        var o = c([function () {
            return t.top ? '<li class="larry-this" data-top="top">' + t.top + "</li>" : ""
        }()].join(""));
        i.append(o);
        layui.each(n, function (r, a) {
            var e = a.children && a.children.length > 0;
            var n = c(["<li " + (a.spread ? 'data-spread="' + a.spread + '"' : "") + ">", function () {
                return e ? '<i class="larry-icon ' + (a.spread ? l.arrow[1] : l.arrow[0]) + ' larry-tree-spread"></i>' : "|--"
            }(), function () {
                return t.check ? '<i class="larry-icon ' + (t.check === "checkbox" ? l.checkbox[0] : t.check === "radio" ? l.radio[0] : "") + ' larry-tree-check"></i>' : ""
            }(), function () {
                return "" + '<i class="larry-icon ' + a.icon + '"></i>' + ("<cite>" + (a.title || "未命名") + "</cite>")
            }(), "</li>"].join(""));
            console.log(a);
            i.append(n)
        })
    };
    r("larryTree", function (r) {
        var a = new n(r = r || {}), e = c(r.elem);
        if (!e[0]) {
            return i.error("larryTree 没有找到" + r.elem + "元素")
        }
        a.init(e)
    })
});