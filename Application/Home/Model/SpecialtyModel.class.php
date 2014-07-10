<?php

namespace Home\Model;

use Think\Model\RelationModel;

class SpecialtyModel extends RelationModel {

    protected $_link = array(
        'College' => array(
            'mapping_type' => self::BELONGS_TO,
            'foreign_key' => 'College_id',
            'mapping_name' => 'college',
            'as_fields' => 'College_name'
        )
    );

}

?>