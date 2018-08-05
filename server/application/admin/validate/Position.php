<?php
namespace app\admin\validate;

use think\Validate;

class Position extends Validate
{
    protected $rule = [
        'name' => 'require'
    ];

    protected $message  =   [
        'name.require' => '岗位名称不能为空',
    ];

    protected $scene = [

    ];
}
