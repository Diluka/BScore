<div class="page">
    <div class="pageContent">

        <form method="post" action="__URL__/insert/navTabId/Course" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
        	<div class="pageFormContent" layoutH="58">
            
            	<fieldset>
        	<legend>主选项</legend>
             <div class="unit">
        			<label>选项标题：</label>
					<input type="text" name="MainOption_name" class="readonly" readonly>
					<label>开始时间：</label>
					<input type="text" name="Update_date" class="readonly" readonly>
					<label>禁用时间：</label>
					<input type="text" name="Disable_date" class="readonly" readonly>
        			<label>文档数：</label>
        			<input type="text" name="Number" class="readonly" readonly>
        	</div>
</fieldset>
        	<fieldset>
        	<legend>子选项</legend>
             <table class="list" style="width:100%;margin:0 auto">
                 <thead>
                 	<tr>
                    	<th>选项标题</th><th>开始时间</th><th>禁用时间</th><th>操作</th>
                    </tr>
                 </thead>
                 <tbody class="childOpt" style="text-align:center">
                 <tr><td><input type="text" name="childOption_name" class="required" style="width:99%;"></td><td><input type="text" name="Update_date" class="date readonly required" readonly datefmt="yyyy" style="width:99%;"></td><td><input type="text" name="Display_date" class="date readonly" readonly datefmt="yyyy" style="width:99%;"></td><td style="text-align:center"><a href="javascript:" style="color:lightgray"><span>删除</span></a></td></tr>
                 </tbody>
                 <tfoot>
                 <tr><td colspan="4"><button type="button" onclick="childOpt_add()">添加子选项</button></td></tr>
                 </tfoot>
             </table>
             </fieldset>
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
var opts={
	pattern:"yyyy"
	};
	function childOpt_add(){
		var $t=$('<tr><td><input type="text" name="childOption_name" class="required" style="width:99%;"></td><td><input type="text" name="Update_date" class="date readonly required" readonly datefmt="yyyy" style="width:99%;"></td><td><input type="text" name="Display_date" class="date readonly" readonly datefmt="yyyy" style="width:99%;"></td><td style="text-align:center"><a href="javascript:" onclick="$(this).parent().parent().remove()"><span>删除</span></a></td></tr>');

		$t.find("input.date").each(function(){
			$(this).datepicker(opts);							
		});
		
		$(".childOpt").append($t);
	}
</script>
<!--
var $this = $(this);
            var opts = {};
            if ($this.attr("dateFmt")) opts.pattern = $this.attr("dateFmt");
            if ($this.attr("minDate")) opts.minDate = $this.attr("minDate");
            if ($this.attr("maxDate")) opts.maxDate = $this.attr("maxDate");
            if ($this.attr("mmStep")) opts.mmStep = $this.attr("mmStep");
            if ($this.attr("ssStep")) opts.ssStep = $this.attr("ssStep");
            $this.datepicker(opts);
-->