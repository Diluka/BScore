<literal>
    <script>
        function loadAccess(rid) {
            $.getJSON(
                    "?s=home/Access/getAccessByRoleId",
                    {
                        Role_id: rid,
                        _: Math.random()
                    },
            function(data) {
                $("#node_access .ckbox").removeClass("checked indeterminate unchecked").addClass("unchecked");

                if (data.success) {
                    for (var i = 0; i < data.list.length; i++) {
                        var a = data.list[i];
                        var s = a.node_id + "," + a.Access_level;
                        var $ckbox = $("#node_access .ckbox input[type='checkbox'][value='" + s + "']").parent(".ckbox");
                        if (!$ckbox.hasClass("checked")) { //没选才能点，不然就没了
                            $ckbox.click();
                        }
                    }
                }
            });
        }

        function saveAccess(rid) {
            $("#Access .formData").html('<input name="Role_id" id="Role_id_input" value="" class="required"/>');

            $("#Role_id_input").val(rid);
            $("#node_access .ckbox.checked input").each(function() {
                if ($(this).val() !== "on") {
                    $("#Access .formData").append("<input name='node_access[]' value='" + $(this).val() + "'/>");
                }
            });
            $("#Access .formData").append("<input name='_' value='" + Math.random() + "'/>");

            // alert($("#Access .formData").html());

            //alert($("#Access").serialize());
        }
    </script>
</literal>
<div class="pageContent">

    <div class="accordion" style="width: 49.5%;float: left;">
        <div class="accordionContent" style="height: 500px">
            <ul class="tree expand" id="Role_id">
                <li><a>所有角色</a>
                    <ul>
                        <volist name="role" id="r">
                            <li><a tname='role_id' tvalue="{$r['id']}" onclick="loadAccess({$r['id']});">{$r["Role_name"]}</a></li>
                        </volist>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="accordion" style="width: 49.5%;float: left;">
        <div  class="accordionContent" style="height: 500px">
            <ul class="tree expand treeCheck" id="node_access">
                <li><a>所有权限</a>
                <notempty name="node">
                    <ul>
                        <volist name="node" id="n1">
                            <li><a tname='node_access' tvalue="{$n1['id']},{$n1['node_level']}">{$n1["node_title"]}</a>
                            <notempty name="n1['children']">
                                <ul>
                                    <volist name="n1['children']" id="n2">
                                        <li><a tname='node_access' tvalue="{$n2['id']},{$n2['node_level']}">{$n2["node_title"]}</a>
                                        <notempty name="n2['children']">
                                            <ul>
                                                <volist name="n2['children']" id="n3">
                                                    <li><a tname='node_access' tvalue="{$n3['id']},{$n3['node_level']}">{$n3["node_title"]}</a></li>
                                                </volist>
                                            </ul>
                                        </notempty>
                                        </li>
                                    </volist>
                                </ul>
                            </notempty>
                            </li>
                        </volist>
                    </ul>
                </notempty>
                </li>
            </ul>
        </div>
    </div>

    <div class="formBar">
        <form action="?s=home/Access/insert" method="post" id="Access" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
            <div style="display: none" class="formData">
                <input name="Role_id" id="Role_id_input" type="hidden" value="" class="required"/>
            </div>
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="saveAccess($('#Role_id .selected a').attr('tvalue'))">保存</button></div></div></li>
                <li><div class="button"><div class="buttonContent"><button type="button" onclick="loadAccess($('#Role_id .selected a').attr('tvalue'));">重置</button></div></div></li>
            </ul>
        </form>
    </div>

</div>