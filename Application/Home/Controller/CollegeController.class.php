<?php

namespace Home\Controller;

class CollegeController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['College_name']) && $_REQUEST['College_name'] != '') {
            $map['College_name'] = array('like', "%{$_POST['College_name']}%");
        }
        parent::index($map);
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "学院列表";

        $map = array("id" => "编号", "College_name" => "学院名称", "College_intro" => "学院简介", "status" => "学院状态");


        parent::export($title, $map);
    }

}

?>