<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/insert/navTabId/Grade" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
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
                    <label>年级名称：</label>
                    <input type="hidden" name="status" id="status" value="1">
                    <input type="text" class="required"  name="Grade_name" id="Grade_name">
                </div>
                <div class="unit">
                    <label>年级介绍：</label>
                    <textarea name="Grade_intro" class="required" id="Grade_intro" cols="70" rows="10"></textarea>
                </div>
                <div class="unit">
                    <label>所属院校：</label>
                    <select name="College_id" id="College_id" class="required" onchange="loadSpecialty($('#Specialty_id'), this.value);">
                        <volist id="coll" name="college">
                            <option value="{$coll['id']}">{$coll['College_name']}</option>
                        </volist>
                    </select>
                </div>
                <div class="unit">
                    <label>所属专业：</label>
                    <select name="Specialty_id" id="Specialty_id" class="required">
                    </select>
                </div>
            </div>

            <div class="formBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
                    <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
                </ul>
            </div>
        </form>

    </div>
</div>

<script>
    loadSpecialty($('#Specialty_id'), $("#College_id").val());
</script>

