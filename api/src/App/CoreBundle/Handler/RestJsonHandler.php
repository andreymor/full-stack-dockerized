<?php

namespace App\CoreBundle\Handler;

use App\CoreBundle\Component\HttpFoundation\JsonResponse;
use FOS\RestBundle\View\View,
    FOS\RestBundle\View\ViewHandler,
    Symfony\Component\HttpFoundation\Request,
    \Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\GetSetMethodNormalizer;
use Symfony\Component\Serializer\Serializer;

class RestJsonHandler
{

    private $messages = array();

    private $serializer;

    public function __construct(\JMS\Serializer\Serializer $serializer)
    {
        $this->serializer = $serializer;
    }

    /**
     * @param View $view
     *
     * @return Response
     */
    public function createResponse(ViewHandler $handler, View $view, Request $request, $format = 'json')
    {
        return $this->createJsonResponse($this->getMessages(), ($view->getStatusCode()) ? : 200, $view->getData(), $view->getHeaders());
    }

    public function createJsonResponse($messages, $code, $data = array(), $headers = array())
    {
        $content = array(
            'status' => $code,
            'messages' => $messages,
            'data' => json_decode($this->serializer->serialize($data, 'json'))
        );

        return new JsonResponse($content, $code, $headers, ")]}',\n");
    }

    public function setMessages($message)
    {
        if (is_array($message) && count($message)) {
            foreach ($message as $message) {
                $this->messages[]['message'] = $message;
            }
        } else {
            $this->messages[0]['message'] = $message;
        }

        return $this;
    }

    public function getMessages()
    {
        return $this->messages;
    }
}