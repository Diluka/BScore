<?php

namespace Home\Controller;

class ClassController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['Class_name']) && $_REQUEST['Class_name'] != '') {
            $map['Class_name'] = array('like', "%{$_POST['Class_name']}%");
        }
        $this->assign("colleges", M("College")->where(array("status" => 1))->select());
        parent::index($map);
    }

    public function add() {
        $this->assign("college", M("College")->where(array("status" => 1))->select());
        //$this->assign("specialty", M("Specialty")->where(array("status" => 1))->select());
        parent::add();
    }

    public function edit() {
        $this->assign("college", M("College")->where(array("status" => 1))->select());
        //$this->assign("specialty", M("Specialty")->where(array("status" => 1))->select());
        parent::edit();
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "班级列表";

        $map = array(
            "id" => "编号",
            "Class_name" => "班级名称",
            "Class_intro" => "班级简介",
            "Grade_name" => "所属年级",
            "Specialty_name" => "所属单位",
            "College_name" => "所属学院",
            "status" => "班级状态"
        );


        parent::export($title, $map);
    }

}

?>