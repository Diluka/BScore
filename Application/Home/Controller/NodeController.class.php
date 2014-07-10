<?php

namespace Home\Controller;

class NodeController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['node_title']) && $_REQUEST['node_title'] != '') {
            $map['node_title'] = array('like', "%{$_POST['node_title']}%");
        }
        if (isset($_REQUEST['node_name']) && $_REQUEST['node_name'] != '') {
            $map['node_name'] = array('like', "%{$_POST['node_name']}%");
        }
        parent::index($map);
    }

    public function edit($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        $id = $_REQUEST ["id"];
        $obj = $model->getById($id);
        if ($obj["node_pid"] != "0") {
            $pn1 = $model->getById($obj["node_pid"]);
            $this->assign('pn1', $pn1);
            if ($pn1["node_pid"] != "0") {
                $pn2 = $model->getById($pn1["node_pid"]);
                $this->assign('pn2', $pn2);
            }
        }
        $this->assign('obj', $obj);
        $this->display();
    }

    public function insert($node_title, $node_pid = 0, $dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        $map["node_title"] = $node_title;
        $map["node_pid"] = $node_pid;

        $x = $model->where($map)->find();
        if (isset($x)) {
            $this->error("该权限已经被创建，请修改后重试");
            return;
        }

        parent::insert($dwz_db_name);
    }

    public function update($id, $node_title, $node_pid, $dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        $map["node_title"] = $node_title;
        $map["node_pid"] = $node_pid;
        $map["id"] = array("neq", $id);

        $x = $model->where($map)->find();
        if (isset($x)) {
            $this->error("该权限已经被创建，请修改后重试");
            return;
        }

        parent::update($dwz_db_name);
    }

    public function getTree($lvl) {
        $tree = M('node')->where(array("node_status" => 1, "node_level" => 1))->select();
        for ($i = 2; $i <= $lvl; $i++) {
            foreach ($tree as &$node) {
                $node["children"] = M('node')->where(array("node_status" => 1, "node_pid" => $node["id"]))->select();
            }
        }
        $data["success"] = isset($tree);
        $data["list"] = $tree;
        $this->ajaxReturn($data, "json");
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "权限列表";

        $map = array(
            "id" => "编号",
            "node_name" => "权限名称",
            "node_title" => "权限标题",
            "node_sort" => "排序",
            "node_level" => "级别",
            "node_pid" => "父节点编号",
            "node_parent" => "父节点",
            "node_status" => "权限状态");


        parent::export($title, $map);
    }

}

?>