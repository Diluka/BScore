<form id="pagerForm" action="__URL__" method="post">
    <input type="hidden" name="pageNum" value="{$_REQUEST['pageNum']|default=1}"/>
    <input type="hidden" name="numPerPage" value="{$numPerPage}"/>
    <input type="hidden" name="_order" value="{$_REQUEST['_order']}"/>
    <input type="hidden" name="_sort" value="{$_REQUEST['_sort']|default='1'}"/>
    <input type="hidden" name="listRows" value="{$_REQUEST['listRows']}"/>
    <volist name="map" id="m">
        <input type="hidden" name="{$key}" value="{$_REQUEST[$key]}"/>
    </volist>
</form>


<div class="page">
    <div class="pageHeader">
        <form onsubmit="return navTabSearch(this);" action="__URL__" method="post">
            <div class="searchBar">
                <ul class="searchContent">
                    <li>
                        <label>分类：</label>
                        <select name="Module_type" id="Module_type_mi">
                            <option value="">全部</option>
                            <option value="1" <if condition="$_REQUEST.Module_type eq 1">selected</if>>必修模块</option>
                            <option value="2" <if condition="$_REQUEST.Module_type eq 2">selected</if>>选修模块</option>
                        </select>
                    </li>
                    <li>
                        <label>模块名称：</label>
                        <input type="text" name="Module_name" value="{$_REQUEST.Module_name}" class="medium" >
                    </li>
                </ul>
                <div class="subBar">
                    <ul>
                        <li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
                    </ul>
                </div>
            </div>
        </form>
    </div>

    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li><a class="add" href="__URL__/add" target="dialog" mask="true" width="700" height="400"><span>新增</span></a></li>
                <li><a class="delete" href="__URL__/foreverdelete/id/{sid_node}/navTabId/Module" target="ajaxTodo"  title="你确定要删除吗？" warn="请选择节点"><span>删除</span></a></li>
                <li><a class="edit" href="__URL__/edit/id/{sid_node}" target="dialog" mask="true" warn="请选择节点" width="700" height="400"><span>修改</span></a></li>
                <li><a href="__URL__/export" class="delete"><span>导出EXCEL</span></a></li>
            </ul>
        </div>
        <table class="list" width="100%" layoutH="116">
            <thead>
                <tr>
                    <th style="text-align: center;" width="60">编号</th>
                    <th style="text-align: center;" width="100">分类</th>
                    <th style="text-align: center;" width="100">模块名称</th>
                    <th style="text-align: center;" width="100">模块简介</th>
                </tr>
            </thead>
            <tbody>
            <volist id="vo" name="list">
                <tr target="sid_node" rel="{$vo['id']}">
                    <td style="text-align: center;">{$vo['id']}</td>
                    <td style="text-align: center;" >{$vo['Module_type']|getModuleType}模块</td>
                    <td style="text-align: center;" >{$vo['Module_name']}</td>
                    <td style="text-align: center;" >{$vo['Module_intro']}</td>
                </tr>
            </volist>



            </tbody>
        </table>
        <div class="panelBar">
            <div class="pages">
                <span>显示</span>
                <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
                    <option value="5" <eq name="numPerPage" value="5">selected=selected</eq>>5</option>
                    <option value="10" <eq name="numPerPage" value="10">selected=selected</eq>>10</option>
                    <option value="15" <eq name="numPerPage" value="15">selected=selected</eq>>15</option>
                    <option value="20" <eq name="numPerPage" value="20">selected=selected</eq>>20</option>
                </select>
                <span>共{$totalCount}条</span>

            </div>
            <div class="pagination" targetType="navTab" totalCount="{$totalCount}" numPerPage="{$numPerPage}" pageNumShown="10" currentPage="{$currentPage}"></div>
        </div>
    </div>
</div>