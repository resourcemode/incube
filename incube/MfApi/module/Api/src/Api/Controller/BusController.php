<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Api\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\Paginator\Paginator;
use Application\Model\BusMapper;

class BusController extends AbstractRestfulController
{
    public function indexAction()
    {
        $mapper = new BusMapper();
        $request = $this->getRequest();
        if ($request->isGet()) {
            $id = $this->params('id');
            if ($id) {
                $record = $mapper->fetch($id);
                $data = $record->getArrayCopy();
            } else {
                $records = $mapper->fetchAll();
                $records->setItemCountPerPage(10);
                $data = $this->populate($records);
            }
            $response = $this->getResponseWithHeader()
                ->setContent(json_encode($data));
            return $response;
        }
    }

    public function populate($values)
    {
        if ($values instanceof Paginator) {
            $records = array();
            foreach ($values as $key => $value) {
                $records[] = $value->getArrayCopy();
            }
            return $records;
        }
    }

    public function getResponseWithHeader()
    {
        $response = $this->getResponse();
        $response->getHeaders()
            ->addHeaderLine('Access-Control-Allow-Origin','*')
            ->addHeaderLine('Access-Control-Allow-Methods','POST PUT DELETE GET');

        return $response;
    }
    
    public function get($id)
    {
        //sample
        $response = $this->getResponseWithHeader()
                         ->setContent( __METHOD__.' get current data with id =  '.$id);
        return $response;
    }

    public function getList()
    {
        //sample
        $response = $this->getResponseWithHeader()
                        //->setContent(json_encode($data));
                        ->setContent( __METHOD__.' get the list of data');
        return $response;
    }
    
    public function create($data)
    {
        //sample
        $response = $this->getResponseWithHeader()
                         ->setContent( __METHOD__.' create new item of data :
                                                    <b>'.$data['name'].'</b>');
        return $response;
    }
    
    public function update($id, $data)
    {
        //sample
       $response = $this->getResponseWithHeader()
                        ->setContent(__METHOD__.' update current data with id =  '.$id.
                                            ' with data of name is '.$data['name']) ;
       return $response;
    }
    
    public function delete($id)
    {
        //sample
        $response = $this->getResponseWithHeader()
            ->setContent(__METHOD__ . ' delete current data with id =  ' . $id);
        return $response;
    }
}
