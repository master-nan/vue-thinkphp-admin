<?php

namespace app\admin\controller;

class Department extends Comm
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Department');
    }

    public function index()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $status = isset($this->param['status']) ? $this->param['status'] : null;
        $data = [];
        if ($status) {
            $data['status'] = $status;
        }
        $ret = $this->model->getDepartments($data);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function read()
    {
        $id = $this->param['id'];
        $ret = $this->model->getDepartmentById($id);
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
        if ($this->param['status'] == 'true') {
            $this->param['status'] = 1;
        } else {
            $this->param['status'] = 0;
        }
        $ret = $this->model->saveDepartment($this->param);
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
        if ($this->param['id']) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        if ($this->param['status'] == 'true') {
            $this->param['status'] = 1;
        } else {
            $this->param['status'] = 0;
        }
        $ret = $this->model->updateDepartment($id, $this->param);
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

    public function enable()
    {
        if (isset($this->param['id'])) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        $ret = $this->model->updateDepartment($id, $this->param, false);
        if ($ret) {
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
}
