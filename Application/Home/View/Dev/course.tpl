<script>
    function getAttachByCourseId_dev(id) {
        if (!id) {
            return;
        }

        $.getJSON(
                "?s=home/Attach/getByCourseId",
                {
                    cid: id,
                    _: Math.random()
                },
        function(data) {
            if (data.success) {
                $("#dev_course_attach .list").empty();
                for (var i = 0; i < data.list.length; i++) {
                    var a = data.list[i];
                    $("#dev_course_attach .list").append("<tr><td>" + a.id + "</td><td>" + a.Attach_title + "</td><td></td><td><a onclick='attach_edit_dev(this)'>修改</a></td></tr>");
                }
            }
        }
        );
    }

    function attach_edit_dev(obj) {
        alert("未完成功能");
    }
</script>
<div class="page">
    <div class="pageContent">
        <div class="pageFormContent" layoutH="58">
            <div class="unit">
                <label>科目名称：</label>
                <select onchange="getAttachByCourseId_dev(this.value);">
                    <empty name="course">
                        <option>暂无</option>
                    </empty>
                    <volist name="course" id="c">
                        <option value="{$c['id']}">{$c['Course_name']}</option>
                    </volist>
                </select>
            </div>
            <div class='unit'>
                <table id="dev_course_attach" class="list" width="100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>是否为文件域？</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody class="list">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>