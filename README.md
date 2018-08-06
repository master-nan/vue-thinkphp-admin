<p algin="center">
  <h3>vue-thinkphp-admin</h3>
</p>


English | [简体中文](./README.zh-CN.md)

## Introduction
[vue-thinkphp-admin](https://github.com/master-nan/vue-thinkphp-admin) is a more targeted background authority management project based on [vue](https://github.com/vuejs/vue)+[thinkphp5.0](https://github.com/top-think/framework/tree/master)；The project ensures a close connection between front-end permissions and the back-end, when accessible routing for the front-end is provided by the back-end with an enhanced authority authentication for a more secure system.

- [Project Address](https://github.com/master-nan/vue-thinkphp-admin)
- [Online access]()

## Preparation
Mainly used in the project are [vue](https://cn.vuejs.org/index.html)、[vuex](https://vuex.vuejs.org/zh-cn/)、[vue-router](https://router.vuejs.org/zh-cn/)、[element-ui](https://github.com/ElemeFE/element) and [thinkphp5.0](https://github.com/top-think/framework/tree/master)，which are necessary for you to acquire if a secondary development is needed.

## Directory

Main Directory Structure and Document Introduction

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

## Instructions


## License

[MIT](./LICENSE)

Copyright (c) 2018-8 master-nan
