<div class="page">
    <div class="pageContent">

        <form method="post" action="?s=home/ChildOption/insert" class="pageForm" onsubmit="return validateCallback(this, dialogAjaxDone)" id="ChildOpt_form">
            <div class="pageFormContent" layoutH="58">

                <fieldset>
                    <legend>主选项</legend>
                    <div class="unit">
                        <label>选项标题：</label>
                        <select name="MainOption_id" id="MainOption_id" style="width: 10.05em" onchange="loadChildOptions(this.value);">
                            <volist name="mainOptions" id="opt">
                                <option value="{$opt.id}">{$opt.MainOption_name}</option>
                            </volist>
                        </select>
                        <input type="hidden" name="MainOption_sn" value="{$mainOptions[0].sn}">
                        <label>开始时间：</label>
                        <input type="text" name="Update_date" class="readonly textInput" readonly value="{$mainOptions[0].Update_date}">
                    </div>
                    <div class="unit">
                        <label>禁用时间：</label>
                        <input type="text" name="Disable_date" class="readonly textInput" readonly value="{$mainOptions[0].Disable_date}">
                        <label>文档数：</label>
                        <input type="text" name="Score_number" class="readonly textInput" readonly value="{$mainOptions[0].Score_number}">
                    </div>
                </fieldset>

                <fieldset>
                    <legend>子选项</legend>
                    <table class="list" style="width:100%;margin:0 auto">
                        <thead>
                            <tr>
                                <th>选项标题</th><th>开始时间</th><th>禁用时间</th><th>资料树</th><th>操作</th>
                            </tr>
                        </thead>
                        <tbody class="childOpt" style="text-align:center">
                            <tr>
                                <td><input type="text" name="childOption_name[]" class="required" style="width:98%;" title="标题"></td>
                                <td><input type="text" name="Update_date[]" class="date readonly required" readonly datefmt="yyyy" style="width:98%;"></td>
                                <td><input type="text" name="Disable_date[]" class="date readonly" readonly datefmt="yyyy" style="width:98%;"></td>
                                <td><input type="text" name="Score_number[]" style="width:98%;"></td>
                                <td style="text-align:center"><a href="javascript:" style="color:lightgray"><span>删除</span></a></td>
                            </tr>

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
    loadChildOptions({$mainOptions[0].id});
    function loadChildOptions(mid) {
        if (!mid)
            return;

        $.getJSON("?s=home/ChildOption/getByMainId",
                {
                    id: mid,
                    _: Math.random()
                },
        function(data) {
            $("tbody.childOpt").empty();
            if (data.success) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = data.list[i];
                    $("tbody.childOpt").append($("tr")
                            .append($("td")
                                    .append('<input value="' + opt.ChildOption_name + '" type="text" name="childOption_name[]" class="required" style="width:98%;" title="标题">')
                                    .append('<input value="' + opt.id + '" type="hidden" name="id[]">')
                                    .append('<input value="' + opt.sn + '" type="hidden" name="sn[]">')
                                    )
                            .append('<td><input value="' + opt.Update_date + '" type="text" name="Update_date[]" class="date readonly required" readonly datefmt="yyyy" style="width:98%;"></td>')
                            .append('<td><input value="' + opt.Disable_date + '" type="text" name="Disable_date[]" class="date readonly required" readonly datefmt="yyyy" style="width:98%;"></td>')
                            .append('<td><input value="' + opt.Score_number + '" type="text" name="Score_number[]" style="width:98%;"></td>')
                            .append('<td style="text-align:center"><a href="javascript:" style="color:lightgray"><span>删除</span></a></td>')
                            );
                }
                rebindForm("#ChildOpt_form");
            }
        });
    }

    function childOpt_add() {
        var $t = $('<tr><td><input type="text" name="childOption_name[]" class="required" style="width:98%;" title="标题"></td><td><input type="text" name="Update_date[]" class="date readonly required" readonly datefmt="yyyy" style="width:98%;"></td><td><input type="text" name="Disable_date[]" class="date readonly" readonly datefmt="yyyy" style="width:98%;"></td><td><input type="text" name="Score_number[]" style="width:98%;"></td><td style="text-align:center"><a href="javascript:" onclick="$(this).parent().parent().remove()"><span>删除</span></a></td></tr>');

        $(".childOpt").append($t);
        rebindForm("#ChildOpt_form");
    }
</script>