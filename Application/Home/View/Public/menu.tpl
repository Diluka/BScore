<div class="accordion" fillSpace="sideBar">
    <div class="accordionHeader">
        <h2><span>Folder</span>应用</h2>
    </div>
    <div class="accordionContent">
        <ul class="tree treeFolder" id="main_menu">
            <volist id="item" name="menu" >
                <!-- <neq name="item['node_name']|strtolower" value="public" > -->
                <li><a>{$item['node_title']}</a>
                <notempty name="item['child']">
                    <ul>
                        <volist id="child" name="item['child']">
                            <li>
                                <a href="__APP__/home/{$child['node_name']}" target="navTab" rel="{$child['node_name']}"
                                   access="<volist id='m' name='child["child"]'>
                                   <literal>{</literal>
                                        node_id:'{$m["id"]}',
                                        node_name:'{$m["node_name"]}',
                                        granted:'{$m["has"]}'
                                    <literal>}</literal>,</volist>">{$child['node_title']}</a>
                        </li>
                        </volist>
                    </ul>
                </notempty>
                </li>
            </volist>
        </ul>
        <!--这个时候#main_menu并没有应用dwz样式，只是一个简单ul-->
        <script>
            $("#main_menu a").each(function() {
                if ($(this).attr("access") && $(this).attr("access") !== "") {
                    $(this).attr("access", "[" + $(this).attr("access").replace(/,$/, "]"));

                    var a = eval($(this).attr("access"));
                    var bool = false;
                    for (var i = 0; i < a.length; i++) {
                        if (a[i].granted !== "0") {
                            bool = true;
                            break;
                        }
                    }

                    if (!bool) {
                        $(this).parent().remove();
                    }

                    //alert(JSON.stringify(eval($(this).attr("access"))));
                }
            });
            $("#main_menu>li").each(function() { //遍历项目菜单
                if ($(this).find("ul li").length === 0) { //没有模块的项目将被remove
                    $(this).remove();
                }
            });
        </script>
    </div>
</div>
