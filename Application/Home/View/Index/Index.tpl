<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
    <include file="Layout:layout" />
    <script type="text/javascript">
        function fleshVerify() {
            //重载验证码
            $('#verifyImg').attr("src", '__APP__/Public/verify/' + new Date().getTime());
        }
        function dialogAjaxMenu(json) {
            dialogAjaxDone(json);
            if (json.statusCode == DWZ.statusCode.ok) {
                $("#sidebar").loadUrl("__APP__/Public/menu");
            }
        }
        function navTabAjaxMenu(json) {
            navTabAjaxDone(json);
            if (json.statusCode == DWZ.statusCode.ok) {
                $("#sidebar").loadUrl("__APP__/Public/menu");
            }
        }

        function navTabAjaxGroupMenu(json) {
            navTabAjaxDone(json);
            if (json.statusCode == DWZ.statusCode.ok) {
                $("#sidebar").loadUrl("__APP__/Public/menu");
            }
        }

        $(function() {
            DWZ.init("__PUBLIC__/dwz/dwz.frag.xml", {
                loginUrl: "__APP__/Public/login_dialog", loginTitle: "登录", // 弹出登录对话框
//		loginUrl:"__APP__/Public/login",	//跳到登录页    面
                statusCode:{ok:1,error:0},
                pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"_order", orderDirection:"_sort"}, //【可选】
                debug: false, // 调试模式 【true|false】
                callback: function() {
                    initEnv(    );
                    $("#themeList").theme({themeBase:"__PUBLIC__/dwz/themes"});
                }
            });
        });
    </script>
</head>
<body scroll="no">
    <div id="layout">
        <div id="header">
            <div class="headerNav">
                <a class="logo" href="__APP__">Logo</a>
                <ul class="nav">
                    <li><a href="__APP__/Public/main" target="dialog" width="580" height="360" rel="sysInfo">系统消息</a></li>
                    <li><a href="__APP__/Public/password/" target="dialog" mask="true">修改密码</a></li>
                    <li><a href="__APP__/Public/profile/" target="dialog" mask="true">修改资料</a></li>
                    <li><a href="__APP__/Public/logout/">退出</a></li>
                </ul>
                <ul class="themeList" id="themeList">
                    <li theme="default"><div class="selected">蓝色</div></li>
                    <li theme="green"><div>绿色</div></li>
                    <li theme="purple"><div>紫色</div></li>
                    <li theme="silver"><div>银色</div></li>
                    <li theme="azure"><div>天蓝</div></li>
                </ul>
            </div>
        </div>
        <div id="leftside">
            <div id="sidebar_s">
                <div class="collapse">
                    <div class="toggleCollapse"><div></div></div>
                </div>
            </div>

            <div id="sidebar">
                <div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
                <include file="Public:menu" />
            </div>
        </div>
        <div id="container">
            <div id="navTab" class="tabsPage">
                <div class="tabsPageHeader">
                    <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                        <ul class="navTab-tab">
                            <li tabid="main" class="main"><a href="javascript:void(0)"><span><span class="home_icon">我的主页</span></span></a></li>
                        </ul>
                    </div>
                    <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                    <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                    <div class="tabsMore">more</div>
                </div>
                <ul class="tabsMoreList">
                    <li><a href="javascript:void(0)">我的主页</a></li>
                </ul>
                <div class="navTab-panel tabsPageContent layoutBox">
                    <div class="page unitBox">
                        <div class="accountInfo">
                            <div class="alertInfo">
                                <h2><a target="_blank" href="{$Think.config.bbsurl}/doc/dwz-user-guide.pdf">DWZ框架使用手册(PDF)</a></h2>
                                <a href="#" target="_blank">DWZ-thinkphp使用手册</a>
                            </div>
                            <div class="right">
                                <p>{$Think.now}</p>
                            </div>
                            <p><span>{$Think.config.sitename}</span></p>
                            <p>Welcome, {$Think.session.loginUserName}</p>
                        </div>
                        <div class="pageFormContent" layoutH="80">
                            <p>在线演示地址 {$Think.config.demourl}</p>
                            <p>DWZ框架使用手册 <a href="{$Think.config.demourl}/doc/dwz-user-guide.pdf" target="_blank">{$Think.config.demourl}/doc/dwz-user-guide.pdf</a></p>
                            <p>Ajax开发视频教材 <a href="{$Think.config.demourl}/doc/dwz-ajax-develop.swf" target="_blank">{$Think.config.demourl}/doc/dwz-ajax-develop.swf</a></p>
                            <p>DWZ框架演示视频 <a href="{$Think.config.demourl}/doc/dwz-user-guide.swf" target="_blank">{$Think.config.demourl}/doc/dwz-user-guide.swf</a></p>
                            <p>Google Code下载 <a href="http://code.google.com/p/dwz/" target="_blank">http://code.google.com/p/dwz/</a></p>

                            <div class="divider"></div>
                            <h2>dwz_thinkphp版本介绍:</h2>
                            <pre style="margin: 5px; line-height: 1.4em;">
当前版本dwz_thinkphp (DWZ框架v1.4.6 Final + ThinkPHP3.1.3)
发布dwz_thinkphp主要是为了方便PHP开发者使用DWZ富客户端UI框架。
其他开发人员也可以结合php后台去理解DWZ和服务器端的交互方式。

                            </pre>
                            <div class="divider"></div>
                            <h2>有偿服务请联系:</h2>
                            <p style="color:red">杜权	suport@j-ui.com</p>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div id="footer">Copyright &copy; 2010 <a href="http://www.j-ui.com" target="_blank">j-ui.com</a></div>
    </div>
</body>
</html>
