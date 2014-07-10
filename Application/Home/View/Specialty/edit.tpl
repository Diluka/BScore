<script type="text/javascript">
    if ('{$obj['id']}' == '') {
        $.pdialog.closeCurrent();
        alert('该记录已不存在');
        navTab.reloadFlag("College");

    }
</script>
<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/update/navTabId/Specialty" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
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
                    <label>单位名称：</label>
                    <input type="hidden" name="id" id="id" value="{$obj['id']}">
                    <input type="text" class="required"  name="Specialty_name" id="Specialty_name" value="{$obj['Specialty_name']}">
                </div>
                <div class="unit">
                    <label>单位介绍：</label>
                    <textarea name="Specialty_intro" class="required" id="Specialty_intro" cols="70" rows="10">{$obj['Specialty_intro']}</textarea>
                </div>
                <div class="unit">
                    <label>所属学院：</label>
                    <select name="College_id" id="College_id" class="required">
                        <volist id="coll" name="array">
                            <option <if condition="$obj['College_id'] eq $coll['id']">selected=selected</if> value="{$coll['id']}">{$coll['College_name']}</option>
                        </volist>
                    </select>
                </div>
                <div class="unit">
                    <label>单位状态：</label>
                    <input type="radio" <if condition="$obj['status'] eq 1">checked=checked</if> name="status" id="status" value="1">启用
                    <input type="radio" <if condition="$obj['status'] eq 0">checked=checked</if> name="status" id="status" value="0">禁用
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

