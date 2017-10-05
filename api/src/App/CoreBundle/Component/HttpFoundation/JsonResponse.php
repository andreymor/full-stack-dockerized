<?php

namespace App\CoreBundle\Component\HttpFoundation;

use Symfony\Component\HttpFoundation\JsonResponse as BaseJsonResponse;

class JsonResponse extends BaseJsonResponse
{
    protected $securityContent;

    /**
     * Constructor.
     *
     * @param mixed $data The response data
     * @param int $status The response status code
     * @param array $headers An array of response headers
     * @param string $securityContent String to set in begin response
     */
    public function __construct($data = null, $status = 200, $headers = array(), $securityContent = null)
    {
        $this->securityContent = $securityContent;
        parent::__construct($data, $status, $headers);
    }


    /**
     * Sets the data to be sent as JSON.
     *
     * @param mixed $data
     *
     * @return JsonResponse
     *
     * @throws \InvalidArgumentException
     */
    public function setData($data = array())
    {
        parent::setData($data);
        if ($this->securityContent) {
            $this->data = $this->securityContent . $this->data;
        }
        return $this->update();
    }


    /**
     * Sets options used while encoding data to JSON.
     *
     * @param int $encodingOptions
     *
     * @return JsonResponse
     */
    public function setEncodingOptions($encodingOptions)
    {
        if ($this->securityContent) {
            $this->data = substr($this->data, strlen($this->securityContent));
        }
        parent::setEncodingOptions($encodingOptions);
    }
}