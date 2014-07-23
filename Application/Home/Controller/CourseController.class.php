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
        $this->assign("module", M("Module")->where(array("Module_type"=>1))->select());
        $this->display();
    }

    public function mainOpt(){
    	$mainOpt = M("MainOption")->where(array("Course_id"=>$_REQUEST['id']))->select();
		$this->display();
    }
    
    
    public function insert($Role_id, $node_access = []) {
    	$MainOption = M("MainOption");
    	$access->where(array("Role_id" => $Role_id))->delete();
    
    	$result = FALSE;
    	foreach ($node_access as $a) {
    		$ac = strtok($a, ",");
    		$result = $access->add(array("Role_id" => $Role_id, "node_id" => $ac, "Access_level" => strtok(",")));
    	}
    
    	if ($result || count($node_access) === 0) { //保存成功
    		$this->success('保存成功!');
    	} else {
    		//失败提示
    		$this->error('服务器繁忙请稍后重试!');
    		//$this->error($access->getError());
    	}
    }
    
    
    public function info($id) {
        $this->display();
    }

}
