<?php

namespace app\admin\validate;

use think\Validate;

class AdminUser extends Validate
{
    protected $rule = [
        'username' => 'require',
        'password' => 'require|alphaNum',
        'p_id'     => 'require',
        'd_id'     => 'require',
        'nickname' => 'require',
    ];

    protected $message  =   [
        'nickname.require' => '请填写昵称',
        'username.require' => '请填写用户名',
        'password.require' => '请填写密码',
        'password.alphaNum' => '密码只能是数字和字母',
        'p_id.require' => '请选择部门',
        'd_id.require' => '请选择岗位',
    ];

    protected $scene = [
      'login'   =>  ['username','password'],
      'update'  =>  ['username','nickname','p_id','p_id'],
    ];
}
