<?php 

namespace App\CoreBundle\Handler\Exception;

use \FOS\RestBundle\View\ExceptionWrapperHandlerInterface;
use \Core\CoreBundle\Handler\Exception\RestWrapperException;

class RestWrapperHandlerException implements ExceptionWrapperHandlerInterface
{
    /**
     * {@inheritdoc}
     */
    public function wrap($data)
    {
        return new RestWrapperException($data);
    }
}
