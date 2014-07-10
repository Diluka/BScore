<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Controller;

/**
 * Description of AccessController
 *
 * @author Diluka
 */
class AccessController extends BaseController {

    public function index() {
        $this->display($templateFile, "utf-8", "html", "没有内容");
    }

    public function edit() {
        $this->assign('role', M("Role")->where(array("Role_status" => 1))->select());
        $tree = M('node')->where(array("node_status" => 1, "node_level" => 1))->select();
        foreach ($tree as &$node) {
            $node["children"] = M('node')->where(array("node_status" => 1, "node_pid" => $node["id"]))->select();
            foreach ($node["children"] as &$node2) {
                $node2["children"] = M('node')->where(array("node_status" => 1, "node_pid" => $node2["id"]))->select();
            }
        }

        $this->assign("node", $tree);
        $this->display();
    }

    public function getAccessByRoleId($Role_id) {
        if ($Role_id) {
            $access = M("Access")->where(array("Role_id" => $Role_id))->select();
        }
        $data["success"] = isset($access);
        $data["list"] = $access;

        $this->ajaxReturn($data, "json");
    }

    public function insert($Role_id, $node_access = []) {
        $access = M("Access");
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

}
