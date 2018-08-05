<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    // 定义资源路由
    '__rest__'=>[
        // menu
        'menu'      =>  'admin/menu',
        'position'  =>  'admin/position',
        'department'=>  'admin/department',
        'user'      =>  'admin/adminUser',
        'rule'      =>  'admin/rule',
    ],
    '[base]'      => [
        'index'   => ['admin/base/index', ['method' => 'get']],
        'login'   => ['admin/base/login', ['method' => 'post']],
    ],
    '[comm]'      => [
        'logout'  => ['admin/comm/logout', ['method' => 'post']],
    ],
    '[files]'     => [
        'index'   => ['admin/files/index', ['method' => 'post']],
    ],
    'user/enable'       => ['admin/adminUser/enable', ['method' => 'post']],
    'user/changePass'   => ['admin/adminUser/changePass', ['method' => 'post']],
    'user/setUserInfo'  => ['admin/adminUser/setUserInfo', ['method' => 'post']],
    'rule/enable'       => ['admin/rule/enable', ['method' => 'post']],
    'position/enable'   => ['admin/position/enable', ['method' => 'post']],
    'department/enable' => ['admin/department/enable', ['method' => 'post']],
    'menu/enable'       => ['admin/menu/enable', ['method' => 'post']],
    // MISS路由
    '__miss__'    => 'admin/base/index',
];
