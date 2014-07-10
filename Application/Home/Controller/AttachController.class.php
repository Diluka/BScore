<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Controller;

/**
 * Description of AttachController
 *
 * @author Diluka
 */
class AttachController extends BaseController {

    public function getByCourseId($cid) {
        if ($cid) {
            $attach = M('Attach')->where(array("Course_id" => $cid))->select();
        }

        $data["success"] = isset($attach);
        $data["list"] = $attach;

        $this->ajaxReturn($data, "json");
    }

}
