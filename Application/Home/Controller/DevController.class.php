<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Controller;

/**
 * Description of DevController
 *
 * @author Diluka
 */
class DevController extends BaseController {

    public function index() {
        parent::index(array());
    }

    public function course() {
        $this->assign("course", M('Course')->select());
        $this->display();
    }

    public function semester() {
        $this->assign("semesters", M('semester')->select());
        $this->display();
    }

}
