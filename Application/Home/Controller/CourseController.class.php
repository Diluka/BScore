<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Controller;

/**
 * Description of CourseController
 *
 * @author Diluka
 */
class CourseController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['Course_name']) && $_REQUEST['Course_name'] != '') {
            $map['Course_name'] = array('like', "%{$_POST['Course_name']}%");
        }
        $this->assign("module", M("Module")->select());
        parent::index($map);
    }

    public function add() {
        $this->assign("module", M("Module")->where(array("Module_type" => 1))->select());
        $this->display();
    }

    public function mainOpt() {
        $this->assign("mainOptions", M("MainOption")->where(array("Course_id" => $_REQUEST['id']))->select());
        $this->display();
    }

    public function childOpt() {
        $this->assign("mainOptions", M("MainOption")->where(array("Course_id" => $_REQUEST['id']))->select());
        $this->display();
    }

    public function info($id) {
        $this->display();
    }

}
