<literal>
    <script>
        function getTree(lvl) {
            $.getJSON(
                    "?s=home/node/getTree",
                    {
                        lvl: lvl,
                        _: Math.random()
                    },
            function(data) {
                if (data.success) {
                    $("#node_pid").empty().prop("disabled", false);
                    if (lvl == 1) {
                        for (var i = 0; i < data.list.length; i++) {
                            var n = data.list[i];
                            $("#node_pid").append("<option value='" + n.id + "'>" + n.node_title + "</option>");
                        }
                    } else if (lvl == 2) {
                        for (var i = 0; i < data.list.length; i++) {
                            var node = data.list[i];
                            $("#node_pid").append($("<optgroup label='" + node.node_title + "'></optgroup>").append(function() {
                                var s = "";
                                for (var i = 0; i < node.children.length; i++) {
                                    var n = node.children[i];
                                    s += "<option value='" + n.id + "'>" + n.node_title + "</option>";
                                }
                                return s;
                            }));
                        }
                    } else {
                        $("#node_pid").append("<option value='0'>根节点</option>").prop("disabled", true);
                    }

                }
            }
            );
        }

        function setPid() {
            $("#node_pid").prop("disabled", false);
        }
    </script>
</literal>
<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/insert/navTabId/Node" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
            <div class="pageFormContent" layoutH="58">
                <!-- 	<div class="unit">
                        <label>请选择分类：</label>
                        <select name="class_id" id="test" class="required combox">
                                <option value="">请选择</option>
                                <volist name="cate" id="vocate">
                                        <option value="{$key}">{$vocate}</option>
                                </volist>
                        </select>
                </div> -->
                <div class="unit">
                    <label>英文名称：</label>
                    <input type="hidden" name="node_status" id="node_status" value="1">
                    <input type="text" class="required"  name="node_name" id="node_name">
                </div>
                <div class="unit">
                    <label>显示中文名称：</label>
                    <input type="text" class="required"  name="node_title" id="node_title">
                </div>
                <div class="unit">
                    <label>权限状态：</label>
                    <input type="radio" checked='checked' name="node_status" id="node_status" value="1">启用
                    <input type="radio" name="node_status" id="node_status" value="0">禁用
                </div>
                <div class="unit">
                    <label>类型：</label>
                    <select name="node_level" id="node_level" onchange="getTree(this.value - 1)">
                        <option value="1">项目</option>
                        <option value="2">模块</option>
                        <option value="3">操作</option>
                    </select>
                </div>
                <div class="unit">
                    <label>父节点：</label>
                    <select name="node_pid" id="node_pid" disabled="disabled">
                        <option value='0'>根节点</option>
                    </select>
                </div>
                <div class="unit">
                    <label>排序：</label>
                    <input type="text" class="required"  name="node_sort" id="node_sort">
                </div>
            </div>

            <div class="formBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="setPid()">保存</button></div></div></li>
                    <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
                </ul>
            </div>
        </form>

    </div>
</div>
