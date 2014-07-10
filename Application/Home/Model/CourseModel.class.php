<?php

namespace Home\Model;

use Think\Model\RelationModel;

class CourseModel extends RelationModel {

    protected $_link = array(
        'Module' => array(
            'mapping_type' => self::BELONGS_TO,
            'foreign_key' => 'Module_id',
            'mapping_name' => 'module',
            'as_fields' => 'Module_name'
        )
    );

}

?>