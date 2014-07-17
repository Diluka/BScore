<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller {

    public function index() {
        $menu = array();
        if (isset($_SESSION['menu' . $_SESSION[C('USER_AUTH_KEY')]])) {

            //如果已经缓存，直接读取缓存
            $menu = $_SESSION['menu' . $_SESSION[C('USER_AUTH_KEY')]];
        } else {
            //读取数据库模块列表生成菜单项
            $node = M("Node");
            //$where ['node_pid'] = 0;
            $menu = $node->where(array("node_status" => 1, "node_pid" => 0))->order('node_sort asc')->select();
            foreach ($menu as &$m1) {
                $m1['child'] = $node->where(array("node_status" => 1, "node_pid" => $m1['id']))->order('node_sort asc')->select();
                foreach ($m1['child'] as &$m2) {
                    $m2['child'] = $node->where(array("node_status" => 1, "node_pid" => $m2['id']))->order('node_sort asc')->select();
//                     foreach ($m2['child'] as &$m3) {
//                         $m3["has"] = M("Access")->where(array("Role_id" => 1, "node_id" => $m3['id']))->count();
//                     }
                }
            }
//            for ($i = 0; $i < count($menu); $i++) {
//                $where['node_pid'] = $menu[$i]["id"];
//                $child = $node->where($where)->order('node_sort asc')->select();
//                $menu[$i]['child'] = "null";
//                if ($child != "") {
//                    $menu[$i]['child'] = $child;
//                }
//            }
            $_SESSION['menu' . $_SESSION[C('USER_AUTH_KEY')]] = $menu;
            //dump($menu);
        }
        $this->assign('menu', $menu);
        $this->display();
    }

}
