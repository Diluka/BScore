<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/insert/navTabId/Course" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
            <div class="pageFormContent" layoutH="58">
                <div class="unit">
                    <label>分类：</label>
                    <select name="Course_type" id="Course_type" readonly="readonly">
                        <option value="1">{:getModuleType(1)}</option>
                        <option value="2">{:getModuleType(2)}</option>
                    </select>
                </div>
                <div class="unit">
                    <label>模块：</label>
                    <select name="Module_id" id='Module_id' onchange="setType(this);">
                        <volist name="module" id="m">
                            <option value="{$m['id']}" mtype="{$m['Module_type']}">{$m['Module_name']}</option>
                        </volist>
                    </select>
                </div>
                <div class="unit">
                    <label>项目：</label>
                    <input type="text" class="required"  name="Course_name" id="Course_name">
                </div>
                <div class="unit">
                    <label>学分：</label>
                    <input type="text" class="required"  name="Course_credit" id="Course_credit">
                </div>
                <div class="unit">
                    <label>简介：</label>
                    <textarea name="Course_remark" class="required" id="Course_remark" cols="70" rows="10"></textarea>
                </div>
            </div>
			<input type="hidden" value="" name="Update_date" id="Update_date"/>
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
    $("#Course_type").change(function() {
        loadModule($("#Module_id"),$("#Course_type").val());
    });
    $("form").submit(function(){
    	var time = new Date();
    	var	val = time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate();
    	$("#Update_data").val(val);
    });
</script>
