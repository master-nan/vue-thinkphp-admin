<?php

namespace app\admin\controller;

class Files extends Comm
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Files');
    }

    public function index()
    {
        $path = sprintf('uploads/%s/', date('Ymd'));
        $file = request()->file('file');
        $type = isset($this->param['type']) ? $this->param['type'] : 'avatar';
        if (!$file) {
            return msg(100, null, '请选择上传文件');
        }
        $rule = [
          'size'=> 2*1024*1024,
        ];
        $f = $this->model->getFileByHash($file->hash());
        if ($f) {
            return msg(100, $f, '您上传的文件已存在');
        }
        $arr = pathinfo($file->getInfo('name'));
        $data = [
          'u_id' => $this->user['id'],
          'ext'  => $arr['extension'],
          'hash' => $file->hash(),
          'path' => $path,
          'create_at' => time(),
          'type' => $type
        ];
        $info = $file->validate($rule)->move(ROOT_PATH . DS . 'public/uploads');
        if (strstr($info->getSaveName(), DS)) {
            $array = explode(DS, $info->getSaveName());
            $data['name'] = $array[count($array) - 1];
        } else {
            $data['name'] = $info->getSaveName();
        }
        $res = $this->model->saveFile($data);
        if (!$res) {
            return msg(100, null, $this->model->getError());
        }
        return msg(200, $data, '上传成功');
    }
}
