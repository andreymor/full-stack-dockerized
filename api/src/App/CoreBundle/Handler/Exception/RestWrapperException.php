<?php 

namespace App\CoreBundle\Handler\Exception;

/**
 * Wraps an exception into the FOSRest exception format
 */
class RestWrapperException
{
    /**
     * @var string
     */
    private $codigo;

    /**
     * @var string
     */
    private $mensagens;

    /**
     * @var mixed
     */
    private $resultado;

    /**
     * @param array $data
     */
    public function __construct($data)
    {
        $this->codigo = $data['codigo'];
        $this->mensagens = $data['mensagens'];

        if (isset($data['resultado'])) {
            $this->resultado = $data['resultado'];
        }
    }
}
