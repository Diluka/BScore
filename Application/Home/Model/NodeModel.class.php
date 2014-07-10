<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Home\Model;

use Think\Model\RelationModel;

/**
 * Description of nodeModel
 *
 * @author Diluka
 */
class NodeModel extends RelationModel {

    protected $_link = array(
        'PNode' => array(
            'mapping_type' => self:: BELONGS_TO,
            'class_name' => 'Node',
            'foreign_key' => 'node_pid',
            'parent_key' => 'node_pid',
            // 'mapping_fields' => 'node_title',
            'mapping_name' => 'pnode',
            'as_fields' => 'node_title:node_parent'
        )
    );

}
