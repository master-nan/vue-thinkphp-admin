<?php

namespace app\admin\controller;

class AdminUser extends Comm
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('AdminUser');
    }

    public function index()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $arr = [];
        if (isset($this->param['data'])) {
            $data = json_decode($this->param['data'], true);
            foreach ($data as $key => $value) {
                if ($value != '' || $value != null) {
                    $arr['u.'.$key] = $value;
                }
            }
        }
        $ret = $this->model->getUsers($arr);
        // if ($ret) {
        return msg(200, $ret);
        // } else {
        //     return msg(100, null, $this->model->getError());
        // }
    }

    public function read()
    {
        $id = $this->param['id'];
        $ret = $this->model->getUserById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function save()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        if ($this->param['password']) {
            $this->param['password'] = md5($this->param['password'].$this->param['username']);
        } else {
            unset($this->param['password']);
        }
        if ($this->param['status'] == 'true') {
            $this->param['status'] = 1;
        } else {
            $this->param['status'] = 0;
        }
        $ret = $this->model->saveUser($this->param);
        if ($ret) {
            return msg(200, null, '添加成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function update()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        if (isset($this->param['id'])) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        if (isset($this->param['password'])) {
            $this->param['password'] = md5($this->param['password'].$this->param['username']);
        } else {
            unset($this->param['password']);
        }
        if ($this->param['status'] == 'true') {
            $this->param['status'] = 1;
        } else {
            $this->param['status'] = 0;
        }
        $ret = $this->model->updateUser($id, $this->param);
        if ($ret) {
            return msg(200, null, '更新成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function delete()
    {
        return msg(100, null, '暂无删除功能');
    }

    public function setUserInfo()
    {
        $data = [];
        if (isset($this->param['data'])) {
            $data = json_decode($this->param['data'], true);

            foreach ($data as $key => $value) {
                if ($value == '' || $value == null) {
                    unset($data[$key]);
                }
            }
        }
        $ret = $this->model->updateUser($this->user['id'], $data, false);
        if ($ret) {
            return msg(200, null, '更新成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function changePass()
    {
        if (!isset($this->param['oldPass']) || !isset($this->param['newPass'])) {
            return msg(100, null, '请填写内容');
        }
        $oldPass = md5($this->param['oldPass'].$this->user['username']);
        $newPass = md5($this->param['newPass'].$this->user['username']);
        $data = [
          'username' => $this->user['username'],
          'password' => $oldPass
        ];
        $ret = $this->model->getUserLogin($data);
        if (!$ret) {
            return msg(100, null, '旧密码错误');
        }
        $ret = $this->model->updateUser($this->user['id'], ['password'=>$newPass], false);
        if ($ret) {
            return msg(200, null, '更新成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function enable()
    {
        if (isset($this->param['id'])) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        if ($id == 1) {
            return msg(100, null, '无法操作管理员账号');
        }
        $ret = $this->model->updateUser($id, $this->param, false);
        if ($ret) {
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
}
