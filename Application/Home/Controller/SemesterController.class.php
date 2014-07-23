<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Controller;

/**
 * Description of SemesterController
 *
 * @author Diluka
 */
class SemesterController extends BaseController {

    public function save($id = NULL, $Semester_name) {
        $model = M("Semester");
        $result = $model->save(array(
            "id" => $id,
            "Semester_name" => $Semester_name
        ));

        if ($result !== false) { //保存成功
            $this->success('保存成功!', cookie('_currentUrl_'));
        } else {
            //失败提示
            $this->error('服务器繁忙请稍后重试!');
        }
    }

}
