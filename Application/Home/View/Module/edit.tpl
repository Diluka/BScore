<script type="text/javascript">
    if ('{$obj['id']}' == '') {
        $.pdialog.closeCurrent();
        alert('该记录已不存在');
        navTab.reloadFlag("Module");

    }
</script>
<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/update/navTabId/Module" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
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
                    <label>选择分类：</label>
                    <select name="Module_type" id="Module_type">
                        <option value="1" <if condition="$obj['Module_type'] eq 1">selected</if>>必修模块</option>
                        <option value="2" <if condition="$obj['Module_type'] eq 2">selected</if>>选修模块</option>
                    </select>
                </div>
                <div class="unit">
                    <label>模块名称：</label>
                    <input type="hidden" name="id" id="id" value="{$obj['id']}">
                    <input type="text" class="required"  name="Module_name" id="Module_name" value="{$obj['Module_name']}">
                </div>
                <div class="unit">
                    <label>模块介绍：</label>
                    <textarea name="Module_intro" class="required" id="Module_intro" cols="70" rows="10">{$obj['Module_intro']}</textarea>
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

