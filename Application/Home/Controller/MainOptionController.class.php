<?php

namespace Home\Controller;

class MainOptionController extends BaseController {

    public function index() {
        $map = array();
        if (isset($_REQUEST['College_name']) && $_REQUEST['College_name'] != '') {
            $map['College_name'] = array('like', "%{$_POST['College_name']}%");
        }
        parent::index($map);
    }
    
}

?>