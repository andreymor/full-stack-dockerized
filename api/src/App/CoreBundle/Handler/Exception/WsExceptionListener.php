<?php

/**
 * Created by IntelliJ IDEA.
 * User: andrey.moretti
 * Date: 27/05/2015
 * Time: 11:27
 */

namespace App\CoreBundle\Handler\Exception;

use App\CoreBundle\Handler\RestJsonHandler;
use Symfony\Component\HttpKernel\Event\GetResponseForExceptionEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;

class WsExceptionListener
{

    /**
     * @param GetResponseForExceptionEvent $event
     * @return bool
     * @throws \Exception
     */
    public function onKernelException(GetResponseForExceptionEvent $event)
    {
        $exception = $event->getException();

        if ($exception instanceof AccessDeniedHttpException) {
            $response = new RestJsonHandler();
            $response = $response->createJsonResponse($exception->getMessage(), $exception->getStatusCode());
            $event->setResponse($response);
        }


    }

    public static function getSubscribedEvents()
    {
        return array(
            KernelEvents::EXCEPTION => array('onKernelException', 999),
        );
    }
}
