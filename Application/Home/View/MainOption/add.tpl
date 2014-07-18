<script>
    function setType(obj) {
        var mtype = $(obj).find(":selected").attr("mtype");
        $('#Course_type').toArray()[0].selectedIndex = mtype - 1;
    }
</script>
<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/insert/navTabId/Course" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
            <div class="pageFormContent" layoutH="58">
            <div class="unit">
                <div class="unit mopt">
                    <label>主选项：</label>
                    <select name="Course_type" id="Course_type" readonly="readonly">
                        <option value="1">报告提交</option>
                        <option value="2">行为积分</option>
                    </select>
                    <input type="button" value="添加" class="mopt" onclick="$('div.mopt').toggle();$('input.copt').prop('disabled',true)" >
                </div>
                <div class="unit mopt" style="display:none;">
              		<label>主选项：</label>
                	<input type="text">
                	<input type="button" value="添加1" class="mopt"  onclick="$('div.mopt').toggle();$('input.copt').prop('disabled',false)" >
                </div>
                </div>
                <div class="unit">
                <div class="unit copt">
                    <label>子选项：</label>
                    <select name="Course_type" id="Course_type" readonly="readonly">
                        <option value="1">报告提交</option>
                        <option value="2">行为积分</option>
                    </select>
                    <input type="button" value="添加" class="copt" onclick="$('div.copt').toggle();$('input.mopt').prop('disabled',true)" >
                </div>
                <div class="unit copt" style="display:none;">
              		<label>子选项：</label>
                	<input type="text">
                	<input type="button" value="添加1" class="copt" onclick="$('div.copt').toggle();$('input.mopt').prop('disabled',false)" >
                </div>
                </div>
                <div class="unit">
                <select onchange="
                $('div.sem').hide();
                $('div.sem.'+this.value).show();
                ">
                <option value="s1">第一学年</option>
                <option value="s2">第二学年</option>
                </select>
                <div class="sem s1"><input type="checkbox">第一学期&nbsp;<input type="checkbox">第二学期</div>
                <div class="sem s2" style="display:none"><input type="checkbox">第一学期&nbsp;<input type="checkbox">第二学期</div>
                </div>
                <div class="unit">
                <table>
                <thead>
                <tr>
                <th>文档名</th><th>文档类型</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                <td><input name="Attach_title"></td>
                <td><select name="type"></select></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                <td colspan="2"><button type="button" onclick="">添加文档</button></td>
                </tr>
                </tfoot>
                </table>
                </div>
                <div class="unit">
                	<label>时间</label>
                	<input type="text" name="testtime" id="testtime" class="date" datefmt="yyyy" >
                </div>
                <a href="javascript:void(0)" id="test">测试</a>
        </form>

    </div>
</div>
<script>
	$(function(){
		$("#addparent").click(function(){
			$(".blk").toggle();
			$(".hidden").toggle();
		});
		
	})
</script>