<?php

namespace App\CoreBundle\Controller;

use App\CoreBundle\Service\Service;
use App\CoreBundle\Service\ServiceInterface;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Routing\ClassResourceInterface;

class Controller extends FOSRestController implements ClassResourceInterface
{
    protected $service;

    public function __construct(ServiceInterface $service)
    {
        $this->service = $service;
    }

    /**
     * @return object
     */
    public function getService()
    {
        return $this->get($this->service);
    }

    public function resolve($data)
    {
        $contentView = $this->view($data, 200);
        return $this->handleView($contentView);
    }

    public function reject(\Exception $exception)
    {
        $contentView = $this->view($exception->getMessage(), $exception->getCode());
        return $this->handleView($contentView);

    }
}
