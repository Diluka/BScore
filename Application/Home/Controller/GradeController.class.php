<?php

namespace Home\Controller;

class GradeController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['Grade_name']) && $_REQUEST['Grade_name'] != '') {
            $map['Grade_name'] = array('like', "%{$_POST['Grade_name']}%");
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

    public function getBySpecialtyId($id) {
        if ($id) {
            $grade = M("Grade")->where(array("status" => 1, "Specialty_id" => $id))->select();
            $data["success"] = isset($grade);
            $data["list"] = $grade;
        } else {
            $data["success"] = FALSE;
        }

        $this->ajaxReturn($data, "json");
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "年级列表";

        $map = array(
            "id" => "编号",
            "Grade_name" => "年级名称",
            "Grade_intro" => "年级简介",
            "Specialty_name" => "所属单位",
            "College_name" => "所属学院",
            "status" => "年级状态"
        );


        parent::export($title, $map);
    }

}

?>