<script type="text/javascript">
    if ('{$obj['id']}' == '') {
        $.pdialog.closeCurrent();
        alert('该记录已不存在');
        navTab.reloadFlag("Role");

    }
</script>
<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/update/navTabId/Role" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
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
                    <label>角色名称：</label>
                    <input type="hidden" name="id" id="id" value="{$obj['id']}">
                    <input type="text" class="required"  name="Role_name" id="Role_name" value="{$obj['Role_name']}">
                </div>
                <div class="unit">
                    <label>角色描述：</label>
                    <textarea name="Role_remark" class="required" id="Role_remark" cols="70" rows="10">{$obj['Role_remark']}</textarea>
                </div>
                <div class="unit">
                    <label>角色状态：</label>
                    <input type="radio" <if condition="$obj['Role_status'] eq 1">checked=checked</if> name="Role_status" id="Role_status" value="1">启用
                    <input type="radio" <if condition="$obj['Role_status'] eq 0">checked=checked</if> name="Role_status" id="Role_status" value="0">禁用
                </div>
            </div>

            <div class="formBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">编辑</button></div></div></li>
                    <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
                </ul>
            </div>
        </form>

    </div>
</div>

