<?php

namespace Home\Controller;

class SpecialtyController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['Specialty_name']) && $_REQUEST['Specialty_name'] != '') {
            $map['Specialty_name'] = array('like', "%{$_POST['Specialty_name']}%");
        }
        parent::index($map);
    }

    public function add() {
        $array = M("College")->where(array("status" => 1))->select();
        $this->assign("array", $array);
        $this->display();
    }

    public function edit() {
        $array = M("College")->where(array("status" => 1))->select();
        $this->assign("array", $array);
        parent::edit();
    }

    public function getByCollegeId($id) {
        if ($id) {
            $specialty = M("Specialty")->where(array("status" => 1, "College_id" => $id))->select();
            $data["success"] = isset($specialty);
            $data["list"] = $specialty;
        } else {
            $data["success"] = FALSE;
        }

        $this->ajaxReturn($data, "json");
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "单位列表";

        $map = array("id" => "编号", "Specialty_name" => "单位名称", "Specialty_intro" => "单位简介", "College_name" => "所属学院", "status" => "单位状态");


        parent::export($title, $map);
    }

}

?>