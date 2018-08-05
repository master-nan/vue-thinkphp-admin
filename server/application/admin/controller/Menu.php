<?php
namespace app\admin\controller;

class Menu extends Comm
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Menu');
    }

    public function index()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $ret = $this->model->getMenus();
        $ret = getTree($ret);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function read()
    {
        $id = $this->param['id'];
        $ret = $this->model->getMenuById($id);
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
        if (!$this->param['redirect']) {
            $this->param['redirect'] = 'noredirect';
        }
        if ($this->param['show'] == 'true') {
            $this->param['show'] = 1;
        } else {
            $this->param['show'] = 0;
        }
        if ($this->param['hidden'] == 'true') {
            $this->param['hidden'] = 1;
        } else {
            $this->param['hidden'] = 0;
        }
        $ret = $this->model->saveMenu($this->param);
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
        if (!$this->param['redirect']) {
            $this->param['redirect'] = 'noredirect';
        }
        if ($this->param['id']) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        if ($this->param['show'] == 'true') {
            $this->param['show'] = 1;
        } else {
            $this->param['show'] = 0;
        }
        if ($this->param['hidden'] == 'true') {
            $this->param['hidden'] = 1;
        } else {
            $this->param['hidden'] = 0;
        }
        $ret = $this->model->updateMenu($id, $this->param);
        if ($ret) {
            return msg(200, null, '添加成功');
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
        $ret = $this->model->updateMenu($id, $this->param, false);
        if ($ret) {
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
}
