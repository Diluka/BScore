<?php

return array(
    'URL_MODEL' => 3, // 如果你的环境不支持PATHINFO 请设置为3
    'DB_TYPE' => 'sqlsrv',
    'DB_HOST' => '127.0.0.1\\SQLEXPRESS',
    'DB_NAME' => 'BScore',
    //'DB_USER' => 'sa',
    //'DB_PWD' => '111',
    //'DB_PORT' => '1433',
    'DB_PREFIX' => 'Bscore_',
    'SHOW_PAGE_TRACE' => true,
    'VAR_PAGE' => 'pageNum',
    'PAGE_LISTROWS' => 10, //分页 每页显示多少条
    'PAGE_NUM_SHOWN' => 10, //分页 页标数字多少个
    'TMPL_TEMPLATE_SUFFIX' => '.tpl'
);
