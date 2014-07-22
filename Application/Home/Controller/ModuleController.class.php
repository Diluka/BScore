<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Controller;

/**
 * Description of ModuleController
 *
 * @author Diluka
 */
class ModuleController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['Module_name']) && $_REQUEST['Module_name'] != '') {
            $map['Module_name'] = array('like', "%{$_POST['Module_name']}%");
        }
        parent::index($map);
    }

    public function getByType($type) {
        if ($type) {
            $module = M('Module')->where(array("Module_type" => $type))->select();
        } else {
            $module = M('Module')->select();
        }
        $data["success"] = isset($module);
        $data["list"] = $module;

        $this->ajaxReturn($data, "json");
    }

    public function export() {

        //标题  中文标题  字段名

        $title = "模块列表";

        $map = array("id" => "编号",
            "Module_type" => "模块类型",
            "Module_name" => "模块名称",
            "Module_intro" => "模块简介",
        );


        parent::export($title, $map);
    }

}
