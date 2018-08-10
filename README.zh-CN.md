<p algin="center">
  <h3>vue-thinkphp-admin</h3>
</p>


简体中文 | [English](./README.md)

## 简介

[vue-thinkphp-admin](https://github.com/master-nan/vue-thinkphp-admin) 是针对动态路由权限设计的后端管理项目，是基于 [vue](https://github.com/vuejs/vue)+[thinkphp5.0](https://github.com/top-think/framework/tree/master)开发的；前端权限与后端紧密相连，后端为前端提供可访问的路由，同时后端也增加了权限验证进一步加强系统安全。

- [项目地址](https://github.com/master-nan/vue-thinkphp-admin)
- [在线地址](http://demo.walnutech.com)

全部权限账号：
`dev`   `111111`

部分权限账号：
`test`     `111111`  

## 准备

本项目使用了[vue](https://cn.vuejs.org/index.html)、[vuex](https://vuex.vuejs.org/zh-cn/)、[vue-router](https://router.vuejs.org/zh-cn/)、[element-ui](https://github.com/ElemeFE/element) 以及 [thinkphp5.0](https://github.com/top-think/framework/tree/master)，请自行掌握以上相关知识。

## 目录

主要目录结构和文件简介

```
  vue-tinkphp-admin
  |-client                  客户端
  |  |-build            
  |  |-config           
  |  |-src                   主体内容
  |  |  |-api                接口文件目录  
  |  |  |-assest             资源文件目录
  |  |  |-components
  |  |  |-filters            全局过滤文件目录
  |  |  |-router             路由文件目录
  |  |  |-store              全局状态管理目录
  |  |  |-utils              工具类目录
  |  |  |  |-components.js   所有路由component在此目录引入，配合后台权限使用
  |  |  |  |-http.js         引入axios，提供get/post/put方法，如需更多自行增加
  |  |  |  └─index.js        全局一些公共方法
  |  |  |-ivews              所有页面目录
  |  |  └─...    
  |  └─static    
  |-server                   服务的
  |  |-application           应用目录
  |  |  |-admin              模块目录
  |  |  |  |-controller      控制器目录
  |  |  |  |-model           模型目录
  |  |  |  |-validate        验证目录
  |  |  |  |-common.php      模块下的公共方法
  |  |  |  └─...            
  |  |  |─public             WEB目录（对外访问目录）
  |  |  |  |-uploads         上传目录          
  |  |  |  |─index.php       入口文件
  |  |  |  └─...
  |  |-sql                   数据库文件目录
  |  └─...
```

## 说明

本项目借鉴其他使用vue编写的前端项目的侧边栏，有部分改动，目前仅支持二级目录，如果需要更多层级请自行修改。目前大多数使用vue的前端项目仅仅提供前端路由控制，并没有与后端相结合；其他有些项目虽然与后端结合了，但是却没有动态生成路由，而是在前端将所有路由全部加载，后端仅告知前端 菜单是否显示隐藏，这样我觉得并不是真正的动态路由。

本项目在使用时前端只需将路由的component内容全部导入，然后用户在项目界面配置目录时选择前端导入的对应内容进行配置，配置完目录可以进行权限分配，并可以给不同用户指定不同权限;当用户登录时读取对应权限生产菜单交给前端，可以在router.js文件的钩子函数中去判断 然后增加显示菜单；项目相关的数据库文件在server/sql目录中，已经设计了表并添加了相关数据；本项目只是针对菜单权限，并没有添加过多的组件，如果你在开发中需要其它组件请自行添加。


## 功能

    - 登陆
    - 修改密码
    - 菜单增改
    - 岗位增改
    - 部门增改
    - 用户增改
    - 权限增改
    - 权限分配
    - 个人资料增改
    - 动态路由
    - 后端权限验证

## 注意

编译过程中`node-sass`报错，请使用淘宝镜像然后`npm install node-sass --save`；安装`chromedriver`报错，请使用`npm install chromedriver --chromedriver_cdnurl=http://cdn.npm.taobao.org/dist/chromedriver`。

服务端启动需要`runtime`目录权限，如报错请执行`chmod -R 777 runtime/`;上传功能需要`public`目录写入权限，如报错请执行`chmod -R 777 public/`;请进入`server`目录再执行前面两句话。

## 最后

在开发过程中也碰到部分坑，动态路由判断方面，登陆以后拿到路由先存本地缓存然后再加到状态管理，这样可以保证直接刷新页面时不会出现缺少路由的问题；同样也是动态路由，如果当前页面切换用户，由于vue对象没有销毁，先前加载的路由还存在，将会出现重复加载或者权限泄露的问题，目前的做法是退出时进行`location.reload()`操作。关于引入第三方icon，本项目加入了多色icon基于iconfont，在打包过程中发现引入本地js打包会出现eslint错误，最终还是在html里引入远程js地址解决的。

目前前端数据存储在`sessionStorage`中，需要其它方式请自行修改。

以上问题如有更好的方案可以提出，如果本项目发现bug请提出，我会第一时间进行修复。这个项目我自己也会在其他项目中使用，如有其他通用功能还会继续更新。

## 最后的最后

如果你喜欢这个项目，或者这个项目对你当前工作有所帮助，请给`star`谢谢!

## 许可证

[MIT](./LICENSE)

Copyright (c) 2018-8 master-nan
