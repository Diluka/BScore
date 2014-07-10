<?php

namespace Home\Controller;

class RoleController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['Role_name']) && $_REQUEST['Role_name'] != '') {
            $map['Role_name'] = array('like', "%{$_POST['Role_name']}%");
        }
        parent::index($map);
    }

    function access() {
        $this->redirect("home/Access/edit");
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "角色列表";

        $map = array("id" => "编号", "Role_name" => "角色名称", "Role_remark" => "角色描述", "Role_status" => "角色状态");


        parent::export($title, $map);
    }

}

?>