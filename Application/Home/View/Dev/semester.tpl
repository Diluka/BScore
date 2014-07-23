<div class="page">
    <div class="pageContent">
        <div class="pageFormContent" layoutH="58">
            <div class='unit'>
                <table id="dev_semester" class="list" width="100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>学期</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody class="dev_semesters">
                    <volist name="semesters" id="s">
                        <tr>
                            <td>{$s.id}<input type="hidden" value="{$s.id}" name="id"></td>
                            <td><input type="text" value="{$s.Semester_name}" name="Semester_name"></td>
                            <td><button type="button" onclick="dev_semester_save(this)">保存</button><button type="button" onclick="dev_semester_del(this)">删除</button></td>
                        </tr>
                    </volist>
                    </tbody>
                    <tfoot>
                        <tr><td colspan="3"><button onclick="dev_semester_add()">添加新学期</button></td></tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    function dev_semester_add() {
        $("tbody.dev_semesters").append('<tr><td>自动生成</td><td><input type="text" name="Semester_name"></td><td><button type="button" onclick="dev_semester_save(this)">保存</button><button type="button" onclick="$(this).parent().parent().remove()">删除</button></td></tr>');
    }

    function dev_semester_save(obj) {
        var $tr = $(obj).parent().parent();
        if ($tr.find("input[name='id']").length === 0) {
            $.post("?s=home/Semester/insert",
                    {
                        Semester_name: $tr.find("input[name='Semester_name']").val(),
                        _: Math.random()
                    },
            function(data) {
                DWZ.msg("提示", data.message);
            });
        } else {
            $.post("?s=home/Semester/update",
                    {
                        id: $tr.find("input[name='id']").val(),
                        Semester_name: $tr.find("input[name='Semester_name']").val(),
                        _: Math.random()
                    },
            function(data) {
                DWZ.msg("提示", data.message);
            });
        }
    }

    function dev_semester_del(obj) {
        var $tr = $(obj).parent().parent();
        $.post("?s=home/Semester/foreverdelete",
                {
                    id: $tr.find("input[name='id']").val(),
                    _: Math.random()
                },
        function(data) {
            DWZ.msg("提示", data.message);
        });
        $tr.remove();
    }
</script>